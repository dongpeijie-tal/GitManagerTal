import 'package:get/get_connect/connect.dart';

class RepositoryProvider extends GetConnect {
  Future<Response> getProjects(Map<String, Object>? params) =>
      get('https://git.100tal.com/api/v4/projects', query: params);
}
