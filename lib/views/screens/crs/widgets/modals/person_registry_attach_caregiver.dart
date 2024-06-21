import 'package:cpims_dcs_mobile/core/utils/input_validation_utils.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_caregiver_model.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_perpetrators_modal.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../controller/registry_provider.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_date_picker.dart';

const String FIRST_NAME_INPUT_ERROR = "Please enter a valid first name.";
const String SUR_NAME_INPUT_ERROR = "Please enter a valid surname.";
const String SEX_DROPDOWN_ERROR = "Please select a sex.";
const String RELATIONSHIP_DROPDOWN_ERROR = "Please select a relationship.";
const String ID_INPUT_ERROR = "Please select a national Id.";

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

  String id = "";
  String firstName = "";
  String surName = "";
  String? otherNames;
  String? dateOfBirth;
  String sex = "";
  String relationshipToChild = "";
  String nationalIdNumber = "";
  String? phoneNumber;
  bool isRegistered = false;
  String? firstNameError = FIRST_NAME_INPUT_ERROR;
  String? surNameError = SUR_NAME_INPUT_ERROR;
  String? sexError = SEX_DROPDOWN_ERROR;
  String? relationshipError = RELATIONSHIP_DROPDOWN_ERROR;
  String? idError = ID_INPUT_ERROR;
  bool shouldValidateFields = false;

  @override
  Widget build(BuildContext context) {

    RegistryProvider registryProvider = Provider.of<RegistryProvider>(context);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Padding(padding: EdgeInsets.only(top: 20.0)),
          const FormPageHeading(
            heading: "Attach Caregiver",
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
            items: const ["Male", "Female"],
            onChanged: (val) {
              setState(() {
                sex = val;
                if (val.isEmpty) {
                  sexError = SEX_DROPDOWN_ERROR;
                } else {
                  sexError = null;
                }
              });
            },
          ),
          const SizedBox(height: 15),
          h2Text("Relationship with Child *"),
          CustomDropdown(
            initialValue: "None",
            error: shouldValidateFields ? relationshipError : null,
            items: childRelationship,
            onChanged: (val) {
              setState(() {
                relationshipToChild = val;
                if (val.toString().isEmpty) {
                  relationshipError = RELATIONSHIP_DROPDOWN_ERROR;
                } else {
                  relationshipError = null;
                }
              });
            },
          ),
          const SizedBox(height: 15),
          h2Text("National ID No *"),
          CustomTextField(
            hintText: 'National ID',
            error: shouldValidateFields ? idError : null,
            onChanged: (value) {
              setState(() {
                nationalIdNumber = value;
                if (value.isEmpty || value.length < 6) {
                  idError = ID_INPUT_ERROR;
                  return;
                }
                idError = null;
              });
            },
          ),
          const SizedBox(height: 15),
          h2Text("MobileNumber:"),
          CustomTextField(
            hintText: 'Cellphone Number',
            onChanged: (value) {
              setState(() {
                phoneNumber = value;
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
                    int? nationalId;
                    try {
                      nationalId = int.parse(nationalIdNumber);
                    } catch (e) {}
                    if (firstName.isEmpty || surName.isEmpty || sex.isEmpty || relationshipToChild.isEmpty || nationalIdNumber.isEmpty) {
                      if (context.mounted) {
                        errorSnackBar(context, "Please enter all required fields, appropriately. (*)");
                      }
                      setState(() {
                        shouldValidateFields = true;
                      });
                      return;
                    }
                    RegistryCaregiverModel caregiver = RegistryCaregiverModel(id: id, firstName: firstName, surName: surName, dateOfBirth: dateOfBirth, sex: sex, relationshipToChild: relationshipToChild, nationalIdNumber: nationalIdNumber);
                    registryProvider.addCaregiver(caregiver);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
