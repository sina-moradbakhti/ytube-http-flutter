class ServiceConfig {
  ServiceConfig._();

  static const String baseURL = 'https://snrsbysina.herokuapp.com';
  static Uri testAPIUri = Uri.parse('${ServiceConfig.baseURL}/test');
  static Uri usersAPIUri = Uri.parse('${ServiceConfig.baseURL}/users');
  static Uri loginAPIUri = Uri.parse('${ServiceConfig.baseURL}/login');
}
