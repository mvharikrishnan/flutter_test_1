import 'package:dio/dio.dart';
import 'package:fluttermachine_test_1/models/resp_branch_list_model.dart';
import 'package:fluttermachine_test_1/models/resp_patient_model.dart';
import 'package:fluttermachine_test_1/models/resp_success.dart';
import 'package:fluttermachine_test_1/models/resp_treatment_List_model.dart';
import 'package:fluttermachine_test_1/rest/interceptors.dart';
import 'package:fluttermachine_test_1/rest/ip_class.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options.connectTimeout = const Duration(seconds: 60000);
    dio.options.receiveTimeout = const Duration(seconds: 60000);
    dio.interceptors.add(LoggingInterceptors());
    dio.interceptors.add(AppInterceptors());
    return _ApiClient(dio, baseUrl: kBaseUrl);
  }

  //Authentication
  @MultiPart()
  @POST(kLogin)
  @Header('Content-Type: multipart/form-data')
  Future<UserLoginModel> userLogin(
    @Part(name: 'username') String userName,
    @Part(name: 'password') String passWord,
  );

  @MultiPart()
  @GET(kPatientList)
  @Header('Content-Type: multipart/form-data')
  Future<PatientListModel> getPatientList();

  @MultiPart()
  @GET(kBranch)
  @Header('Content-Type: multipart/form-data')
  Future<BranchListModel> getBranchList();

  @MultiPart()
  @GET(kTreatmentList)
  @Header('Content-Type: multipart/form-data')
  Future<TreatmentListModel> getTreatMentList();
}


// flutter pub run build_runner build --delete-conflicting-outputs