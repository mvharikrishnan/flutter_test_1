import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/models/resp_patient_model.dart';
import 'package:fluttermachine_test_1/rest/repository.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel() {
    isLoading = false;
  }
  final _repository = Repository();
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  List<Patient>? patientList = [];
  List<Patient> sortedPatientList = [];
  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> getPatientList() async {
    makeLoadingTrue();
    final response = await _repository.getPatientList();
    patientList = response.data?.patient;
    sortedPatientList = patientList ?? [];
    makeLoadingFalse();
  }
}
