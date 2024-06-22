// ignore_for_file: use_build_context_synchronously

import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/followup_closure.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/closure_followup_model.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/lists.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_forms_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class CloseFollowup extends StatefulWidget {
  const CloseFollowup({super.key, required this.caseLoad});
  final CaseLoadModel caseLoad;

  @override
  State<CloseFollowup> createState() => _CourtFollowUpState();
}

class _CourtFollowUpState extends State<CloseFollowup> {
  final caseCategories = ["Please select", "Neglect"];
  String caseCategory = "Please select";
  final courtSessionTypeList = [
    "Please select",
    "Transferred to another organization unit",
    "Child reintegrated into education",
    "Child removed from exploitative situation",
    "Lost contact (Dropped out)",
    "Other outcomes (Standard intervention)"
  ];
  String courtSessionType = "Please select";
  String serviceProvider = serviceProviderList[0]["title"]!;
  final courtNotes = TextEditingController();
  List<dynamic> selectedServices = [];
  String? dateOfService;

  final ClosureDatabaseHelper closureDatabaseHelper = ClosureDatabaseHelper();

  void handleAddService() async {
    // caseID captured from elsewhere
    String? caseId = widget.caseLoad.caseID;
    // String? caseId = "1233";
    String? formId = "closure_followup";

    if (courtSessionType == "Please select") {
      showErrorSnackBar(context, "Please select a court session type.");
      return;
    }

    if (dateOfService == null) {
      showErrorSnackBar(context, "Please fill in the date of service.");
      return;
    }

    if (caseCategory == "Please select") {
      showErrorSnackBar(context, "Please select a case category.");
      return;
    }

    // InterventionList instance
    List<InterventionList> interventionList = [
      InterventionList(
        intervention: courtSessionType,
        caseCategory: caseCategory == "Please select" ? null : caseCategory,
      ),
    ];

    // Create model instance
    ClosureFollowupModel closureFollowupModel = ClosureFollowupModel(
      caseId: caseId,
      formId: formId,
      caseOutcome: courtSessionType,
      dateOfCaseClosure: dateOfService,
      caseClosureNotes: courtNotes.text,
      interventionList: interventionList,
    );

    try {
      await closureDatabaseHelper.insertClosureFollowup(closureFollowupModel);

      Get.back(); // Navigate back
      showSuccessSnackBar(context, "Case closure saved successfully.");
    } catch (e) {
      // Handle error
      showErrorSnackBar(context, "Failed to save case closure.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Case Closure"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          const SizedBox(
            height: 14,
          ),
          const Text("Case Outcome *"),
          const SizedBox(
            height: 6,
          ),
          CustomDropdown(
              initialValue: courtSessionType,
              items: courtSessionTypeList,
              onChanged: (val) {
                setState(() {
                  courtSessionType = val;
                });
              }),
          const SizedBox(
            height: 14,
          ),
          const Text("Date of Outcome *"),
          const SizedBox(
            height: 6,
          ),
          CustomFormsDatePicker(
            onDateSelected: (val) {
              dateOfService = DateFormat("dd/MM/yyyy").format(val);
              setState(() {});
            },
          ),
          const SizedBox(
            height: 14,
          ),
          if (courtSessionType != "Please select")
            const SizedBox(
              height: 14,
            ),
          if (courtSessionType != "Please select")
            const Text("Application Outcome"),
          if (courtSessionType != "Please select")
            const SizedBox(
              height: 6,
            ),
          if (courtSessionType != "Please select")
            CustomDropdown(
                initialValue: caseCategory,
                items: caseCategories,
                onChanged: (val) {
                  setState(() {
                    caseCategory = val;
                  });
                }),
          const SizedBox(
            height: 14,
          ),
          const Text("Case Closure Notes"),
          const SizedBox(
            height: 6,
          ),
          CustomTextField(
            maxLines: 5,
            hintText: "Notes",
            controller: courtNotes,
          ),
          const SizedBox(
            height: 14,
          ),
          CustomButton(text: "Save", onTap: handleAddService),
          const SizedBox(
            height: 20,
          ),
          // TODO: REMOVE IN PRODUCTION
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
          //         final ClosureFollowupModel? closureFollowupModel =
          //             await closureDatabaseHelper
          //                 .getClosureFollowup("SomeCaseId");
          //         print(closureFollowupModel?.caseId);
          //       },
          //     )
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     const Text(
          //       'Deletion Test...',
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
          //           await closureDatabaseHelper.deleteClosureFollowup("1233");
          //          showSuccessSnackBar(context, message) "Delete successful.");
          //         } catch (e) {
          //           Get.snackbar("Error", "Failed to delete.");
          //         }
          //       },
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
