import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/lists.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_forms_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class CourtFollowUp extends StatefulWidget {
  const CourtFollowUp({super.key});

  @override
  State<CourtFollowUp> createState() => _CourtFollowUpState();
}

class _CourtFollowUpState extends State<CourtFollowUp> {
  final caseCategories = ["Please select", "Neglect"];
  String caseCategory = "Please select";
  final courtSessionTypeList = [
    "Please select",
    "Application",
    "Plea Taking",
    "Hearing",
    "Mention"
  ];
  String courtSessionType = "Please select";
  String serviceProvider = serviceProviderList[0]["title"]!;
  final courtNotes = TextEditingController();
  List<dynamic> selectedServices = [];
  String? dateOfService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Court Session"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          const SizedBox(
            height: 14,
          ),
          const Text("Case category *"),
          const SizedBox(
            height: 6,
          ),
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
          const Text("Date of Court Session"),
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
          const Text("Court Session Type"),
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
          const Text("Court Session Notes"),
          const SizedBox(
            height: 6,
          ),
          CustomTextField(
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

  void handleAddService() {
    Get.back();
  }
}
