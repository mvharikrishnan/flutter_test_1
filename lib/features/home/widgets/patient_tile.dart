import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/validators_and_formatters.dart';
import 'package:fluttermachine_test_1/models/resp_patient_model.dart';

class PatientTile extends StatelessWidget {
  const PatientTile({
    super.key,
    required this.patient,
    required this.index,
  });
  final Patient patient;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColours.hintTextColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    '${index.toString()}.',
                    style: AppTheme()
                        .customTextNormal(
                          AppColours.black,
                          15,
                        )
                        .copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patient.name ?? "",
                        style: AppTheme()
                            .customTextNormal(
                              AppColours.black,
                              15,
                            )
                            .copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (patient.patientdetailsSet.isNotEmpty)
                        Text(
                          patient.patientdetailsSet[index].treatmentName ?? " ",
                          style: AppTheme()
                              .customTextNormal(
                                AppColours.secondary,
                                15,
                              )
                              .copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month_outlined,
                                color: AppColours.lightOrange3,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                ValidatorAndFormatters()
                                    .convertDateTimeFormat(patient.createdAt!),
                                style: AppTheme()
                                    .customTextNormal(
                                      AppColours.textGrey,
                                      14,
                                    )
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.people_outline,
                                color: AppColours.lightOrange3,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                patient.user,
                                style: AppTheme()
                                    .customTextNormal(
                                      AppColours.textGrey,
                                      14,
                                    )
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColours.textGrey,
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('View Booking Details'),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColours.secondary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
