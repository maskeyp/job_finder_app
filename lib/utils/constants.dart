class Constants {
  static const String appName = 'Flutter Firebase Auth';
  static const String emailRegexPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static final RegExp emailRegExp = RegExp(emailRegexPattern);
  static final RegExp passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
}
