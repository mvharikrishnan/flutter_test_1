import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/features/register/view_model/register_view_model.dart';
import 'package:fluttermachine_test_1/features/register/widgets/add_treatment_dialog.dart';
import 'package:fluttermachine_test_1/widgets/common_dorp_down_box.dart';
import 'package:fluttermachine_test_1/widgets/common_text_form_field.dart';
import 'package:fluttermachine_test_1/widgets/custom_submit_button.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _registerRef = Provider.of<RegisterViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registerRef.initialize();
    });
    return Scaffold(
        backgroundColor: AppColours.white,
        appBar: AppBar(
          backgroundColor: AppColours.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 30,
              ),
            )
          ],
        ),
        body: Consumer<RegisterViewModel>(
          builder: (context, ref, child) {
            return Column(
              children: [
                const Divider(
                  color: AppColours.textGrey,
                  thickness: 1,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight - 120,
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: ref.registerNameController,
                            title: 'Name',
                            hintText: 'Enter your Name',
                          ),
                          CustomTextField(
                            controller: ref.registerWNumberController,
                            title: 'Whatsapp Number',
                            hintText: 'Enter your Whatsapp Number',
                          ),
                          CustomTextField(
                            controller: ref.registerAddressController,
                            title: 'Address',
                            hintText: 'Enter your Full Address',
                          ),
                          CustomDropDownBox(
                            selectedValue: ref.location,
                            title: "Location",
                            hintText: 'Choose Location',
                            listValues: ref.locationList,
                            ref: ref,
                            onTap: (value) {
                              ref.setLoaction(value);
                            },
                          ),
                          CustomDropDownBox(
                            selectedValue: ref.branch,
                            title: "Branch",
                            ref: ref,
                            hintText: 'Choose Branch',
                            listValues: ref.brachList,
                            onTap: (value) {
                              ref.setBranch(value);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Treatments",
                                  style: AppTheme().customTextNormal(
                                    AppColours.lightBlack,
                                    18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListBody(
                            children: ref.orders?.map((value) {
                                  return Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: AppColours.hintTextColor
                                          .withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 15, right: 15),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  '${value.index.toString()}.',
                                                  style: AppTheme()
                                                      .customTextNormal(
                                                        AppColours.black,
                                                        15,
                                                      )
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      value.treatment.name ??
                                                          "",
                                                      style: AppTheme()
                                                          .customTextNormal(
                                                            AppColours.black,
                                                            15,
                                                          )
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList() ??
                                [],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CustomTinyActionButton(
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => AddTreatMentDialog(
                                    index: ref.orders!.length - 1),
                              ),
                              title: '+ Add Treatments',
                            ),
                          ),
                          CustomTextField(
                            controller: ref.registerTAmountController,
                            title: 'Total Amount',
                            keyboardType: TextInputType.number,
                          ),
                          CustomTextField(
                            controller: ref.registerDAmountController,
                            title: 'Discount Amount',
                            keyboardType: TextInputType.number,
                          ),
                          CustomTextField(
                            controller: ref.registerAAmountController,
                            title: 'Advance Amount',
                            keyboardType: TextInputType.number,
                          ),
                          CustomTextField(
                            controller: ref.registerBAmountController,
                            title: 'Balance Amount',
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
