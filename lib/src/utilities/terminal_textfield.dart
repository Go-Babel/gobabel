import 'dart:async';
import 'dart:io';
import 'dart:math';

Future<String> getTextFieldInput({
  required String prompt,
  int minWidth = 20,
}) async {
  final completer = Completer<String>();
  final buffer = StringBuffer();
  
  // Save terminal settings
  final hasEchoMode = stdin.hasTerminal && stdin.echoMode;
  final hasLineMode = stdin.hasTerminal && stdin.lineMode;
  
  try {
    if (stdin.hasTerminal) {
      // Disable echo and line mode for real-time input
      stdin.echoMode = false;
      stdin.lineMode = false;
    }
    
    // Print initial prompt
    print(prompt);
    
    // Draw initial text field
    _drawTextField(buffer.toString());
    
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
          // Clear current line and redraw
          stdout.write('\r${' ' * _getTerminalWidth()}\r');
          _drawTextField(buffer.toString());
        });
      } catch (_) {
        // SIGWINCH not available on this platform
      }
    }
    
    // Read input character by character
    await for (final key in stdin) {
      final char = String.fromCharCodes(key);
      
      // Handle special keys
      if (key.length == 1) {
        final code = key[0];
        
        if (code == 13 || code == 10) {
          // Enter key - finish input
          break;
        } else if (code == 127 || code == 8) {
          // Backspace
          if (buffer.isNotEmpty) {
            final currentText = buffer.toString();
            buffer.clear();
            buffer.write(currentText.substring(0, currentText.length - 1));
            _drawTextField(buffer.toString());
          }
        } else if (code == 3) {
          // Ctrl+C
          stdout.writeln('\n^C');
          await resizeSubscription?.cancel();
          exit(0);
        } else if (code >= 32 && code <= 126) {
          // Printable character
          buffer.write(char);
          _drawTextField(buffer.toString());
        }
      }
    }
    
    // Clean up
    await resizeSubscription?.cancel();
    
    // Move to next line after input
    stdout.writeln();
    
    completer.complete(buffer.toString());
  } finally {
    // Restore terminal settings
    if (stdin.hasTerminal) {
      stdin.echoMode = hasEchoMode;
      stdin.lineMode = hasLineMode;
    }
  }
  
  return completer.future;
}

void _drawTextField(String content) {
  final width = _getTerminalWidth();
  final boxWidth = max(width - 4, 20); // Leave some margin, minimum 20 chars
  
  // Clear current line
  stdout.write('\r${' ' * width}\r');
  
  // Calculate content display
  final availableWidth = boxWidth - 4; // Account for "> " prefix and borders
  String displayContent = content;
  
  // Truncate with ellipsis if too long
  if (content.length > availableWidth) {
    displayContent = '...${content.substring(content.length - availableWidth + 3)}';
  }
  
  // Create the text field box
  final topBorder = '╭${'─' * (boxWidth - 2)}╮';
  final bottomBorder = '╰${'─' * (boxWidth - 2)}╯';
  
  // Create content line with padding
  final contentWithPrompt = '> $displayContent';
  final padding = boxWidth - 2 - contentWithPrompt.length;
  final contentLine = '│$contentWithPrompt${' ' * padding}│';
  
  // Draw the text field
  stdout.write('$topBorder\n$contentLine\n$bottomBorder');
  
  // Move cursor back to input position
  stdout.write('\x1B[2A'); // Move up 2 lines
  stdout.write('\x1B[${3 + displayContent.length}C'); // Move to cursor position
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