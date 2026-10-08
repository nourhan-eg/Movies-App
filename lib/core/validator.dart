import 'package:movies/core/app_texts.dart';

class Validators {
  static final RegExp _nameRegex = RegExp(r'^[\p{L} ]{2,}$', unicode: true);

  static final RegExp _emailRegex = RegExp(
    r'^[\w.+-]+@[\w-]+(\.[\w-]+)*\.[a-zA-Z]{2,}$',
  );

  // At least 8 characters, one letter and one number
  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d).{8,}$',
  );

  // Egyptian mobile number: 010, 011, 012 or 015 followed by 8 digits
  static final RegExp _phoneRegex = RegExp(r'^01[0125]\d{8}$');

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppTexts.valEnterName;
    }
    if (!_nameRegex.hasMatch(value.trim())) {
      return AppTexts.valNameLettersOnly;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppTexts.valEnterEmail;
    }
    if (!_emailRegex.hasMatch(value.trim())) {
      return AppTexts.valInvalidEmail;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AppTexts.valEnterPassword;
    }
    if (!_passwordRegex.hasMatch(value)) {
      return AppTexts.valPasswordMinLength;
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return AppTexts.valConfirmPassword;
    }
    if (value != password) {
      return AppTexts.valPasswordsDoNotMatch;
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppTexts.valEnterPhone;
    }
    if (!_phoneRegex.hasMatch(value.trim())) {
      return AppTexts.valInvalidPhone;
    }
    return null;
  }
}