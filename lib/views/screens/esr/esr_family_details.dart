import 'package:cpims_dcs_mobile/controller/esr_controller.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ESRFamilyDetails extends StatefulWidget {
  const ESRFamilyDetails({super.key});

  @override
  State<ESRFamilyDetails> createState() => _ESRFamilyDetailsState();
}

class _ESRFamilyDetailsState extends State<ESRFamilyDetails> {
  String doesHaveId = 'Type';
  String relationship = "Please select";
  String sex = "Please select";
  String? dateOfBirth;
  String maritalStatus = "Please select";
  String doesSufferChronic = "Please select";
  String disabilityRequire24Care = "Please select";
  String typeOfDisability = "Please select";
  String learningInstitution = "Please select";
  String highestLearning = "Please select";
  String doingLast = "Please select";
  String hasFormalJob = "Please select";
  String recommendSupport = "Please select";
  final memberCaregiver = TextEditingController();

  List<String> doesHaveIdList = [
    "Type",
    "National ID",
    "Registration of birth",
    "Passport",
    "Other",
    "None"
  ];

  List<String> relationshipList = [
    "Please select",
    "Head",
    "Spouse",
    "Son/Daughter",
    "Grandchild",
    "Brother/Sister",
    "Father/Mother",
    "Nephew/Niece",
    "In-law",
    "Grandparent",
    "Other relative",
    "Non-relative",
    "Employee",
    "Other",
  ];
  List<String> sexList = [
    "Please select",
    "Male",
    "Female",
  ];

  List<String> maritalStatusList = [
    "Please select",
    "Never Married",
    "Married monogamous",
    "Married Polygamous",
    "Widowed",
    "Divorced",
    "Separated",
    "DK",
  ];
  List<String> doesSufferChronicList = [
    "Please select",
    "Yes",
    "No",
    "Dk",
  ];

  List<String> typeOfDisabilityList = [
    "Please select",
    "Visual",
    "Hearing",
    "Speech",
    "Physical",
    "Mental",
    "Self-care difficulties",
    "Others",
    "None",
  ];

  List<String> learningInstitutionList = [
    "Please select",
    "At school or learning institution",
    "Left school or learning institution",
    "Never went to school or learning institution",
    "DK",
  ];

  List<String> highestLearningList = [
    "Please select",
    "Pre primary (ECD) or none",
    "Standard 1",
    "Standard 2",
    "Standard 3",
    "Standard 4",
    "Standard 5",
    "Standard 6",
    "Standard 7",
    "Standard 8",
    "Form 1",
    "Form 2",
    "Form 3",
    "Form 4",
    "Form 5",
    "Form 6",
    "Incomplete post secondary",
    "Complete post secondary",
    "Incomplete undergraduate or polytechnic",
    "Complete undergraduate",
    "Incomplete Masters/PHD",
    "Complete Masters/PHD",
    "Other",
  ];

  List<String> doingLastList = [
    "Please select",
    "Worked for pay",
    "On leave",
    "Sick leave",
    "Worked own or at family business or at family agriculture",
    "Apprentice/Intern",
    "Volunteer",
    "Seeking work",
    "No work available",
    "Retired with pension",
    "Homemaker",
    "Full-time student",
    "Part-time student",
    "Incapacitated",
    "Other",
  ];

  bool get showMainCareGiver {
    if (dateOfBirth == null) {
      return false;
    }

    final date = DateTime.parse(dateOfBirth!);
    //Check if dob is <17 or above 65
    final age = DateTime.now().difference(date).inDays ~/ 365;
    if ((age < 18 || age > 65) && disabilityRequire24Care == "Yes") {
      return true;
    }
    return false;
  }

  int get age {
    if (dateOfBirth == null) {
      return 0;
    }

    final date = DateTime.parse(dateOfBirth!);
    //Check if dob is <17 or above 65
    return DateTime.now().difference(date).inDays ~/ 365;
  }

  List<Map<String, dynamic>> familyMembersDetails = [];
  int familyIndex = 0;

