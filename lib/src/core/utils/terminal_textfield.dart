// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/utils/console_manager.dart';

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
  final inputBuffer = StringBuffer();
  var focusMode = _FocusMode.textfield;
  var selectedOptionIndex = 0;
  String? lastError;

  // Convert options to list for indexing
  final optionsList = inputOptions?.options.toList() ?? [];
  var filteredOptions = optionsList;

  // Save terminal settings
  final hasEchoMode = stdin.hasTerminal && stdin.echoMode;
  final hasLineMode = stdin.hasTerminal && stdin.lineMode;

  void updateFilteredOptions() {
    final searchText = inputBuffer.toString().toLowerCase();
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

  // Set up the UI display using callback system
  final console = ConsoleManager.instance;
  
  // Display the prompt
  console.write(prompt, id: 'textfield_prompt');
  
  // Set up the textfield display callback
  console.writeWithCallback(
    (terminalWidth, terminalHeight) {
      final hasOptions = optionsList.isNotEmpty && filteredOptions.isNotEmpty;
      final hasError = lastError != null;
      
      // Build the complete UI
      final uiBuffer = StringBuffer();
      
      // Draw text field
      final textFieldContent = _getTextFieldContent(
        inputBuffer.toString(),
        focusMode == _FocusMode.textfield,
        terminalWidth,
      );
      uiBuffer.write(textFieldContent);
      
      // Draw error message if any
      if (hasError) {
        uiBuffer.write('\n');
        uiBuffer.write(' ❌ $lastError'.red);
      }
      
      // Draw options if available
      if (hasOptions && filteredOptions.isNotEmpty) {
        uiBuffer.write('\n');
        final optionsContent = _getGenericOptionsContent(
          filteredOptions,
          inputOptions!.optionToString,
          selectedOptionIndex,
          focusMode == _FocusMode.options,
          terminalWidth,
        );
        uiBuffer.write(optionsContent);
      }
      
      return uiBuffer.toString();
    },
    id: 'textfield_ui',
  );

  ProcessSignal? resizeSignal;
  StreamSubscription<ProcessSignal>? resizeSubscription;

  // Try to set up SIGWINCH handler for resize events (non-Windows)
  if (!Platform.isWindows) {
    try {
      resizeSignal = ProcessSignal.sigwinch;
      resizeSubscription = resizeSignal.watch().listen((_) {
        // Terminal resized - display will update automatically on next refresh
      });
    } catch (_) {
      // SIGWINCH not available
    }
  }

  try {
    if (stdin.hasTerminal) {
      // Disable echo and line mode for real-time input
      stdin.echoMode = false;
      stdin.lineMode = false;
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
          }
        } else if (code == 66) {
          // Down arrow
          if (focusMode == _FocusMode.textfield &&
              optionsList.isNotEmpty &&
              filteredOptions.isNotEmpty) {
            focusMode = _FocusMode.options;
            selectedOptionIndex = 0;
          } else if (focusMode == _FocusMode.options &&
              selectedOptionIndex < filteredOptions.length - 1) {
            selectedOptionIndex++;
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
            final inputText = inputBuffer.toString();
            final mapped = userInputToOptionMapper(inputText);
            if (mapped != null) {
              completer.complete(mapped);
              break;
            } else {
              // Show error
              lastError = errorMessage;
            }
          }
        } else if (code == 127 || code == 8) {
          // Backspace
          if (focusMode == _FocusMode.textfield && inputBuffer.isNotEmpty) {
            final currentText = inputBuffer.toString();
            inputBuffer.clear();
            inputBuffer.write(currentText.substring(0, currentText.length - 1));
            lastError = null; // Clear error on input change
            updateFilteredOptions();
          } else if (focusMode == _FocusMode.options) {
            // Go back to textfield on backspace in options mode
            focusMode = _FocusMode.textfield;
          }
        } else if (code == 3) {
          // Ctrl+C
          ConsoleManager.instance.handleCtrlC();
        } else if (code >= 32 && code <= 126) {
          // Printable character
          if (focusMode == _FocusMode.options) {
            // Switch back to textfield when typing
            focusMode = _FocusMode.textfield;
          }
          inputBuffer.write(String.fromCharCodes(key));
          lastError = null; // Clear error on input change
          updateFilteredOptions();
        }
      }
    }

    // Clean up
    await resizeSubscription?.cancel();

    // Clear the textfield UI
    console.excludeConsoleId('textfield_prompt');
    console.excludeConsoleId('textfield_ui');
    
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

String _getTextFieldContent(String content, bool hasFocus, int terminalWidth) {
  final boxWidth = max(terminalWidth, 20); // Use full width, minimum 20 chars

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

  // Return the text field
  return '$topBorder\n$contentLine\n$bottomBorder';
}

String _getGenericOptionsContent<T>(
  List<T> options,
  String Function(T) optionToString,
  int selectedIndex,
  bool hasFocus,
  int terminalWidth,
) {
  if (options.isEmpty) return '';

  final buffer = StringBuffer();
  final boxWidth = max(terminalWidth, 20); // Use full width

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

    buffer.writeln(line);
  }

  // Show scroll indicators
  if (options.length > maxVisible) {
    final above = viewportStart;
    final below = options.length - viewportEnd;

    if (above > 0 && below > 0) {
      buffer.write('   ↑ $above more above, ↓ $below more below'.gray);
    } else if (above > 0) {
      buffer.write('   ↑ $above more above'.gray);
    } else if (below > 0) {
      buffer.write('   ↓ $below more below'.gray);
    }
  }

  return buffer.toString().trimRight();
}

// Made visible for testing - now just returns a default width since ConsoleManager handles width
int getTerminalWidth() {
  return 80; // Default width for testing
}