import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:chalkdart/chalkstrings.dart';

/// Centralized console management for all CLI output operations.
/// This singleton class wraps dart_console and provides a unified interface
/// for all terminal output, ensuring consistent formatting and behavior.
class ConsoleManager {
  static ConsoleManager? _instance;
  late final Console _console;
  
  // Track if we're in raw mode for proper cleanup
  bool _isRawMode = false;
  
  // Track last operation for smart clearing
  bool _hasActiveContent = false;
  
  ConsoleManager._() {
    _console = Console();
  }
  
  /// Get the singleton instance of ConsoleManager
  static ConsoleManager get instance {
    _instance ??= ConsoleManager._();
    return _instance!;
  }
  
  /// Get the underlying Console instance for advanced operations
  Console get console => _console;
  
  /// Get terminal width
  int get terminalWidth => _console.windowWidth;
  
  /// Get terminal height
  int get terminalHeight => _console.windowHeight;
  
  /// Check if terminal is available
  bool get hasTerminal => stdout.hasTerminal;
  
  /// Check if any content has been written
  bool get hasActiveContent => _hasActiveContent;
  
  // ===== Basic Output Methods =====
  
  /// Write a line of text (equivalent to print)
  void writeLine(String message, {TextAlignment? alignment}) {
    _hasActiveContent = true;
    if (alignment != null) {
      _console.writeLine(message, alignment);
    } else {
      _console.writeLine(message);
    }
  }
  
  /// Write text without newline (equivalent to stdout.write)
  void write(String message) {
    _hasActiveContent = true;
    _console.write(message);
  }
  
  /// Write empty line
  void writeEmptyLine() {
    writeLine('');
  }
  
  // ===== Formatted Message Methods =====
  
  /// Write an info message with icon
  void info(String message) {
    writeLine('ℹ️  $message'.wheat);
  }
  
  /// Write an error message with icon
  void error(String message) {
    writeLine('❌ $message'.red);
  }
  
  /// Write a warning message with icon
  void warning(String message) {
    writeLine('⚠️ $message'.yellowBright);
  }
  
  /// Write a success message with icon
  void success(String message) {
    writeLine('✅ $message'.green);
  }
  
  /// Write a dimmed message
  void dim(String message) {
    writeLine(message.dim);
  }
  
  /// Write usage/help text
  void usage(String message) {
    writeLine(message.white);
  }
  
  // ===== Screen Management Methods =====
  
  /// Clear the entire screen
  void clearScreen() {
    _console.clearScreen();
    _hasActiveContent = false;
  }
  
  /// Reset cursor to top-left position
  void resetCursor() {
    _console.resetCursorPosition();
  }
  
  /// Clear screen and reset cursor
  void clearAndReset() {
    clearScreen();
    resetCursor();
  }
  
  /// Save current cursor position
  void saveCursorPosition() {
    write('\x1B[s');
  }
  
  /// Restore saved cursor position
  void restoreCursorPosition() {
    write('\x1B[u');
  }
  
  /// Clear from cursor to end of screen
  void clearToEndOfScreen() {
    write('\x1B[J');
  }
  
  /// Clear current line
  void clearLine() {
    write('\r\x1B[2K');
  }
  
  /// Move cursor up by n lines
  void moveCursorUp(int lines) {
    if (lines > 0) {
      write('\x1B[${lines}A');
    }
  }
  
  /// Move cursor down by n lines
  void moveCursorDown(int lines) {
    if (lines > 0) {
      write('\x1B[${lines}B');
    }
  }
  
  /// Move cursor to beginning of line
  void moveCursorToLineStart() {
    write('\r');
  }
  
  /// Move cursor right by n columns
  void moveCursorRight(int columns) {
    if (columns > 0) {
      write('\x1B[${columns}C');
    }
  }
  
  /// Hide cursor
  void hideCursor() {
    write('\x1B[?25l');
  }
  
  /// Show cursor
  void showCursor() {
    write('\x1B[?25h');
  }
  
  // ===== Terminal Mode Methods =====
  
  /// Enable raw mode for character-by-character input
  void enableRawMode() {
    if (!_isRawMode) {
      stdin.echoMode = false;
      stdin.lineMode = false;
      _isRawMode = true;
    }
  }
  
  /// Disable raw mode and return to normal mode
  void disableRawMode() {
    if (_isRawMode) {
      stdin.echoMode = true;
      stdin.lineMode = true;
      _isRawMode = false;
    }
  }
  
  /// Ensure terminal is restored on exit
  void dispose() {
    if (_isRawMode) {
      disableRawMode();
    }
    showCursor(); // Ensure cursor is visible
  }
  
  // ===== Utility Methods =====
  
  /// Flush stdout
  void flush() {
    stdout.flush();
  }
  
  /// Handle Ctrl+C gracefully
  void handleCtrlC() {
    writeLine('\n^C');
    dispose();
    exit(0);
  }
  
  /// Calculate how many lines a message will take given terminal width
  int calculateLineCount(String message, {int? maxWidth}) {
    final width = maxWidth ?? terminalWidth;
    if (width <= 0) return 1;
    
    // Remove ANSI color codes for accurate length calculation
    final cleanMessage = message.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), '');
    
    if (cleanMessage.isEmpty) return 1;
    return (cleanMessage.length / width).ceil();
  }
  
  /// Wrap text to fit terminal width
  List<String> wrapText(String text, {int? maxWidth}) {
    final width = maxWidth ?? terminalWidth;
    if (width <= 0 || text.length <= width) return [text];
    
    final lines = <String>[];
    var remaining = text;
    
    while (remaining.isNotEmpty) {
      if (remaining.length <= width) {
        lines.add(remaining);
        break;
      }
      
      // Try to break at word boundary
      var breakIndex = width;
      for (var i = width; i > 0; i--) {
        if (remaining[i - 1] == ' ') {
          breakIndex = i;
          break;
        }
      }
      
      lines.add(remaining.substring(0, breakIndex).trim());
      remaining = remaining.substring(breakIndex).trim();
    }
    
    return lines;
  }
  
  /// Write a progress message that updates in place
  void updateProgress(String message) {
    clearLine();
    write(message);
    flush();
  }
  
  /// Write a table with proper alignment
  void writeTable(List<List<String>> rows, {List<int>? columnWidths}) {
    if (rows.isEmpty) return;
    
    // Calculate column widths if not provided
    final widths = columnWidths ?? _calculateColumnWidths(rows);
    
    for (final row in rows) {
      final formattedRow = <String>[];
      for (var i = 0; i < row.length && i < widths.length; i++) {
        formattedRow.add(row[i].padRight(widths[i]));
      }
      writeLine(formattedRow.join('  '));
    }
  }
  
  List<int> _calculateColumnWidths(List<List<String>> rows) {
    if (rows.isEmpty) return [];
    
    final columnCount = rows.first.length;
    final widths = List<int>.filled(columnCount, 0);
    
    for (final row in rows) {
      for (var i = 0; i < row.length && i < columnCount; i++) {
        // Remove ANSI codes for width calculation
        final cleanText = row[i].replaceAll(RegExp(r'\x1B\[[0-9;]*m'), '');
        if (cleanText.length > widths[i]) {
          widths[i] = cleanText.length;
        }
      }
    }
    
    return widths;
  }
}