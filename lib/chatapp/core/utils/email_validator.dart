String? emailValidator(String? email) {
  // Define a regular expression for validating email addresses
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Check if the email is null or empty
  if (email == null || email.isEmpty) {
    return 'Please enter an email address';
  }

  // Check if the email matches the regex
  if (!emailRegex.hasMatch(email)) {
    return 'Please enter a valid email address';
  }

  return null; // If valid, return null (no error)
}
