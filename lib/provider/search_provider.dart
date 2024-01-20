import 'package:get/get_connect/connect.dart';

class SearchProvider extends GetConnect {
  //scope=projects&search=
  Future<Response> search(Map<String, Object>? params) =>
      get('https://git.100tal.com/api/v4/search', query: params);
}
