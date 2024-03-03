import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/features/register/view_model/register_view_model.dart';
import 'package:fluttermachine_test_1/widgets/common_dorp_down_box.dart';
import 'package:fluttermachine_test_1/widgets/custom_submit_button.dart';
import 'package:provider/provider.dart';

class AddTreatMentDialog extends StatelessWidget {
  const AddTreatMentDialog({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: AppColours.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        insetPadding: EdgeInsets.all(SizeConfig.screenWidth * .08),
        child: Consumer<RegisterViewModel>(
          builder: (context, ref, child) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomDropDownBox(
                    selectedValue: ref.treatMent,
                    title: "Choose Treatment",
                    ref: ref,
                    hintText: 'Choose prefered treatment',
                    listValues: ref.treatMentList,
                    onTap: (value) {
                      ref.setTreatMent(value);
                    },
                  ),
                  vsBox1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Add Patients",
                        style: AppTheme().customTextNormal(
                          AppColours.black,
                          14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColours.grey1,
                          borderRadius: BorderRadius.circular(
                            cornerRadiusLarge,
                          ),
                          border: Border.all(
                            color: AppColours.grey2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Male',
                            style: AppTheme().customTextNormal(
                              AppColours.black,
                              14,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Counterbutton(icon: Icons.remove),
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColours.grey1,
                              borderRadius: BorderRadius.circular(
                                cornerRadiusLarge,
                              ),
                              border: Border.all(
                                color: AppColours.grey2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: AppTheme().customTextNormal(
                                  AppColours.black,
                                  14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Counterbutton(icon: Icons.add),
                        ],
                      )
                    ],
                  ),
                  vsBox1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColours.grey1,
                          borderRadius: BorderRadius.circular(
                            cornerRadiusLarge,
                          ),
                          border: Border.all(
                            color: AppColours.grey2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Female',
                            style: AppTheme().customTextNormal(
                              AppColours.black,
                              14,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Counterbutton(icon: Icons.remove),
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColours.grey1,
                              borderRadius: BorderRadius.circular(
                                cornerRadiusLarge,
                              ),
                              border: Border.all(
                                color: AppColours.grey2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: AppTheme().customTextNormal(
                                  AppColours.black,
                                  14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Counterbutton(
                            icon: Icons.add,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  vsBox1,
                  CustomTinyActionButton(
                    title: 'Save',
                    isLoading: ref.treatMentLoading,
                    onPressed: () {
                      ref.getTreatMentFromString(ref.treatMent ?? "");
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}

class Counterbutton extends StatelessWidget {
  const Counterbutton({
    super.key,
    required this.icon,
    this.onTap,
  });
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColours.secondary,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColours.grey2,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: AppColours.white,
          ),
        ),
      ),
    );
  }
}
