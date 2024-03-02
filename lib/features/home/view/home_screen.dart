import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/features/home/view_model/home_view_model.dart';
import 'package:fluttermachine_test_1/features/home/widgets/patient_tile.dart';
import 'package:fluttermachine_test_1/features/home/widgets/search.dart';
import 'package:fluttermachine_test_1/features/home/widgets/sort_filter.dart';
import 'package:fluttermachine_test_1/widgets/custom_submit_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).getPatientList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _home = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: AppColours.white,
      appBar: AppBar(
        backgroundColor: AppColours.white,
        leading: IconButton(
          onPressed: () {},
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
      body: Consumer<HomeViewModel>(
        builder: (context, ref, child) {
          return Column(
            children: [
              SearchTreatments(home: _home),
              vsBox1,
              const SortFilter(),
              const Divider(
                color: AppColours.black,
                thickness: 1,
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: ref.sortedPatientList.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PatientTile(
                      patient: ref.sortedPatientList[index],
                      index: index + 1,
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomTinyActionButton(
          title: "Register Now",
          height: 50,
          width: SizeConfig.screenWidth,
          cornerRadius: 3,
          onPressed: () {},
        ),
      ),
    );
  }
}
