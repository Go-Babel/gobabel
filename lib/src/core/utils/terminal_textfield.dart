// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chalkdart/chalkstrings.dart';

enum _FocusMode { textfield, options }

/// [prompt] will aprear in the start of the input form
/// [userInputToOptionMapper] will map the user input to a desired map. If the input is not "castable", return null to indicate that the cast can't be done so the user can write other input
/// [errorMessage] will be displayed in red text when the [userInputToOptionMapper] returns null. The user will then keep to continue typing
/// [inputOptions] can be pass to display options choices to the user
/// If the user press esc while focused in the textfield, should return null.
Future<T?> getDataFromInput<T>({
  required String prompt,
  String errorMessage = 'Invalid input, please try again.',
  required T? Function(String item) userInputToOptionMapper,
  InputFormOptions<T>? inputOptions,
  int minWidth = 20,
}) async {
  final completer = Completer<T?>();
  final buffer = StringBuffer();
  var focusMode = _FocusMode.textfield;
  var selectedOptionIndex = 0;
  String? lastError;
  bool firstDraw = true;

  // Convert options to list for indexing
  final optionsList = inputOptions?.options.toList() ?? [];
  var filteredOptions = optionsList;

  // Save terminal settings
  final hasEchoMode = stdin.hasTerminal && stdin.echoMode;
  final hasLineMode = stdin.hasTerminal && stdin.lineMode;

  void updateFilteredOptions() {
    final searchText = buffer.toString().toLowerCase();
    if (searchText.isEmpty) {
      filteredOptions = optionsList;
    } else {
      filteredOptions =
          optionsList.where((option) {
            final optionString = inputOptions!.optionToString(option);
            return optionString.toLowerCase().contains(searchText);
          }).toList();
    }
    // Reset selected index if it's out of bounds
    if (selectedOptionIndex >= filteredOptions.length) {
      selectedOptionIndex = 0;
    }
  }

  void redrawUI() {
    // Calculate how many lines to clear based on what's displayed
    final hasOptions = optionsList.isNotEmpty;
    final hasError = lastError != null;
    final optionsToShow = hasOptions ? min(filteredOptions.length, 5) : 0;

    // Hide cursor during redraw to reduce flicker
    stdout.write('\x1B[?25l');
    
    // Bulletproof redraw strategy:
    // 1. Save cursor position after prompt on first draw
    // 2. Always restore to that position and clear everything below
    // This avoids complex position tracking that causes duplication
    if (!firstDraw) {
      stdout.write('\x1B[u'); // Restore to saved position (after prompt)
      stdout.write('\x1B[J');  // Clear everything from cursor to end of screen
    } else {
      // First draw - save current position as our reference point
      stdout.write('\x1B[s'); // Save cursor position
      firstDraw = false;
    }

    // Draw text field
    _drawTextField(buffer.toString(), focusMode == _FocusMode.textfield);

    // Draw error message if any
    if (hasError) {
      stdout.write('\n');
      stdout.write(' ❌ $lastError'.red);
    }

    // Draw options if available
    if (hasOptions) {
      stdout.write('\n');
      _drawGenericOptions(
        filteredOptions,
        inputOptions!.optionToString,
        selectedOptionIndex,
        focusMode == _FocusMode.options,
      );
    }

    // Position cursor based on focus mode
    if (focusMode == _FocusMode.textfield) {
      // Calculate how many lines we need to move up from current position
      // After drawing, cursor is at the end of the last drawn element
      int linesToMoveUp = 0;
      if (hasOptions) {
        linesToMoveUp += optionsToShow + 1; // All option lines plus spacing
      }
      if (hasError) {
        linesToMoveUp += 1; // Error line
      }
      linesToMoveUp += 2; // Bottom border + one more to get to content line
      
      // Move up to the content line of the textfield
      stdout.write('\x1B[${linesToMoveUp}A');
      
      // Move to the correct horizontal position
      // Start at beginning of line, then move past the prompt and existing text
      stdout.write('\r'); // Move to start of line
      
      // Calculate display content length for cursor position
      final width = _getTerminalWidth();
      final boxWidth = max(width - 4, 20);
      final availableWidth = boxWidth - 4;
      
      // Account for the "> " prefix (2 chars) and the border (1 char)
      int horizontalPosition = 3; // "│> "
      
      // Add the length of the buffer content
      if (buffer.length > availableWidth) {
        // Content is truncated with "..."
        horizontalPosition += availableWidth - 3;
      } else {
        horizontalPosition += buffer.length;
      }
      
      stdout.write('\x1B[${horizontalPosition}C'); // Move to cursor position
    } else {
      // In options mode, cursor should stay where it is (on the selected option)
      // No need to move it
    }
    
    // Show cursor again
    stdout.write('\x1B[?25h');
  }

  try {
    if (stdin.hasTerminal) {
      // Disable echo and line mode for real-time input
      stdin.echoMode = false;
      stdin.lineMode = false;
    }

    // Print initial prompt
    print(prompt);

    // Draw initial UI
    redrawUI();

    // Set up terminal resize handler
    ProcessSignal? resizeSignal;
    StreamSubscription<ProcessSignal>? resizeSubscription;

    if (Platform.isWindows) {
      // Windows doesn't have SIGWINCH, we'll just redraw on each input
    } else {
      // Unix-like systems support SIGWINCH
      try {
        resizeSignal = ProcessSignal.sigwinch;
        resizeSubscription = resizeSignal.watch().listen((_) {
          redrawUI();
        });
      } catch (_) {
        // SIGWINCH not available on this platform
      }
    }

    // Read input character by character
    await for (final key in stdin) {
      // Handle escape sequences (arrow keys, etc.)
      if (key.length >= 3 && key[0] == 27 && key[1] == 91) {
        // ESC [ sequence
        final code = key[2];

        if (code == 65) {
          // Up arrow
          if (focusMode == _FocusMode.options && selectedOptionIndex > 0) {
            selectedOptionIndex--;
            redrawUI();
          }
        } else if (code == 66) {
          // Down arrow
          if (focusMode == _FocusMode.textfield && optionsList.isNotEmpty) {
            focusMode = _FocusMode.options;
            selectedOptionIndex = 0;
            redrawUI();
          } else if (focusMode == _FocusMode.options &&
              selectedOptionIndex < filteredOptions.length - 1) {
            selectedOptionIndex++;
            redrawUI();
          }
        }
        continue;
      }

      // Handle single key presses
      if (key.length == 1) {
        final code = key[0];

        if (code == 27) {
          // ESC key
          if (focusMode == _FocusMode.options) {
            // Go back to textfield
            focusMode = _FocusMode.textfield;
            redrawUI();
          } else {
            // Return null when ESC pressed in textfield
            completer.complete(null);
            break;
          }
        } else if (code == 13 || code == 10) {
          // Enter key
          if (focusMode == _FocusMode.options && filteredOptions.isNotEmpty) {
            // Select the current option
            completer.complete(filteredOptions[selectedOptionIndex]);
            break;
          } else {
            // Try to map the input
            final inputText = buffer.toString();
            final mapped = userInputToOptionMapper(inputText);
            if (mapped != null) {
              completer.complete(mapped);
              break;
            } else {
              // Show error
              lastError = errorMessage;
              redrawUI();
            }
          }
        } else if (code == 127 || code == 8) {
          // Backspace
          if (focusMode == _FocusMode.textfield && buffer.isNotEmpty) {
            final currentText = buffer.toString();
            buffer.clear();
            buffer.write(currentText.substring(0, currentText.length - 1));
            lastError = null; // Clear error on input change
            updateFilteredOptions();
            redrawUI();
          } else if (focusMode == _FocusMode.options) {
            // Go back to textfield on backspace in options mode
            focusMode = _FocusMode.textfield;
            redrawUI();
          }
        } else if (code == 3) {
          // Ctrl+C
          stdout.writeln('\n^C');
          await resizeSubscription?.cancel();
          exit(0);
        } else if (code >= 32 && code <= 126) {
          // Printable character
          if (focusMode == _FocusMode.options) {
            // Switch back to textfield when typing
            focusMode = _FocusMode.textfield;
          }
          buffer.write(String.fromCharCodes(key));
          lastError = null; // Clear error on input change
          updateFilteredOptions();
          redrawUI();
        }
      }
    }

    // Clean up
    await resizeSubscription?.cancel();

    // Clear the UI and move to next line
    stdout.write('\x1B[u'); // Restore to saved position
    stdout.write('\x1B[J');  // Clear everything below
    stdout.write('\n');
  } finally {
    // Restore terminal settings
    if (stdin.hasTerminal) {
      stdin.echoMode = hasEchoMode;
      stdin.lineMode = hasLineMode;
    }
  }

  return completer.future;
}

