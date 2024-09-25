extension HTMLClean on String {
  String cleanHTML() {
    return replaceAll(RegExp(r'<[^>]*>'), '');
  }
}
