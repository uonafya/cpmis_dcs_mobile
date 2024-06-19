import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/lists.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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

  // TODO: Uncomment when the model information is available
  // void handleAddService() async {
  //   // caseID captured from elsewhere
  //   String? caseId = "SomeCaseId";

  //   if (caseCategory == "Please select") {
  //     Get.snackbar("Error", "Please select a case category.");
  //     return;
  //   }

  //   if (referral == "Please select") {
  //     Get.snackbar("Error", "Please select a referral actor.");
  //     return;
  //   }

  //   if (specifiedReferral == "Please select") {
  //     Get.snackbar("Error", "Please select a specified referral.");
  //     return;
  //   }

  //   if (referralFor == "Please select") {
  //     Get.snackbar("Error", "Please select a referral for.");
  //     return;
  //   }

  //   // Create model instance
  //   ReferralFollowupModel referralFollowupModel = ReferralFollowupModel(
  //     caseId: caseId,
  //     caseCategory: caseCategory,
  //     referralActor: referral,
  //     specifiedReferral: specifiedReferral,
  //     referralFor: referralFor,
  //   );

  //   print(referralFollowupModel.toJson());

  //   try {
  //     Get.back(); // Navigate back
  //     Get.snackbar("Success", "Referral Followup saved successfully.");
  //   } catch (e) {
  //     Get.snackbar("Error", "An error occurred. Please try again.");
  //   }
  // }

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
          CustomButton(text: "Save", onTap: handleAddService),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void handleAddService() {}
}
