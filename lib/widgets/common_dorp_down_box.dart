import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/features/register/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

class CustomDropDownBox extends StatefulWidget {
  const CustomDropDownBox({
    super.key,
    required this.title,
    required this.hintText,
    this.selectedValue,
    this.listValues,
    required this.onTap,
    required this.ref,
  });
  final String title;
  final String hintText;
  final RegisterViewModel ref;
  final String? selectedValue;
  final List<String>? listValues;
  final void Function(String?) onTap;
  @override
  State<CustomDropDownBox> createState() => _CustomDropDownBoxState();
}

class _CustomDropDownBoxState extends State<CustomDropDownBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppTheme().customTextNormal(
              AppColours.lightBlack,
              18,
            ),
          ),
          vsBox1,
          Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.selectedValue ?? widget.hintText,
                      style: AppTheme().customTextNormal(
                        AppColours.hintTextColor,
                        12,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text(
                                "Select ${widget.title}",
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme().customTextNormal(
                                  AppColours.hintTextColor,
                                  12,
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: widget.listValues?.map((value) {
                                        return GestureDetector(
                                          onTap: () {
                                            // Invoke the callback function with the selected value
                                            log("Tapped value $value");
                                            widget.onTap(value);
                                            Navigator.of(context)
                                                .pop(); // Close dialog
                                          },
                                          child: Text(
                                            value,
                                            style: AppTheme().customTextNormal(
                                              AppColours.lightBlack,
                                              15,
                                            ),
                                          ),
                                        );
                                      }).toList() ??
                                      [],
                                ),
                              ));
                        },
                      );
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
