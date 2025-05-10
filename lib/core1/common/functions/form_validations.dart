bool isValidEmail(String input) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return emailRegex.hasMatch(input);
}

bool isValidPhoneNumber(String input) {
  final phoneRegex = RegExp(r'^\d{10}$');
  return phoneRegex.hasMatch(input);
}

bool isValidPassword(String input) {
  return input.length >= 8;
}

String? validateEmailOrPhone(String? input, String hintText) {
  if (input == null || input.isEmpty) {
    return '$hintText is missing';
  }
  if (!isValidEmail(input) && !isValidPhoneNumber(input)) {
    return 'Enter a valid email or a 10-digit phone number';
  }
  return null;
}

String? validatePassword(String? input, String hintText) {
  if (input == null || input.isEmpty) {
    return '$hintText is missing';
  }
  if (!isValidPassword(input)) {
    return '$hintText must be at least 8 characters long';
  }
  return null;
}
