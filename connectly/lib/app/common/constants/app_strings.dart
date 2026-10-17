class AppStrings {
  AppStrings._();

  static const String appTitle = 'Connectly';
  static const String welcomeTitle = 'Welcome to Connectly!';
  static const String welcomeDescription =
      'Connect with people and discover interesting posts.';
  static const String startButton = 'Get Started';
  static const String register = 'Register';
  static const String registerButton = 'Register';
  static const String registerSuccessMessage = 'Account created successfully.';
  static const String registerFailureMessage =
      'Failed to create account. Please try again.';

  // registration field labels
  static const String registerNameLabel = 'Name';
  static const String registerSurnameLabel = 'Surname';
  static const String registerAgeLabel = 'Age';
  static const String registerEmailLabel = 'Email';
  static const String registerAddressLabel = 'Address';

  // registration field hints
  static const String registerNameHint = 'Enter your name';
  static const String registerSurnameHint = 'Enter your surname';
  static const String registerAgeHint = 'Enter your age';
  static const String registerEmailHint = 'Enter your email address';
  static const String registerAddressOptionalHint =
      'Enter your address (optional)';

  // registration validation messages
  static const String registerNameRequired = 'Name is required';
  static const String registerSurnameRequired = 'Surname is required';
  static const String registerAgeInvalid = 'Enter a valid age';
  static const String registerEmailRequired = 'Email is required';
  static const String registerEmailInvalid = 'Enter a valid email address';

  static const String homePageTitle = 'My Contacts';
  static const String homePageSubtitle = 'Discover people in Connectly.';
  static const String tryAgain = 'Try Again';

  // add user form labels and actions
  static const String addUserFormTitle = 'Add User';
  static const String addUserNameHint = 'Name';
  static const String addUserEmailHint = 'Email';
  static const String addUserPhoneHint = 'Phone';
  static const String addUserSubmitButton = 'Add User';
  static const String addUserSuccessMessage = 'User added successfully!';
  static const String addUserFailureMessage =
      'Failed to add user. Please try again.';

  // add user form validation messages
  static const String addUserNameRequired = 'Please enter a name';
  static const String addUserEmailRequired = 'Please enter an email';
  static const String addUserEmailInvalid = 'Please enter a valid email';
  static const String addUserPhoneRequired = 'Please enter a phone number';
  static const String addUserPhoneInvalid =
      'Please enter a valid phone number';
}
