import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/features/home/view_model/home_view_model.dart';
import 'package:fluttermachine_test_1/widgets/custom_submit_button.dart';

class SearchTreatments extends StatelessWidget {
  const SearchTreatments({
    super.key,
    required HomeViewModel home,
  }) : _home = home;

  final HomeViewModel _home;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: SizeConfig.screenWidth * 4 / 6,
            decoration: BoxDecoration(
              color: AppColours.textBoxColor,
              borderRadius: BorderRadius.circular(
                cornerRadiusLarge,
              ),
              border: Border.all(
                color: AppColours.grey1,
              ),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: _home.searchController,
              cursorColor: AppColours.black,
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: AppColours.textBoxColor,
                border: InputBorder.none,
                hintText: 'Search for treatments',
                hintStyle: AppTheme().customTextNormal(
                  AppColours.hintTextColor,
                  12,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CustomTinyActionButton(
            title: "Search",
            height: 50,
            width: SizeConfig.screenWidth * 1 / 4,
            cornerRadius: 3,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