class InputFormOptions<T> {
  final Set<T> options;
  final String Function(T item) optionToString;
  const InputFormOptions({required this.options, required this.optionToString});
}

Future<String> getTextFieldInput({
  required String prompt,
  Set<String>? options,
  int minWidth = 20,
}) async {
  // Use getDataFromInput with String as the generic type
  final result = await getDataFromInput<String>(
    prompt: prompt,
    userInputToOptionMapper: (input) => input, // Direct string mapping
    inputOptions:
        options != null
            ? InputFormOptions<String>(
              options: options,
              optionToString: (s) => s, // String to string is identity
            )
            : null,
    minWidth: minWidth,
  );

  // Handle null result (ESC pressed) by returning empty string
  return result ?? '';
}

void _drawTextField(String content, bool hasFocus) {
  final width = _getTerminalWidth();
  final boxWidth = max(width - 4, 20); // Leave some margin, minimum 20 chars

  // Calculate content display
  final availableWidth = boxWidth - 4; // Account for "> " prefix and borders
  String displayContent = content;

  // Truncate with ellipsis if too long
  if (content.length > availableWidth) {
    displayContent =
        '...${content.substring(content.length - availableWidth + 3)}';
  }

  // Create the text field box with focus indication
  final borderColor = hasFocus ? (String s) => s.cyan : (String s) => s.gray;
  final topBorder = borderColor('╭${'─' * (boxWidth - 2)}╮');
  final bottomBorder = borderColor('╰${'─' * (boxWidth - 2)}╯');

  // Create content line with padding
  final contentWithPrompt = '> $displayContent';
  final padding = boxWidth - 2 - contentWithPrompt.length;
  final contentLine =
      borderColor('│') + contentWithPrompt + ' ' * padding + borderColor('│');

  // Draw the text field
  stdout.write('$topBorder\n$contentLine\n$bottomBorder');
}

