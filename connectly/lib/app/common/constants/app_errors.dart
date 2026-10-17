class AppErrors {
  AppErrors._();

  static const String noInternetConnection =
      'No internet connection. Please check your network.';

  static const String connectionTimeout =
      'Connection timed out. Please try again.';

  static const String sendTimeout =
      'Sending request timed out. Please try again.';

  static const String receiveTimeout =
      'Server response timed out. Please try again.';

  static const String serverError =
      'Server error. Please try again later.';

  static const String networkError =
      'Something went wrong. Please try again.';
}