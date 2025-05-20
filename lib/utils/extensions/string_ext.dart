extension StringExt on String {
  bool get isValidUrl {
    final urlPattern = RegExp(
      r'^(https?:\/\/)?' // схема: http або https
      r'([\w\-]+\.)+[\w\-]+' // домен
      r'(:\d+)?' // порт (необов'язково)
      r'(\/[^\s]*)?$', // шлях (необов'язково)
      caseSensitive: false,
    );

    return urlPattern.hasMatch(
      this,
    );
  }
}
