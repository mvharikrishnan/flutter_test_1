import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/features/register/view_model/register_view_model.dart';
import 'package:fluttermachine_test_1/widgets/common_dorp_down_box.dart';
import 'package:provider/provider.dart';

class AddTreatMentDialog extends StatelessWidget {
  const AddTreatMentDialog({super.key});

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
                ],
              ),
            );
          },
        ));
  }
}
