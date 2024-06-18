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
  const CloseFollowup({super.key});

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

  void handleAddService() async {
    if (courtSessionType == "Please select" || dateOfService == null) {
      Get.snackbar("Error", "Please fill all required fields.");
      return;
    }

    // Create model instance
    ClosureFollowupModel closureFollowupModel = ClosureFollowupModel(
      caseOutcome: courtSessionType,
      dateOfCaseClosure: dateOfService,
      caseClosureNotes: courtNotes.text,
      // Add other fields as necessary
    );

    print(closureFollowupModel.toJson());

    // Convert model to JSON
    Map<String, dynamic> dataToSend = closureFollowupModel.toJson();

    try {
      // Placeholder for sending data to backend
      // final response = await YourService.sendClosureFollowup(dataToSend);

      Get.back(); // Navigate back
      Get.snackbar("Success", "Case closure saved successfully.");
    } catch (e) {
      // Handle error
      Get.snackbar("Error", "Failed to save case closure.");
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
            height: 10,
          ),
        ],
      ),
    );
  }
}
