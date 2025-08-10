import 'dart:async';
import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:chalkdart/chalkstrings.dart';

typedef ConsoleLogId = String;
typedef ConsoleLogContent = String;
typedef WriteCallback = ConsoleLogContent Function(int terminalWidth, int terminalHeight);

/// Centralized console management for all CLI output operations.
/// This singleton class wraps dart_console and provides a unified interface
/// for all terminal output, ensuring consistent formatting and behavior.
class ConsoleManager {
  static ConsoleManager? _instance;
  late final Console _console;
  bool _didAlreadyInit = false;
  Timer? _refreshTimer;
  
  // Track if we're in raw mode for proper cleanup
  bool _isRawMode = false;
  
  ConsoleManager._() {
    _console = Console();
  }
  
  /// Get the singleton instance of ConsoleManager
  static ConsoleManager get instance {
    _instance ??= ConsoleManager._().._init();
    return _instance!;
  }
  
  /// Get the underlying Console instance for advanced operations
  Console get console => _console;
  
  /// Check if terminal is available
  bool get hasTerminal => stdout.hasTerminal;
  
  // ===== Core Map-based System =====
  
  Map<ConsoleLogId, WriteCallback> consoleLogState = {};
  
  void write(ConsoleLogContent message, {required ConsoleLogId id}) {
    consoleLogState[id] = (_, __) => message;
  }
  
  void writeWithCallback(
    WriteCallback messageCallback, {
    required ConsoleLogId id,
  }) {
    consoleLogState[id] = messageCallback;
  }
  
  void excludeConsoleId(ConsoleLogId id) => consoleLogState.remove(id);
  
  void _init() {
    if (_didAlreadyInit) return;
    _didAlreadyInit = true;
    
    _refreshTimer = Timer.periodic(Duration(milliseconds: 150), (_) {
      final int terminalWidth = _console.windowWidth;
      final int terminalHeight = _console.windowHeight;
      _console.clearScreen();
      _console.resetCursorPosition();
      
      for (final WriteCallback callback in consoleLogState.values) {
        final content = callback(terminalWidth, terminalHeight);
        if (content.isNotEmpty) {
          _console.writeLine(content);
        }
      }
      
      stdout.flush();
    });
  }
  
  // ===== Formatted Message Methods =====
  
  /// Write a line of text (equivalent to print)
  void writeLine(String message, {required ConsoleLogId id, TextAlignment? alignment}) {
    write(message, id: id);
  }
  
  /// Write an info message with icon
  void info(String message, {required ConsoleLogId id}) {
    write('ℹ️  $message'.wheat, id: id);
  }
  
  /// Write an error message with icon
  void error(String message, {required ConsoleLogId id}) {
    write('❌ $message'.red, id: id);
  }
  
  /// Write a warning message with icon
  void warning(String message, {required ConsoleLogId id}) {
    write('⚠️ $message'.yellowBright, id: id);
  }
  
  /// Write a success message with icon
  void success(String message, {required ConsoleLogId id}) {
    write('✅ $message'.green, id: id);
  }
  
  /// Write a dimmed message
  void dim(String message, {required ConsoleLogId id}) {
    write(message.dim, id: id);
  }
  
  /// Write usage/help text
  void usage(String message, {required ConsoleLogId id}) {
    write(message.white, id: id);
  }
  
  // ===== Cursor Position Management =====
  // These are kept for compatibility but do nothing since screen is cleared every refresh
  
  void saveCursorPosition() {
    // No-op in new system
  }
  
  void restoreCursorPosition() {
    // No-op in new system
  }
  
  void clearToEndOfScreen() {
    // No-op in new system
  }
  
  void clearLine() {
    // No-op in new system
  }
  
  void moveCursorUp(int lines) {
    // No-op in new system
  }
  
  void moveCursorDown(int lines) {
    // No-op in new system
  }
  
  void moveCursorToLineStart() {
    // No-op in new system
  }
  
  void moveCursorRight(int columns) {
    // No-op in new system
  }
  
  void hideCursor() {
    _console.write('\x1B[?25l');
  }
  
  void showCursor() {
    _console.write('\x1B[?25h');
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
    _refreshTimer?.cancel();
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
    _refreshTimer?.cancel();
    _console.clearScreen();
    _console.resetCursorPosition();
    _console.writeLine('\n^C');
    dispose();
    exit(0);
  }
  
  /// Calculate how many lines a message will take given terminal width
  int calculateLineCount(String message, {int? maxWidth}) {
    final width = maxWidth ?? _console.windowWidth;
    if (width <= 0) return 1;
    
    // Remove ANSI color codes for accurate length calculation
    final cleanMessage = message.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), '');
    
    if (cleanMessage.isEmpty) return 1;
    return (cleanMessage.length / width).ceil();
  }
  
  /// Wrap text to fit terminal width
  List<String> wrapText(String text, {int? maxWidth}) {
    final width = maxWidth ?? _console.windowWidth;
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
  
  /// Write a table with proper alignment
  void writeTable(List<List<String>> rows, {List<int>? columnWidths, required ConsoleLogId id}) {
    if (rows.isEmpty) return;
    
    writeWithCallback(
      (terminalWidth, _) {
        // Calculate column widths if not provided
        final widths = columnWidths ?? _calculateColumnWidths(rows);
        
        final buffer = StringBuffer();
        for (final row in rows) {
          final formattedRow = <String>[];
          for (var i = 0; i < row.length && i < widths.length; i++) {
            formattedRow.add(row[i].padRight(widths[i]));
          }
          buffer.writeln(formattedRow.join('  '));
        }
        return buffer.toString().trimRight();
      },
      id: id,
    );
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
  
  // Legacy screen management methods - kept for backward compatibility
  void clearScreen() {
    // No-op - screen is cleared automatically in refresh cycle
  }
  
  void resetCursor() {
    // No-op - cursor is reset automatically in refresh cycle
  }
  
  void clearAndReset() {
    // No-op - handled automatically in refresh cycle
  }
  
  void updateProgress(String message, {required ConsoleLogId id}) {
    write(message, id: id);
  }
}