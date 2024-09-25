/// Extension on String to clean HTML tags from text.
extension HTMLClean on String {
  /// Removes all HTML tags from the string.
  ///
  /// Returns a new string with all HTML tags removed.
  String cleanHTML() {
    return replaceAll(RegExp(r'<[^>]*>'), '');
  }
}
