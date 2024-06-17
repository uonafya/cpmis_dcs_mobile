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
            const Text("Date of Visit"),
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
            const Text("Summon Honored?"),
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
            const Text("Notes"),
            const SizedBox(
              height: 6,
            ),
            CustomTextField(
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

  void handleAddService() {
    Get.back();
  }
}
