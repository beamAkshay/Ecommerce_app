class FormValidation {
  static String? password;

  //Empty Field validation
  static String? emptyFieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required.';
    }
    return null;
  }

  //Email Validation
  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'The Email field is required.';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  //First Name Validation
  static String? firstNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'The First Name field is required.';
    }
    return null;
  }

  //Last Name Validation
  static String? lastNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'The Last Name field is required.';
    }
    return null;
  }

  //Password Validation
  static String? passwordValidation(String? value) {
    password = value;
    if (value == null || value.isEmpty) {
      return 'The Password field is required.';
    }
    return null;
  }

  //Confirm Password Validation
  static String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'The Confirm Password field is required.';
    } else if (password != value) {
      return 'The Confirm Password field does not match the Password field.';
    }
    return null;
  }

  //Phone number validation
  static String? phoneNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'The Phone field is required.';
    } else if (value.length != 10) {
      return 'The Phone field must be exactly 10 characters in length.';
    }
    return null;
  }

  //Password validation for Account information page
  static String? accountInfoPasswordValidation(String? value) {
    password = value;
    return null;
  }

  //Confirm Password validation for Account information page
  static String? accountInfoConfirmPasswordValidation(String? value) {
    if (password != value) {
      return 'The Confirm Password field does not match the Password field.';
    }
    return null;
  }
}
