import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';

class SortFilter extends StatelessWidget {
  const SortFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sort by :",
            style: AppTheme().customTextBold(
              AppColours.black,
              15,
            ),
          ),
          Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: AppColours.grey1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date"),
                  Icon(Icons.keyboard_arrow_down_rounded)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
