import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_perpetrators_modal.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PersonRegistryAttachCareGiver extends StatefulWidget {
  const PersonRegistryAttachCareGiver({super.key});

  @override
  State<PersonRegistryAttachCareGiver> createState() =>
      _PersonRegistryAttachCareGiverState();
}

class _PersonRegistryAttachCareGiverState
    extends State<PersonRegistryAttachCareGiver> {
  bool _isChecked = false;
  List<String> childRelationship = [
    "None",
    "Adoptive Father",
    "Adoptive Mother",
    "Foster Father",
    "Foster Mother",
    "Other Relative",
    "Parent (Father)",
    "Parent (Mother)",
    "Guardian",
    "Next of Kin",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Padding(padding: EdgeInsets.only(top: 20.0)),
          const FormPageHeading(
            heading: "Attach Caregiver",
            hasClosePage: true,
          ),
          Row(
            children: [
              h2Text("CPIMS registered caregiver"),
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false; // Update the state
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          h2Text("Search Caregiver"),
          const CustomTextField(hintText: 'Caregiver - 5646'),
          const SizedBox(height: 10),
          h2Text("First Name"),
          const CustomTextField(hintText: 'First Name'),
          const SizedBox(height: 15),
          h2Text("Surname"),
          const CustomTextField(hintText: 'Surname'),
          const SizedBox(height: 15),
          h2Text("Other Name(s)"),
          const CustomTextField(hintText: 'Other Names'),
          const SizedBox(height: 15),
          h2Text("Date of Birth"),
          const CustomTextField(hintText: 'Date of Birth'),
          const SizedBox(height: 15),
          h2Text("Sex"),
          CustomDropdown(
            initialValue: "Please Select",
            items: const ["Please Select", "Male", "Female"],
            onChanged: (val) {
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          h2Text("Relationship with Child"),
          CustomDropdown(
            initialValue: "None",
            items: childRelationship,
            onChanged: (val) {
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          h2Text("National ID No"),
          const CustomTextField(hintText: 'National ID'),
          const SizedBox(height: 15),
          h2Text("MobileNumber:"),
          const CustomTextField(hintText: 'Cellphone Number'),
        ],
      ),
    );
  }
}
