import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/followup_summons.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/summons_model.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/lists.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_forms_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class SummonsFollowUp extends StatefulWidget {
  const SummonsFollowUp({super.key, required this.caseLoad});
  final CaseLoadModel caseLoad;

  @override
  State<SummonsFollowUp> createState() => _SummonsFollowUpState();
}

class _SummonsFollowUpState extends State<SummonsFollowUp> {
  final caseCategories = ["Please select", "Neglect"];
  String caseCategory = "Please select";
  final summonHonoredList = ["Please select", "Yes", "No"];
  String summonHonored = "Please select";
  String serviceProvider = serviceProviderList[0]["title"]!;
  final notes = TextEditingController();
  List<dynamic> selectedServices = [];
  String? dateOfVisit;
  final formKey = GlobalKey<FormState>();

  final CourtSummonsDatabaseHelper courtSummonsDatabaseHelper =
      CourtSummonsDatabaseHelper();

  void handleAddService() async {
    String? caseId = widget.caseLoad.caseID;
    print("Here I am");

    if (dateOfVisit == null) {
      Get.snackbar("Error", "Please fill in the date of visit.");
      return;
    }

    if (summonHonored == "Please select") {
      Get.snackbar("Error", "Please select whether the summon was honored.");
      return;
    }

    // Create CourtSummonsModel instance
    CourtSummonsModel courtSummonsModel = CourtSummonsModel(
      caseId: caseId,
      honoured: summonHonored == "Yes" ? "AYES" : "ANO",
      honouredDate: dateOfVisit,
      summonDate: DateFormat("yyyy-MM-dd")
          .format(DateTime.now()), // Using yyyy-MM-dd format
      summonNote: notes.text,
    );

    print(courtSummonsModel.toJson());

    try {
      final courtSummonsDatabaseHelper = CourtSummonsDatabaseHelper();
      await courtSummonsDatabaseHelper.insertCourtSummons(courtSummonsModel);
      print('Saved court summons :)');

      Get.back(); // Navigate back
      Get.snackbar("Success",
          "Summons added successfully, you can go back to the previous page");
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", "Failed to save court summons. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Encounters/Services"),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          children: [
            const SizedBox(
              height: 14,
            ),
            const Text("Summon Count"),
            const SizedBox(
              height: 6,
            ),
            const Text(
              "1",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text("Date of Visit *"),
            const SizedBox(
              height: 6,
            ),
            CustomFormsDatePicker(
              onDateSelected: (val) {
                dateOfVisit = DateFormat("dd/MM/yyyy").format(val);
                setState(() {});
              },
            ),
            const SizedBox(
              height: 14,
            ),
            const Text("Summon Honored? *"),
            const SizedBox(
              height: 6,
            ),
            CustomDropdown(
                initialValue: summonHonored,
                items: summonHonoredList,
                onChanged: (val) {
                  setState(() {
                    summonHonored = val;
                  });
                }),
            const SizedBox(
              height: 14,
            ),
            const Text("Notes *"),
            const SizedBox(
              height: 6,
            ),
            CustomTextField(
              maxLines: 5,
              hintText: "Notes",
              controller: notes,
            ),
            const SizedBox(
              height: 14,
            ),
            CustomButton(text: "Save", onTap: handleAddService),
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
            //           print('Retrieving court summons...');
            //           final courtSummonsDatabaseHelper =
            //               CourtSummonsDatabaseHelper();
            //           final CourtSummonsModel? courtSummonsModel =
            //               await courtSummonsDatabaseHelper.getCourtSummons(
            //                   "1232"); // Replace with actual case ID

            //           if (courtSummonsModel != null) {
            //             print(courtSummonsModel.toJson());
            //             Get.snackbar(
            //                 "Success", "Court summons retrieved successfully.");
            //           } else {
            //             Get.snackbar("Error",
            //                 "No court summons found for this case ID.");
            //           }
            //         } catch (e) {
            //           print(e.toString());
            //           Get.snackbar(
            //               "Error", "Failed to retrieve court summons.");
            //         }
            //       },
            //     )
            //   ],
            // ),
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
            //         'Delete',
            //         style: TextStyle(
            //           color: Colors.red,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       onTap: () async {
            //         try {
            //           print('Deleting court summons...');
            //           final courtSummonsDatabaseHelper =
            //               CourtSummonsDatabaseHelper();
            //           await courtSummonsDatabaseHelper.deleteCourtSummons(
            //               "1232"); // Replace with actual case ID
            //           print('Deleted court summons :)');
            //           Get.snackbar(
            //               "Success", "Court summons deleted successfully.");
            //         } catch (e) {
            //           print(e.toString());
            //           Get.snackbar("Error", "Failed to delete court summons.");
            //         }
            //       },
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
