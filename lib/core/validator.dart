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
      return 'Please enter your name';
    }
    if (!_nameRegex.hasMatch(value.trim())) {
      return 'Name must contain letters only (at least 2)';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    if (!_emailRegex.hasMatch(value.trim())) {
      return 'Invalid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (!_passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters with a letter and a number';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }
    if (!_phoneRegex.hasMatch(value.trim())) {
      return 'Invalid phone number';
    }
    return null;
  }
}