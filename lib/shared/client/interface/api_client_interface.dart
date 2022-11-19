import 'package:state_management/shared/client/interface/response/api_reponse_interface.dart';

abstract class ApiClientInterface {
  Future<ApiResponseInterface> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
}