  @override
  Widget build(BuildContext context) {
    final familyMembers =
        Provider.of<ESRController>(context, listen: false).familyMembers;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${familyIndex + 1}. ${familyMembers[familyIndex]["firstName"]} ${familyMembers[familyIndex]["middleName"]} ${familyMembers[familyIndex]["surname"]}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Does member have an ID number? *',
            ),
            const SizedBox(
              height: 6,
            ),
            CustomDropdown(
                initialValue: doesHaveId,
                items: doesHaveIdList,
                onChanged: (val) {
                  setState(() {
                    doesHaveId = val;
                  });
                }),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'What is member\'s relationship to the head of this household? *',
            ),
            const SizedBox(
              height: 6,
            ),
            CustomDropdown(
                initialValue: relationship,
                items: relationshipList,
                onChanged: (val) {
                  setState(() {
                    relationship = val;
                  });
                }),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'What is member‘s sex? *',
            ),
            const SizedBox(
              height: 6,
            ),
            CustomDropdown(
                initialValue: sex,
                items: sexList,
                onChanged: (val) {
                  setState(() {
                    sex = val;
                  });
                }),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Date of birth *',
            ),
            const SizedBox(
              height: 6,
            ),
            CustomDatePicker(
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                hintText: "Date of birth",
                onChanged: (val) {
                  setState(() {
                    dateOfBirth = DateFormat("yyyy-MM-dd").format(val);
                  });
                }),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Marital status *',
            ),
            const SizedBox(
              height: 6,
            ),
            CustomDropdown(
                initialValue: maritalStatus,
                items: maritalStatusList,
                onChanged: (val) {
                  setState(() {
                    maritalStatus = val;
                  });
                }),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Does member suffer from a chronic illness *',
            ),
            const SizedBox(
              height: 6,
            ),
            CustomDropdown(
                initialValue: doesSufferChronic,
                items: doesSufferChronicList,
                onChanged: (val) {
                  setState(() {
                    doesSufferChronic = val;
                  });
                }),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'What type of disability does member have? *',
            ),
            const SizedBox(
              height: 6,
            ),
            CustomDropdown(
                initialValue: typeOfDisability,
                items: typeOfDisabilityList,
                onChanged: (val) {
                  setState(() {
                    typeOfDisability = val;
                  });
                }),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Does  disability require 24-hour care? *',
            ),
            const SizedBox(
              height: 6,
            ),
            CustomDropdown(
                initialValue: disabilityRequire24Care,
                items: doesSufferChronicList,
                onChanged: (val) {
                  setState(() {
                    disabilityRequire24Care = val;
                  });
                }),
            const SizedBox(
              height: 14,
            ),
            if (showMainCareGiver)
              const Text(
                'Who is member\'s name main caregiver?*',
              ),
            if (showMainCareGiver)
              const SizedBox(
                height: 6,
              ),
            if (showMainCareGiver)
              CustomTextField(
                  controller: memberCaregiver,
                  hintText: "Enter caregiver name(optional)"),
            if (showMainCareGiver)
              const SizedBox(
                height: 14,
              ),
            if (age >= 3)
              const Text(
                'What is the school or learning institution attendance status of member?',
              ),
            if (age >= 3)
              const SizedBox(
                height: 6,
              ),
            if (age >= 3)
              CustomDropdown(
                  initialValue: learningInstitution,
                  items: learningInstitutionList,
                  onChanged: (val) {
                    setState(() {
                      learningInstitution = val;
                    });
                  }),
            if (age >= 3)
              const SizedBox(
                height: 14,
              ),
            if (age >= 3)
              const Text(
                'What is the highest STD/Form/Level reached by member?',
              ),
            if (age >= 3)
              const SizedBox(
                height: 6,
              ),
            if (age >= 3)
              CustomDropdown(
                  initialValue: highestLearning,
                  items: highestLearningList,
                  onChanged: (val) {
                    setState(() {
                      highestLearning = val;
                    });
                  }),
            if (age >= 3)
              const SizedBox(
                height: 14,
              ),
            const Text(
              'What was member mainly doing during the last seven days?',
            ),
            const SizedBox(
              height: 6,
            ),
            CustomDropdown(
                initialValue: doingLast,
                items: doingLastList,
                onChanged: (val) {
                  setState(() {
                    doingLast = val;
                  });
                }),
            const SizedBox(
              height: 14,
            ),
            if (age >= 3)
              const Text(
                'Does member work on a formal job, teaching, public sector, NGO/FBO?',
              ),
            if (age >= 3)
              const SizedBox(
                height: 6,
              ),
            if (age >= 3)
              CustomDropdown(
                  initialValue: hasFormalJob,
                  items: doesSufferChronicList,
                  onChanged: (val) {
                    setState(() {
                      hasFormalJob = val;
                    });
                  }),
            if (age >= 3)
              const SizedBox(
                height: 14,
              ),
            const Text(
              'Do you recommend this household to be considered for any support?',
            ),
            const SizedBox(
              height: 6,
            ),
            CustomDropdown(
                initialValue: recommendSupport,
                items: doesSufferChronicList,
                onChanged: (val) {
                  setState(() {
                    recommendSupport = val;
                  });
                }),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
        CustomButton(
            text: "Add",
            onTap: () {
              final memberCaregiver = TextEditingController();
              final family = {
                "doesHaveId": doesHaveId,
                "relationship": relationship,
                "sex": sex,
                "date_of_birth": dateOfBirth,
                "marital_status": maritalStatus,
                "does_suffer_chronic": doesSufferChronic,
                "disability_require_24_care": disabilityRequire24Care,
                "type_of_disability": typeOfDisability,
                "learning_institution": learningInstitution,
                "highest_learning": highestLearning,
                "doing_last": doingLast,
                "has_formal_job": hasFormalJob,
                "recommend_support": recommendSupport,
                "main_caregiver": memberCaregiver.text
              };
              familyMembersDetails.add(family);
              Provider.of<ESRController>(context, listen: false)
                  .addFamilyMemberDetails(family);
              //Clear
              memberCaregiver.clear();
              doesHaveId = 'Type';
              relationship = "Please select";
              sex = "Please select";
              dateOfBirth = null;
              maritalStatus = "Please select";
              doesSufferChronic = "Please select";
              disabilityRequire24Care = "Please select";
              typeOfDisability = "Please select";
              learningInstitution = "Please select";
              highestLearning = "Please select";
              doingLast = "Please select";
              hasFormalJob = "Please select";
              recommendSupport = "Please select";
              setState(() {});
              if (familyIndex == familyMembers.length - 1) {
                return;
              }
              setState(() {
                familyIndex++;
              });
            })
      ],
    );
  }
}
