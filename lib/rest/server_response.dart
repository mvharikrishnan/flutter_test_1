import 'package:fluttermachine_test_1/rest/server_errors.dart';

class ServerResponse<T> {
  ServerError? error;
  T? data;
}
