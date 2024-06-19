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
  const SummonsFollowUp({super.key});

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

  void handleAddService() async {
    // TODO: Fix redirection issue
    // caseID captured from elsewhere
    String? caseId = "SomeCaseId";

    if (dateOfVisit == null) {
      Get.snackbar("Error", "Please fill in the date of visit.");
      return;
    }

    if (summonHonored == "Please select") {
      Get.snackbar("Error", "Please select a summon.");
      return;
    }

    // Model instance
    CourtSummonsModel newSummonsModel = CourtSummonsModel(
      honoured: summonHonored == "Yes" ? "true" : "false",
      honouredDate: dateOfVisit,
      summonDate: DateFormat("dd/MM/yyyy")
          .format(DateTime.now()), // Assuming the summon date is today
      summonNote: notes.text,
      caseId: caseId,
    );

    print(newSummonsModel.toJson());
    Get.snackbar("Error", "Please fill all the fields correctly");

    try {
      // Placeholder for sending data to backend
      print("Here1");

      Get.snackbar("Success",
          "Summons added successfully, you can go back to the previous page");
      Get.back();

      print("Here2");
    } catch (e) {
      Get.snackbar("Error", "Please fill all the fields correctly");
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
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please select a date";
                }
                return null;
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
          ],
        ),
      ),
    );
  }
}
