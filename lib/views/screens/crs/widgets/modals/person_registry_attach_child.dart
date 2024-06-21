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
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/input_validation_utils.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_date_picker.dart';

const String FIRST_NAME_INPUT_ERROR = "Please enter a valid first name.";
const String SUR_NAME_INPUT_ERROR = "Please enter a valid surname.";
const String SEX_DROPDOWN_ERROR = "Please select a sex.";
const String CLASS_DROPDOWN_ERROR = "Please select a class.";

class PersonRegistryAttachSiblingModal extends StatefulWidget {
  const PersonRegistryAttachSiblingModal({super.key});

  @override
  State<PersonRegistryAttachSiblingModal> createState() =>
      _PersonRegistryAttachSiblingModalState();
}

class _PersonRegistryAttachSiblingModalState
    extends State<PersonRegistryAttachSiblingModal> {

  String firstName = "";
  String surName = "";
  String? otherNames;
  String? dateOfBirth;
  String sex = "";
  String currentClass = "";
  String? remarks;
  String? firstNameError = FIRST_NAME_INPUT_ERROR;
  String? surNameError = SUR_NAME_INPUT_ERROR;
  String? sexError = SEX_DROPDOWN_ERROR;
  String? classError = CLASS_DROPDOWN_ERROR;
  bool shouldValidateFields = false;

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
        const SizedBox(height: 10),
        h2Text("First Name *"),
        CustomTextField(
          hintText: 'First Name',
          error: shouldValidateFields ? firstNameError : null,
          onChanged: (value) {
              setState(() {
                firstName = value;
                if (InputValidationUtils.isInvalidName(value)) {
                  firstNameError = FIRST_NAME_INPUT_ERROR;
                  return;
                }
                firstNameError = null;
              });
          },
        ),
        const SizedBox(height: 15),
        h2Text("Surname *"),
        CustomTextField(
          hintText: 'Surname',
          error: shouldValidateFields ? surNameError : null,
          onChanged: (value) {
            setState(() {
              surName = value;
              if (InputValidationUtils.isInvalidName(value)) {
                surNameError = SUR_NAME_INPUT_ERROR;
                return;
              }
              surNameError = null;
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
        h2Text("Sex *"),
        CustomDropdown(
          initialValue: "Please Select",
          error: shouldValidateFields ? sexError : null,
          items: const [ "Male", "Female"],
          onChanged: (value) {
            setState(() {
              sex = value;
              if (value.isEmpty) {
                sexError = SEX_DROPDOWN_ERROR;
              } else {
                sexError = null;
              }
            });
          },
        ),
        const SizedBox(height: 15),
        h2Text("Class *"),
        CustomDropdown(
          initialValue: "Please Select",
          items: childClass,
          error: shouldValidateFields ? classError : null,
          onChanged: (value) {
            setState(() {
              currentClass = value;
              if (value.toString().isEmpty) {
                classError = CLASS_DROPDOWN_ERROR;
              } else {
                classError = null;
              }
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
                  if (firstName.isEmpty || surName.isEmpty || sex.isEmpty || currentClass.isEmpty) {
                    if (context.mounted) {
                      errorSnackBar(context, "Please enter all required fields, appropriately. (*)");
                    }
                    setState(() {
                      shouldValidateFields = true;
                    });
                    return;
                  }
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
