abstract class InputValidationUtils {
  static bool isValidName(String name) {
    return name.isNotEmpty && name.length >= 2;
  }

  static bool isInvalidName(String name) {
    return !isValidName(name);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    const pattern = r'^(01|07)\d{8}$';
    final regExp = RegExp(pattern);
    return phoneNumber.isNotEmpty && regExp.hasMatch(phoneNumber);
  }

  static bool isInvalidPhoneNumber(String phoneNumber) {
    return !isValidPhoneNumber(phoneNumber);
  }
}