String? passwordValidator(String? password) {
  // Define a regular expression for validating the password
  final RegExp passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
  );

  // Check if the password is null or empty
  if (password == null || password.isEmpty) {
    return 'Please enter a password';
  }

  // Check if the password matches the regex
  if (!passwordRegex.hasMatch(password)) {
    return 'Password must be at least 8 characters long, include an uppercase letter, '
        'a lowercase letter, a number, and a special character';
  }

  return null; // If valid, return null (no error)
}
