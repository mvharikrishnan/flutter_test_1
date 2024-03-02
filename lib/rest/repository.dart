import 'package:dio/dio.dart';
import 'package:fluttermachine_test_1/models/resp_success.dart';
import 'package:fluttermachine_test_1/rest/api_client.dart';
import 'package:fluttermachine_test_1/rest/server_errors.dart';
import 'package:fluttermachine_test_1/rest/server_response.dart';

class Repository {
  late Dio _dio;
  late ApiClient _apiClient;

  Repository() {
    _dio = Dio();
    _apiClient = ApiClient(_dio);
  }

  //Authentication
  Future<ServerResponse<UserLoginModel>> checkUserExist(
    String email,
    String password,
  ) async {
    UserLoginModel response;
    try {
      response = await _apiClient.userLogin(email, password);
    } catch (e) {
      ServerError error = ServerError.withError(error: e as DioException);
      return ServerResponse()..error = error;
    }
    return ServerResponse()..data = response;
  }
}
