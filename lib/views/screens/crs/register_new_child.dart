import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/pages/crs_page.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/subforms/registry_caregiver_sibling_subform.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/subforms/registry_cbo_chv_subform.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/subforms/registry_contact_details_subform.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/subforms/registry_identification_subform.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/subforms/registry_location_subform.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_perpetrators_modal.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/custom_drawer.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_card.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:cpims_dcs_mobile/views/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controller/registry_provider.dart';
import '../../widgets/custom_date_picker.dart';
import '../../widgets/custom_stepper.dart';
import './utils/constants_crs.dart';

class RegisterNewChildScreen extends StatefulWidget {
  const RegisterNewChildScreen({super.key});

  @override
  State<RegisterNewChildScreen> createState() => _RegisterNewChildScreenState();
}

class _RegisterNewChildScreenState extends State<RegisterNewChildScreen> {
  List<String> personCriteria = [
    'Child',
  ];
  String selectedPersonCriteria = 'Please Select';
  int selectedStep = 0;
  bool? _radioValue;
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final birthRegIdController = TextEditingController();
  int formStep = 0;
  String currentClass = "";
  String dateOfBirth = "";

  @override
  Widget build(BuildContext context) {

    RegistryProvider registryProvider = Provider.of<RegistryProvider>(context);

    bool _isChecked = registryProvider.registryPersonalDetailsModel.isCaregiver ?? false;
    List<Widget> registrySubforms = [
      RegistryIdentificationSubform(
        birthRegIdController: birthRegIdController,
      ),
      const RegistryContactDetailsSubform(),
      const RegistryLocationSubform(),
      const RegistryCaregiverSiblingSubform(),
      const RegistryCBOandCHVSubform(),
    ];
    return Scaffold(
        appBar: customAppBar(),
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            const SizedBox(height: 20),
            if (formStep == 0)
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Persons Registry Sheet',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 5),
                const Text(
                  'Register new child',
                  style: TextStyle(color: kTextGrey),
                ),
                const SizedBox(height: 30),
                CustomCard(
                  title: 'Create Person',
                  children: [
                    const Text(
                      'Personal details',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Person Type *',
                      style: TextStyle(color: kTextGrey),
                    ),
                    const SizedBox(height: 6),
                    CustomDropdown(
                      initialValue: registryProvider.registryPersonalDetailsModel.personType.isEmpty ? selectedPersonCriteria : registryProvider.registryPersonalDetailsModel.personType,
                      items: personCriteria,
                      onChanged: (val) {
                        setState(() {
                          selectedPersonCriteria = val;
                          registryProvider.setPersonType(selectedPersonCriteria);
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Person is also a caregiver',
                      style: TextStyle(color: kTextGrey),
                    ),
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false; // Update the state
                          registryProvider.setIsCaregiver(_isChecked);
                        });
                      },
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'First Name *',
                      style: TextStyle(color: kTextGrey),
                    ),
                    const SizedBox(height: 6),
                    CustomTextField(
                      hintText: 'First Name',
                      initialValue: registryProvider.registryPersonalDetailsModel.firstName,
                      onChanged: (value) {
                          registryProvider.setFirstName(value);
    },
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Surname *',
                      style: TextStyle(color: kTextGrey),
                    ),
                    const SizedBox(height: 6),
                    CustomTextField(
                      hintText: 'Surname',
                      initialValue: registryProvider.registryPersonalDetailsModel.surname,
                      onChanged: (value) {
                          registryProvider.setSurname(value);
    },
                    ),
                    const SizedBox(height: 15),
                    const Text('Other Names',
                        style: TextStyle(color: kTextGrey)),
                    const SizedBox(height: 6),
                    CustomTextField(
                      hintText: 'Other Names',
                      initialValue: registryProvider.registryPersonalDetailsModel.otherNames,
                      onChanged: (value) {
                          registryProvider.setOtherNames(value);
                      },
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Sex *',
                      style: TextStyle(color: kTextGrey),
                    ),
                    const SizedBox(height: 6),
                    CustomDropdown(
                      initialValue: registryProvider.registryPersonalDetailsModel.sex.isEmpty ? "Please Select" : registryProvider.registryPersonalDetailsModel.sex,
                      items: const ["Please Select", "Male", "Female"],
                      onChanged: (value) {
                        setState(() {
                          selectedPersonCriteria = value;
                          registryProvider.setSex(value);
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Date of Birth *',
                      style: TextStyle(color: kTextGrey),
                    ),
                    CustomDatePicker(
                      hintText: 'Date of Birth',
                      lastDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      showInitialDate: true,
                      initialDate: registryProvider.registryPersonalDetailsModel.dateOfBirth.isEmpty ? null : DateFormat('yyyy-MM-dd').parse(registryProvider.registryPersonalDetailsModel.dateOfBirth),
                      onChanged: (val) {
                        dateOfBirth =
                            DateFormat('yyyy-MM-dd').format(val);
                        registryProvider.setDateOfBirth(dateOfBirth);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please select a date';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    h2Text("Class"),
                    CustomDropdown(
                      initialValue: registryProvider.registryPersonalDetailsModel.childClass.isEmpty ? "Please Select" : registryProvider.registryPersonalDetailsModel.childClass,
                      items: childClass,
                      onChanged: (value) {
                        setState(() {
                          currentClass = value;
                          registryProvider.setChildClass(currentClass);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ]),
            if (formStep == 1)
              Column(children: [
                CustomStepperWidget(
                  onTap: (index) {
                    setState(() {
                      selectedStep = index;
                    });
                  },
                  data: REGISTRY_SUBFORM_HEADERS_TEXT,
                  selectedIndex: selectedStep,
                ),
                const SizedBox(
                  height: 15,
                ),
                registrySubforms[selectedStep],
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: CustomButton(
                        text: '← Previous',
                        onTap: () {
                          if (selectedStep <= 0) {
                            return;
                          }
                          setState(() {
                            selectedStep = selectedStep - 1;
                          });
                        },
                        color: Colors.transparent,
                        textColor: Colors.grey,
                        borderColor: Colors.grey,
                        borderRadius: 15,
                        height: 30,
                        isDisabled: selectedStep == 0,
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 100,
                      child: CustomButton(
                        isDisabled: selectedStep ==
                            REGISTRY_SUBFORM_HEADERS_TEXT.length - 1,
                        text: 'Next →',
                        onTap: () {
                          if (selectedStep >=
                              REGISTRY_SUBFORM_HEADERS_TEXT.length - 1) {
                            return;
                          }
                          setState(() {
                            selectedStep = selectedStep + 1;
                          });
                        },
                        color: const Color.fromARGB(255, 20, 89, 144),
                        textColor: Colors.white,
                        borderRadius: 15,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: formStep == 0
                        ? "Next"
                        : formStep == 1 &&
                                selectedStep ==
                                    REGISTRY_SUBFORM_HEADERS_TEXT.length - 1
                            ? 'Cancel'
                            : "Back",
                    textColor: Colors.white,
                    color: formStep == 1 &&
                        selectedStep ==
                            REGISTRY_SUBFORM_HEADERS_TEXT.length - 1
                    ? kTextGrey
                    : kPrimaryColor,
                    onTap: () {
                      if (formStep == 0) {
                        setState(() {
                          formStep = 1;
                        });
                      } else if (selectedStep ==
                          REGISTRY_SUBFORM_HEADERS_TEXT.length - 1) {
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          formStep = 0;
                        });
                      }
                    },
                  ),
                ),
                selectedStep == REGISTRY_SUBFORM_HEADERS_TEXT.length - 1
                    ? const SizedBox(width: 15)
                    : const SizedBox.shrink(),
                selectedStep == REGISTRY_SUBFORM_HEADERS_TEXT.length - 1
                    ? Expanded(
                  child: CustomButton(
                    text: 'Submit',
                    textColor: Colors.white,
                    onTap: () {
                      print("ID :${birthRegIdController.text}");
                      registryProvider.submit();
                      Get.off(() => const CaseRegistrationSheet());
                    },
                  ),
                )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(height: 20),
            const Footer(),
          ],
        ));
  }
}
