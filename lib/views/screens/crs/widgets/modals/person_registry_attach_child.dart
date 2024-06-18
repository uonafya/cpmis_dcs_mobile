import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_perpetrators_modal.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PersonRegistryAttachSiblingModal extends StatefulWidget {
  const PersonRegistryAttachSiblingModal({super.key});

  @override
  State<PersonRegistryAttachSiblingModal> createState() =>
      _PersonRegistryAttachSiblingModalState();
}

class _PersonRegistryAttachSiblingModalState
    extends State<PersonRegistryAttachSiblingModal> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: const EdgeInsets.all(20.0), children: [
        const Padding(padding: EdgeInsets.only(top: 20.0)),
        const FormPageHeading(
          heading: "Add Sibling",
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
        h2Text("Class"),
        CustomDropdown(
          initialValue: "Please Select",
          items: childClass,
          onChanged: (val) {
            setState(() {});
          },
        ),
        const SizedBox(height: 15),
        h2Text("Remarks"),
        const CustomTextField(maxLines: 4)
      ]),
    );
  }
}
