abstract class Endpoints {
  static const String baseUrl = 'https://exam.elevateegy.com';
  static const String signUp = '/api/v1/auth/signup';
  static const String login = '/api/v1/auth/signin';
  static const String forgotPassword = '/api/v1/auth/forgotPassword';
  static const String verifyResetCode = '/api/v1/auth/verifyResetCode';
  static const String resetPassword = '/api/v1/auth/resetPassword';
  static const String getUserData = '/api/v1/auth/profileData';
  static const String logout = '/api/v1/auth/logout';
  static const String editProfile = '/api/v1/auth/editProfile';
  static const String changePassword = '/api/v1/auth/changePassword';
  static const String getAllSubjects = '/api/v1/subjects';
}
