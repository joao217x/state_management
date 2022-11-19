import 'package:dio/dio.dart';
import 'package:state_management/shared/client/interface/api_client_interface.dart';
import 'package:state_management/shared/client/interface/response/api_reponse_interface.dart';

class DioImpl implements ApiClientInterface {
  final Dio client;

  DioImpl({required this.client});

  @override
  Future<ApiResponseInterface> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.get(path);

    return ApiResponseInterface.fromResponse(response);
  }
}
