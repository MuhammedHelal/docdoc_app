abstract class AppRegex {
  static const _hasLowerCase = r'^(?=.*[a-z])';
  static const _hasUpperCase = r'^(?=.*[A-Z])';
  static const _hasNumber = r'^(?=.*[0-9])';
  static const _hasSpecialCharacter = r'^(?=.*[!@#\$&*~])';
  static const _hasMinLength = r'.{8,}';

  static bool hasLowerCase(String password) =>
      RegExp(_hasLowerCase).hasMatch(password);

  static bool hasUpperCase(String password) =>
      RegExp(_hasUpperCase).hasMatch(password);

  static bool hasNumber(String password) =>
      RegExp(_hasNumber).hasMatch(password);

  static bool hasSpecialCharacter(String password) =>
      RegExp(_hasSpecialCharacter).hasMatch(password);

  static bool hasMinLength(String password) =>
      RegExp(_hasMinLength).hasMatch(password);
}
