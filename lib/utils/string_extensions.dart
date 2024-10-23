
extension StringExtensions on String {
  bool isBlank() {
    return RegExp(r'^[ \t]*$').hasMatch(this);
  }
}