void _drawGenericOptions<T>(
  List<T> options,
  String Function(T) optionToString,
  int selectedIndex,
  bool hasFocus,
) {
  if (options.isEmpty) return;

  final width = _getTerminalWidth();
  final boxWidth = max(width - 4, 20);

  // Show max 5 options
  final maxVisible = 5;
  final visibleOptions = options.take(maxVisible).toList();

  for (int i = 0; i < visibleOptions.length; i++) {
    final option = visibleOptions[i];
    final optionString = optionToString(option);
    final isSelected = i == selectedIndex && hasFocus;

    // Truncate option if too long
    final maxOptionLength =
        boxWidth - 6; // Account for " > " prefix and spacing
    String displayOption = optionString;
    if (optionString.length > maxOptionLength) {
      displayOption = '${optionString.substring(0, maxOptionLength - 3)}...';
    }

    // Format the option line
    String line;
    if (isSelected) {
      line = ' ${'>'.cyan} ${displayOption.cyan}';
    } else {
      line = '   $displayOption';
    }

    stdout.writeln(line);
  }

  if (options.length > maxVisible) {
    stdout.write('   ... and ${options.length - maxVisible} more'.gray);
  }
}

int _getTerminalWidth() {
  // Default width
  int width = 80;

  if (Platform.isWindows) {
    // Windows terminal width detection
    try {
      final result = Process.runSync('powershell', [
        '-Command',
        '\$Host.UI.RawUI.WindowSize.Width',
      ]);
      if (result.exitCode == 0) {
        width = int.tryParse(result.stdout.toString().trim()) ?? 80;
      }
    } catch (_) {
      // Fallback to default
    }
  } else {
    // Unix-like systems
    try {
      final result = Process.runSync('tput', ['cols']);
      if (result.exitCode == 0) {
        width = int.tryParse(result.stdout.toString().trim()) ?? 80;
      }
    } catch (_) {
      // Try stty as fallback
      try {
        final result = Process.runSync('stty', ['size']);
        if (result.exitCode == 0) {
          final parts = result.stdout.toString().trim().split(' ');
          if (parts.length >= 2) {
            width = int.tryParse(parts[1]) ?? 80;
          }
        }
      } catch (_) {
        // Fallback to default
      }
    }
  }

  return width;
}
