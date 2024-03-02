import 'package:fluttermachine_test_1/models/resp_treatment_List_model.dart';

class TreatMentOrderModel {
  final Treatment treatment;
  final int male;
  final int female;
  final int index;
  final int orderTotal;
  TreatMentOrderModel(
    this.index, {
    required this.treatment,
    required this.male,
    required this.female,
    required this.orderTotal,
  });
}
