
extension TextValidators on String {
  bool isValidEmail() => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
      .hasMatch(trim());

  bool isValidPassword() {
    return length >= 3;
  }

  bool isValidPhone() =>
      trim().isNotEmpty && int.parse(trim()).toString().length >= 4;

  bool isValidOTP() => trim().length == 6;

  bool isValidName() => trim().isNotEmpty;

  Validation phoneValidation() {
    if (trim().isEmpty) {
      return Validation(isValid: false, error: "Empty Phone");
    } else if (int.parse(trim()).toString().length < 6) {
      return Validation(isValid: false, error: "Invalid Phone");
    } else {
      return Validation(isValid: true);
    }
  }

  Validation emailValidation() {
    if (trim().isEmpty) {
      return Validation(isValid: false, error: "Empty email");
    } else if (RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
        .hasMatch(trim())) {
      return Validation(isValid: true);
    } else {
      return Validation(isValid: false, error: "Invalid Email");
    }
  }
}

class Validation {
  final bool isValid;
  final String error;

  bool get isNotValid => !isValid;

  Validation({required this.isValid, this.error = ''});
}
