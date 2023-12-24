import 'package:get/get_connect/connect.dart';

class UserProvider extends GetConnect {
  Future<Response> getUser(Map<String, String>? headers) =>
      get('https://git.100tal.com/api/v4/projects', headers: headers);
}
