import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/models/resp_branch_list_model.dart';
import 'package:fluttermachine_test_1/models/resp_treatment_List_model.dart';
import 'package:fluttermachine_test_1/models/treatment_order_model.dart';
import 'package:fluttermachine_test_1/rest/repository.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel() {
    isLoading = false;
  }
  bool isLoading = false;
  bool treatMentLoading = false;
  final _repository = Repository();
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerWNumberController = TextEditingController();
  TextEditingController registerAddressController = TextEditingController();
  TextEditingController registerTAmountController = TextEditingController();
  TextEditingController registerDAmountController = TextEditingController();
  TextEditingController registerAAmountController = TextEditingController();
  TextEditingController registerBAmountController = TextEditingController();
  List<String> locationList = ['Kochi', 'Kannur', 'Kozhikode'];
  List<TreatMentOrderModel>? orders;
  List<String>? treatMentList;
  List<Treatment>? treatments;
  List<String>? brachList;
  String? location;
  String? branch;
  String? treatMent;
  int? initialize() {
    getBranchList();
    getTreatMentList();
  }

  getBranchList() async {
    brachList?.clear();
    final response = await _repository.getBranchList();
    brachList = extractBranchNames(response.data?.branches ?? []);
    log(brachList.toString());
    notifyListeners();
  }

  getTreatMentList() async {
    treatMentList?.clear();
    final response = await _repository.getTreatMentList();
    treatments = response.data?.treatments ?? [];
    treatMentList = extractTreatMentNames(response.data?.treatments ?? []);
    log(treatMentList.toString());
    notifyListeners();
  }

  // Function to add TREATEMT model from the value to list
  getTreatMentFromString(String treatmentname) {
    Treatment? order;
    order = findTreatmentByName(treatmentname);
    TreatMentOrderModel res;
    res = TreatMentOrderModel(
      1,
      treatment: order!,
      male: 0,
      female: 0,
    );
    orders?.add(res);
  }

  Treatment? findTreatmentByName(String name) {
    if (treatments == null) return null;

    for (var treatment in treatments!) {
      if (treatment.name == name) {
        return treatment;
      }
    }

    return null; // Return null if treatment with the provided name is not found
  }

  setLoaction(String? value) {
    location = value;
    notifyListeners();
  }

  setBranch(String? value) {
    branch = value;
    notifyListeners();
  }

  setTreatMent(String? value) {
    treatMent = value;
    notifyListeners();
  }

  List<String> extractTreatMentNames(List<Treatment> treatMent) {
    return treatMent.map((treatment) => treatment.name!).toList();
  }

  List<String> extractBranchNames(List<Branch> branches) {
    return branches.map((branch) => branch.name!).toList();
  }

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
