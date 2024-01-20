import 'package:get/get_connect/connect.dart';

class SearchProvider extends GetConnect {
  //scope=projects&search=
  Future<Response> searchProjects(Map<String, Object>? params) =>
      get('https://git.100tal.com/api/v4/search', query: params);
}
