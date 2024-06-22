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

  int familyIndex = 0;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ESRController>(context);
    if (familyIndex >= controller.familyMembers.length) {
      return const Center(
        child: Text("All family members have been filled"),
      );
    }
    return Form(
      key: controller.familyFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${familyIndex + 1}. ${controller.familyMembers[familyIndex]["firstName"]} ${controller.familyMembers[familyIndex]["middleName"]} ${controller.familyMembers[familyIndex]["surname"]}",
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
                  initialValue: controller.doesHaveId,
                  items: doesHaveIdList,
                  onChanged: (val) {
                    controller.setDoesHaveId(val);
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
                  initialValue: controller.relationship,
                  items: relationshipList,
                  validator: (val) {
                    if (val == 'Please select') {
                      return 'Please enter the relationship to the head of the household';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.setRelationship(val);
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
                  initialValue: controller.sex,
                  items: sexList,
                  validator: (val) {
                    if (val == 'Please select') {
                      return 'Please select sex';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.setSex(val);
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
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter date of birth';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      controller
                          .setDateOfBirth(DateFormat("yyyy-MM-dd").format(val));
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
                  initialValue: controller.maritalStatus,
                  items: maritalStatusList,
                  validator: (val) {
                    if (val == 'Please select') {
                      return 'Please select marital status';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.setMaritalStatus(val);
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
                  initialValue: controller.doesSufferChronic,
                  validator: (val) {
                    if (val == 'Please select') {
                      return 'Please select if member suffers from a chronic illness';
                    }
                    return null;
                  },
                  items: doesSufferChronicList,
                  onChanged: (val) {
                    controller.setDoesSufferChronic(val);
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
                  initialValue: controller.typeOfDisability,
                  items: typeOfDisabilityList,
                  validator: (val) {
                    if (val == 'Please select') {
                      return 'Please select type of disability';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.setTypeOfDisability(val);
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
                  initialValue: controller.disabilityRequire24Care,
                  items: doesSufferChronicList,
                  onChanged: (val) {
                    controller.setDisabilityRequire24Care(val);
                  }),
              const SizedBox(
                height: 14,
              ),
              if (controller.showMainCareGiver)
                const Text(
                  'Who is member\'s name main caregiver?*',
                ),
              if (controller.showMainCareGiver)
                const SizedBox(
                  height: 6,
                ),
              if (controller.showMainCareGiver)
                CustomTextField(
                    controller: controller.memberCaregiver,
                    hintText: "Enter caregiver name(optional)"),
              if (controller.showMainCareGiver)
                const SizedBox(
                  height: 14,
                ),
              if (controller.age >= 3)
                const Text(
                  'What is the school or learning institution attendance status of member?',
                ),
              if (controller.age >= 3)
                const SizedBox(
                  height: 6,
                ),
              if (controller.age >= 3)
                CustomDropdown(
                    initialValue: controller.learningInstitution,
                    items: learningInstitutionList,
                    onChanged: (val) {
                      controller.setLearningInstitution(val);
                    }),
              if (controller.age >= 3)
                const SizedBox(
                  height: 14,
                ),
              if (controller.age >= 3)
                const Text(
                  'What is the highest STD/Form/Level reached by member?',
                ),
              if (controller.age >= 3)
                const SizedBox(
                  height: 6,
                ),
              if (controller.age >= 3)
                CustomDropdown(
                    initialValue: controller.highestLearning,
                    items: highestLearningList,
                    onChanged: (val) {
                      controller.setHighestLearning(val);
                    }),
              if (controller.age >= 3)
                const SizedBox(
                  height: 14,
                ),
              const Text(
                'What was member mainly doing during the last seven days? *',
              ),
              const SizedBox(
                height: 6,
              ),
              CustomDropdown(
                  initialValue: controller.doingLast,
                  validator: (val) {
                    if (val == 'Please select') {
                      return 'Please select what member was mainly doing during the last seven days';
                    }
                    return null;
                  },
                  items: doingLastList,
                  onChanged: (val) {
                    controller.setDoingLast(val);
                  }),
              const SizedBox(
                height: 14,
              ),
              if (controller.age >= 3)
                const Text(
                  'Does member work on a formal job, teaching, public sector, NGO/FBO?',
                ),
              if (controller.age >= 3)
                const SizedBox(
                  height: 6,
                ),
              if (controller.age >= 3)
                CustomDropdown(
                    initialValue: controller.hasFormalJob,
                    items: doesSufferChronicList,
                    onChanged: (val) {
                      controller.setHasFormalJob(val);
                    }),
              if (controller.age >= 3)
                const SizedBox(
                  height: 14,
                ),
              const Text(
                'Do you recommend this household to be considered for any support? *',
              ),
              const SizedBox(
                height: 6,
              ),
              CustomDropdown(
                  initialValue: controller.recommendSupport,
                  validator: (val) {
                    if (val == 'Please select') {
                      return 'Please select if you recommend this household to be considered for any support';
                    }
                    return null;
                  },
                  items: doesSufferChronicList,
                  onChanged: (val) {
                    controller.setRecommendSupport(val);
                  }),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
          if (familyIndex != controller.familyMembers.length)
            CustomButton(
                text: "Fill next member",
                onTap: () {
                  Provider.of<ESRController>(context, listen: false)
                      .addFamilyMemberDetails();
                  //Clear

                  setState(() {
                    familyIndex++;
                  });
                })
        ],
      ),
    );
  }
}
