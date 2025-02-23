import 'dart:core';

/// Checks if the phone number is valid.
bool isValidPhone(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (isRequired && (inputString == null || inputString.isEmpty)) {
    return false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    if (inputString.length > 16 || inputString.length < 6) return false;

    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]*$';
    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

/// Checks if the password is valid.
/// Password should have:
/// - At least one uppercase letter
/// - At least one lowercase letter
/// - At least one digit
/// - At least one special character (@#$%^&+-)
/// - Length of at least 4
/// - No whitespace allowed
bool isValidPassword(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (isRequired && (inputString == null || inputString.isEmpty)) {
    return false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+\-])[A-Za-z\d@#$%^&+\-]{4,}$';
    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

/// Checks if the string consists only of alphabets (no whitespace).
bool isText(String? inputString, {bool isRequired = false}) {
  if (isRequired && (inputString == null || inputString.isEmpty)) {
    return false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z]+$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(inputString);
  }

  return false;
}

/// Checks if the string is a valid email.
bool isValidEmail(String? inputString, {bool isRequired = false}) {
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    return true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(inputString);
  }

  return false;
}
