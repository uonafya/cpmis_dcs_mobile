import 'package:cpims_dcs_mobile/models/registry/registry_sibling_model.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_perpetrators_modal.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../controller/registry_provider.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_date_picker.dart';

class PersonRegistryAttachSiblingModal extends StatefulWidget {
  const PersonRegistryAttachSiblingModal({super.key});

  @override
  State<PersonRegistryAttachSiblingModal> createState() =>
      _PersonRegistryAttachSiblingModalState();
}

class _PersonRegistryAttachSiblingModalState
    extends State<PersonRegistryAttachSiblingModal> {
  bool _isChecked = false;

  String firstName = "";
  String surName = "";
  String? otherNames;
  String? dateOfBirth;
  String sex = "";
  String currentClass = "";
  String? remarks;

  @override
  Widget build(BuildContext context) {

    RegistryProvider registryProvider = Provider.of<RegistryProvider>(context);

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
        CustomTextField(
            hintText: 'First Name',
          onChanged: (value) {
              setState(() {
                firstName = value;
              });
    },
        ),
        const SizedBox(height: 15),
        h2Text("Surname"),
        CustomTextField(
            hintText: 'Surname',
          onChanged: (value) {
              setState(() {
                surName = value;
              });
    },
        ),
        const SizedBox(height: 15),
        h2Text("Other Name(s)"),
        CustomTextField(
            hintText: 'Other Names',
          onChanged: (value) {
              setState(() {
                otherNames = value;
              });
    },
        ),
        const SizedBox(height: 15),
        h2Text("Date of Birth"),
        CustomDatePicker(
          hintText: 'Date of Birth',
          lastDate: DateTime.now(),
          firstDate: DateTime(1900),
          onChanged: (val) {
            dateOfBirth =
                DateFormat('yyyy-MM-dd').format(val);
          },
          validator: (val) {
            if (val!.isEmpty) {
              return 'Please select a date';
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        h2Text("Sex"),
        CustomDropdown(
          initialValue: "Please Select",
          items: const ["Please Select", "Male", "Female"],
          onChanged: (value) {
            setState(() {
              sex = value;
            });
          },
        ),
        const SizedBox(height: 15),
        h2Text("Class"),
        CustomDropdown(
          initialValue: "Please Select",
          items: childClass,
          onChanged: (value) {
            setState(() {
              currentClass = value;
            });
          },
        ),
        const SizedBox(height: 15),
        h2Text("Remarks"),
        CustomTextField(
            maxLines: 4,
          onChanged: (value) {
              setState(() {
                remarks = value;
              });
          },
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Cancel',
                textColor: Colors.white,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: CustomButton(
                text: "Submit",
                textColor: Colors.white,
                onTap: () {
                  RegistrySiblingModel sibling = RegistrySiblingModel(firstName: firstName, surName: surName, sex: sex, dateOfBirth: dateOfBirth, currentClass: currentClass);
                  registryProvider.addSibling(sibling);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
