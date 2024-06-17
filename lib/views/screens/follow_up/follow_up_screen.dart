import 'package:cpims_dcs_mobile/views/screens/follow_up/case_event_item.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/court_followup.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/referrals_followup.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/services_followup.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/summons_followup.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';

class FollowUpScreen extends StatefulWidget {
  const FollowUpScreen({super.key});

  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> {
  List<Map<String, dynamic>> caseEvents = [
    {
      "eventType": "CLOSURE",
      "caseCategory": "ALL CASES",
      "dateOfEvent": "2021-10-10",
      "details": "First Summon"
    },
    {
      "eventType": "SUMMON",
      "caseCategory": "ALL CASES",
      "dateOfEvent": "2021-10-10",
      "details": ""
    },
    {
      "eventType": "REFFERAL",
      "caseCategory": "Neglect",
      "dateOfEvent": "2021-10-10",
      "details": "Child care program"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 14),
                  const Text("CASE SUMMARY",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Case Serial",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "CCO/47/287/5/29/3004/2018",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Case Category(s) | Date Of Event	",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "1. Neglect | June 16, 2017",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Referrals",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "No referrals to show",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomCard(
                      title: "Case Events List",
                      children: List.generate(
                          caseEvents.length,
                          (index) => CaseEventItem(
                                data: caseEvents[index],
                                onDelete: () {
                                  caseEvents.removeAt(index);
                                  setState(() {});
                                },
                              ))),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Manage Services",
                    onTap: () {
                      Get.to(() => const ServicesFollowUp());
                    },
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: CustomButton(
                    text: "Manage Court Session",
                    onTap: () {
                      Get.to(() => const CourtFollowUp());
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Manage Summons",
                    onTap: () {
                      Get.to(() => const SummonsFollowUp());
                    },
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: CustomButton(
                    text: "Manage Referrals",
                    onTap: () {
                      Get.to(() => const ReferralsFollowUp());
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            const CustomButton(
              text: "Close",
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
