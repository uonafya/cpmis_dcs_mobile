// ignore_for_file: use_build_context_synchronously

import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:get/route_manager.dart';

import 'package:cpims_dcs_mobile/core/network/followup_referrals.dart';
import 'package:cpims_dcs_mobile/models/referrals_followup_model.dart.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/lists.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class ReferralsFollowUp extends StatefulWidget {
  const ReferralsFollowUp({super.key});

  @override
  State<ReferralsFollowUp> createState() => _ReferralsFollowUpState();
}

class _ReferralsFollowUpState extends State<ReferralsFollowUp> {
  String caseCategory = caseCategoryList[0]["title"]!;

  final referralList = ["Please select", "Non-State Actors", "State Agency"];
  String referral = "Please select";

  List<dynamic> selectedServices = [];
  String specifiedReferral = specifyReferralList[0]["title"]!;
  String referralFor = referralForList[0]["title"]!;

  final ReferralDatabaseHelper referralDatabaseHelper =
      ReferralDatabaseHelper();

  void handleAddReferral() async {
    String? caseId = "1232";

    if (caseCategory == "Please select") {
      showErrorSnackBar(context, "Please select a case category.");
      return;
    }

    if (referral == "Please select") {
      showErrorSnackBar(context, "Please select a referral actor.");
      return;
    }

    if (specifiedReferral == "Please select") {
      showErrorSnackBar(context, "Please select a specified referral.");
      return;
    }

    if (referralFor == "Please select") {
      showErrorSnackBar(context, "Please select what the referral is for.");
      return;
    }

    // Create ReferralModel instance
    ReferralModel referralModel = ReferralModel(
      caseId: caseId,
      caseCategory: caseCategory,
      referralActor: referral,
      specifiedReferral: specifiedReferral,
      referralFor: referralFor,
    );

    try {
      final referralDatabaseHelper = ReferralDatabaseHelper();
      await referralDatabaseHelper.insertReferral(referralModel);

      Get.back(); // Navigate back
      showSuccessSnackBar(context, "Referral added successfully.");
    } catch (e) {
      showErrorSnackBar(context, "Failed to save referral. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Referrals"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          const SizedBox(
            height: 14,
          ),
          const Text("Case Category"),
          const SizedBox(
            height: 6,
          ),
          CustomDropdown(
              initialValue: caseCategory,
              items: caseCategoryList.map((e) => e["title"]!).toList(),
              onChanged: (val) {
                setState(() {
                  caseCategory = val;
                });
              }),
          const SizedBox(
            height: 14,
          ),
          const Text("Referral Actor"),
          const SizedBox(
            height: 6,
          ),
          CustomDropdown(
              initialValue: referral,
              items: referralList,
              onChanged: (val) {
                setState(() {
                  referral = val;
                });
              }),
          const SizedBox(
            height: 14,
          ),
          const Text("Specify"),
          const SizedBox(
            height: 6,
          ),
          CustomDropdown(
              initialValue: specifiedReferral,
              items: specifyReferralList.map((e) => e["title"]!).toList(),
              onChanged: (val) {
                setState(() {
                  specifiedReferral = val;
                });
              }),
          const SizedBox(
            height: 14,
          ),
          const Text("Referral For"),
          const SizedBox(
            height: 6,
          ),
          CustomDropdown(
              initialValue: referralFor,
              items: referralForList.map((e) => e["title"]!).toList(),
              onChanged: (val) {
                setState(() {
                  referralFor = val;
                });
              }),
          const SizedBox(
            height: 14,
          ),
          CustomButton(text: "Save", onTap: handleAddReferral),
          const SizedBox(
            height: 10,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     const Text(
          //       'Upstream Test Syncing...',
          //       style: TextStyle(color: Colors.grey),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     GestureDetector(
          //       child: const Text(
          //         'Sync',
          //         style: TextStyle(
          //           color: kPrimaryColor,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       onTap: () async {
          //         try {
          //           print('Retrieving referral...');
          //           final referralDatabaseHelper = ReferralDatabaseHelper();
          //           final ReferralModel? referralModel =
          //               await referralDatabaseHelper
          //                   .getReferral("1232"); // Replace with actual case ID

          //           if (referralModel != null) {
          //             print(referralModel.toJson());
          //             Get.snackbar(
          //                 "Success", "Referral retrieved successfully.");
          //           } else {
          //             Get.snackbar(
          //                 "Error", "No referral found for this case ID.");
          //           }
          //         } catch (e) {
          //           print(e.toString());
          //           Get.snackbar("Error", "Failed to retrieve referral.");
          //         }
          //       },
          //     )
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     const Text(
          //       'Delete...',
          //       style: TextStyle(color: Colors.grey),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     GestureDetector(
          //       child: const Text(
          //         'Sync',
          //         style: TextStyle(
          //           color: Colors.red,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       onTap: () async {
          //         try {
          //           print('Deleting referral...');
          //           final referralDatabaseHelper = ReferralDatabaseHelper();
          //           await referralDatabaseHelper.deleteReferral("1232");
          //           print('Deleted referral :)');
          //           Get.snackbar("Success", "Referral deleted successfully.");
          //         } catch (e) {
          //           print(e.toString());
          //           Get.snackbar("Error", "Failed to delete referral.");
          //         }
          //       },
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }

  void handleAddService() {}
}
