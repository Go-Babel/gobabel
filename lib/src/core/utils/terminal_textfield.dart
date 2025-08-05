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
///
/// Note: For VS Code integrated terminal users:
/// - Terminal width detection may not update dynamically
/// - To improve experience, set "dart.cliConsole": "terminal" in VS Code settings
/// - Or add "console": "terminal" to your launch.json configuration
Future<T?> getDataFromInput<T>({
  required String prompt,
  String errorMessage = 'Invalid input, please try again.',
  required T? Function(String item) userInputToOptionMapper,
  InputFormOptions<T>? inputOptions,
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
      filteredOptions = optionsList.where((option) {
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
    final hasOptions = optionsList.isNotEmpty && filteredOptions.isNotEmpty;
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
      stdout.write('\x1B[J'); // Clear everything from cursor to end of screen
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
    if (hasOptions && filteredOptions.isNotEmpty) {
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
        // Options + newline before them
        linesToMoveUp += optionsToShow + 1;
      }
      if (hasError) {
        linesToMoveUp += 2; // Error line + newline before error
      }
      linesToMoveUp += 1; // Bottom border line to get to content line

      // Move up to the content line of the textfield
      stdout.write('\x1B[${linesToMoveUp}A');

      // Move to the correct horizontal position
      // Start at beginning of line, then move past the prompt and existing text
      stdout.write('\r'); // Move to column 0 (start of line)

      // Calculate display content length for cursor position
      final width = getTerminalWidth();
      final boxWidth = max(width, 20); // Use full width
      final availableWidth = max(10, boxWidth - 4); // Ensure minimum space

      // Account for the "│ > " prefix: border (1) + space (1) + > (1) + space (1) = 4
      // The cursor needs to be positioned AFTER the typed text
      int horizontalPosition = 4; // "│ > "

      // Add the length of the buffer content
      if (buffer.length > availableWidth && availableWidth > 3) {
        // Content is truncated with "..."
        horizontalPosition += availableWidth;
      } else if (buffer.length > availableWidth) {
        // Very narrow, no ellipsis
        horizontalPosition += availableWidth;
      } else {
        // Content fits
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

    // Try to set up SIGWINCH handler for resize events
    // This may not work in all environments (e.g., VS Code integrated terminal)
    if (!Platform.isWindows) {
      try {
        resizeSignal = ProcessSignal.sigwinch;
        resizeSubscription = resizeSignal.watch().listen((_) {
          // Force a redraw on resize signal
          redrawUI();
        });
      } catch (_) {
        // SIGWINCH not available - width will still update on each redraw
      }
    }

    // For environments where SIGWINCH doesn't work (VS Code, Windows),
    // the terminal width is checked on every redraw operation

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
          if (focusMode == _FocusMode.textfield &&
              optionsList.isNotEmpty &&
              filteredOptions.isNotEmpty) {
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
    stdout.write('\x1B[J'); // Clear everything below
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
}) async {
  // Use getDataFromInput with String as the generic type
  final result = await getDataFromInput<String>(
    prompt: prompt,
    userInputToOptionMapper: (input) => input, // Direct string mapping
    inputOptions: options != null
        ? InputFormOptions<String>(
            options: options,
            optionToString: (s) => s, // String to string is identity
          )
        : null,
  );

  // Handle null result (ESC pressed) by returning empty string
  return result ?? '';
}

void _drawTextField(String content, bool hasFocus) {
  final width = getTerminalWidth();
  final boxWidth = max(width, 20); // Use full width, minimum 20 chars

  // Calculate content display
  final availableWidth = max(
    boxWidth - 4,
    10,
  ); // Account for "> " prefix and borders, min 10 chars
  String displayContent = content;

  // Truncate with ellipsis if too long
  if (content.length > availableWidth && availableWidth > 3) {
    // Only add ellipsis if we have space for it
    displayContent =
        '...${content.substring(content.length - (availableWidth - 3))}';
  } else if (content.length > availableWidth) {
    // If very narrow, just truncate without ellipsis
    displayContent = content.substring(content.length - availableWidth);
  }

  // Create the text field box with focus indication
  final borderColor = hasFocus ? (String s) => s.cyan : (String s) => s.gray;
  final borderChars = max(0, boxWidth - 2); // Ensure non-negative border length
  final topBorder = borderColor('╭${'─' * borderChars}╮');
  final bottomBorder = borderColor('╰${'─' * borderChars}╯');

  // Create content line with padding
  final contentWithPrompt = ' > $displayContent';
  final padding = max(
    0,
    boxWidth - 2 - contentWithPrompt.length,
  ); // Ensure non-negative padding
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

  final width = getTerminalWidth();
  final boxWidth = max(width, 20); // Use full width

  // Show max 5 options with viewport scrolling
  final maxVisible = 5;

  // Calculate viewport start index to keep selected item in middle when possible
  int viewportStart;
  if (options.length <= maxVisible) {
    // If we have 5 or fewer options, show them all
    viewportStart = 0;
  } else {
    // Calculate viewport to keep selected item in middle (position 2)
    if (selectedIndex < 2) {
      // Near the start, can't center
      viewportStart = 0;
    } else if (selectedIndex >= options.length - 3) {
      // Near the end, can't center
      viewportStart = options.length - maxVisible;
    } else {
      // Middle section, center the selected item
      viewportStart = selectedIndex - 2;
    }
  }

  // Get the visible slice of options
  final viewportEnd = min(viewportStart + maxVisible, options.length);
  final visibleOptions = options.sublist(viewportStart, viewportEnd);

  // Draw each visible option
  for (int i = 0; i < visibleOptions.length; i++) {
    final option = visibleOptions[i];
    final optionString = optionToString(option);
    final actualIndex = viewportStart + i;
    final isSelected = actualIndex == selectedIndex && hasFocus;

    // Truncate option if too long
    final maxOptionLength = max(
      10,
      boxWidth - 6,
    ); // Account for " > " prefix and spacing, min 10 chars
    String displayOption = optionString;
    if (optionString.length > maxOptionLength && maxOptionLength > 3) {
      displayOption = '${optionString.substring(0, maxOptionLength - 3)}...';
    } else if (optionString.length > maxOptionLength) {
      // If very narrow, just truncate without ellipsis
      displayOption = optionString.substring(0, maxOptionLength);
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

  // Show scroll indicators
  if (options.length > maxVisible) {
    final above = viewportStart;
    final below = options.length - viewportEnd;

    if (above > 0 && below > 0) {
      stdout.write('   ↑ $above more above, ↓ $below more below'.gray);
    } else if (above > 0) {
      stdout.write('   ↑ $above more above'.gray);
    } else if (below > 0) {
      stdout.write('   ↓ $below more below'.gray);
    }
  }
}

// Made visible for testing
int getTerminalWidth() {
  // Try Dart's native terminal width detection first
  try {
    if (stdout.hasTerminal) {
      final columns = stdout.terminalColumns;
      // VS Code sometimes returns 0, so validate the result
      if (columns > 0) {
        return columns;
      }
    }
  } catch (_) {
    // StdoutException or other errors - continue to fallbacks
  }

  // Check if running in VS Code
  final isVSCode = Platform.environment.containsKey('VSCODE_PID') ||
      (Platform.environment['TERM_PROGRAM'] == 'vscode');

  if (isVSCode) {
    // VS Code typically has wider terminals, use 100 as default
    return 100;
  }

  // Platform-specific fallbacks for when stdout.terminalColumns fails
  if (Platform.isWindows) {
    // Windows terminal width detection
    try {
      final result = Process.runSync('powershell', [
        '-Command',
        '\$Host.UI.RawUI.WindowSize.Width',
      ]);
      if (result.exitCode == 0) {
        final width = int.tryParse(result.stdout.toString().trim());
        if (width != null && width > 0) {
          return width;
        }
      }
    } catch (_) {
      // Continue to next fallback
    }
  } else {
    // Unix-like systems
    try {
      final result = Process.runSync('tput', ['cols']);
      if (result.exitCode == 0) {
        final width = int.tryParse(result.stdout.toString().trim());
        if (width != null && width > 0) {
          return width;
        }
      }
    } catch (_) {
      // Try stty as fallback
      try {
        final result = Process.runSync('stty', ['size']);
        if (result.exitCode == 0) {
          final parts = result.stdout.toString().trim().split(' ');
          if (parts.length >= 2) {
            final width = int.tryParse(parts[1]);
            if (width != null && width > 0) {
              return width;
            }
          }
        }
      } catch (_) {
        // Continue to default
      }
    }
  }

  // Default width - use 80 for standard terminals
  return 80;
}
