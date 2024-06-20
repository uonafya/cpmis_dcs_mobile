import 'package:cpims_dcs_mobile/controller/crs_form_provider.dart';
import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/medical_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/compulsary_question.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/compulsary_question_with_tooltip.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown_multiselect.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';

class MedicalWidget extends StatefulWidget {
  const MedicalWidget({super.key});

  @override
  State<MedicalWidget> createState() => _MedicalWidgetState();
}

class _MedicalWidgetState extends State<MedicalWidget> {
  List<String> mentalChallenges = [];
  List<String> physicalChallenges = [];
  List<String> otherChallenges = [];

  var formKey = GlobalKey<FormState>();

  String? validator(String? value) {
    if (value == null || value == pleaseSelect) {
      return "Can not be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CRSFormProvider>(
      builder: (context, model, _) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              // Title of section
              const FormPageHeading(heading: "Medical"),
              const SizedBox(
                height: mediumSpacing,
              ),

              // Questions
              const CompulsaryQuestionWithTooltip(
                question: "Mental condition:",
                tooltip: "Select a mental condition",
              ),
              const SizedBox(
                height: smallSpacing,
              ),
              CustomDropdown(
                  initialValue: model.medical.mentalConditionStatus,
                  items: mentalConditionOptions,
                  onChanged: (dynamic item) {
                    MedicalCRSFormModel updated = model.medical;
                    updated.mentalConditionStatus = item;
                    model.medical = updated;
                  }),
              const SizedBox(
                height: mediumSpacing,
              ),

              // Display list to specify challenge
              if (model.medical.mentalConditionStatus ==
                      MentalConditionOptions.challengeUnverified.value ||
                  model.medical.mentalConditionStatus ==
                      MentalConditionOptions.challengeVerifed.value)
                Column(
                  children: [
                    const SizedBox(
                      height: mediumSpacing,
                    ),
                    const CompulsaryQuestion(question: pleaseSpecify),
                    const SizedBox(
                      height: smallSpacing,
                    ),
                    CustomDropDownMultiSelect(
                        options: possibleMentalChallenges,
                        onOptionSelected: (List<String> value) {
                          MedicalCRSFormModel updated = model.medical;

                          if (updated.mentalCondition == null) {
                            updated.mentalCondition = value;
                          } else {
                            updated.mentalCondition!.addAll(value);
                          }
                          model.medical = updated;
                        },
                        selectionType: SelectionType.multi,
                        hint: pleaseSelect)
                  ],
                ),
              const Divider(),
              const SizedBox(
                height: mediumSpacing,
              ),

              const CompulsaryQuestionWithTooltip(
                  question: "Physical condition:",
                  tooltip: "Select physical condition"),
              const SizedBox(
                height: smallSpacing,
              ),
              CustomDropdown(
                  initialValue: model.medical.physicalConditionStatus,
                  items: physicalConditionOptions,
                  onChanged: (dynamic item) {
                    MedicalCRSFormModel updated = model.medical;
                    updated.physicalConditionStatus = item;
                    model.medical = updated;
                  }),

              // Display possible challenges
              if (model.medical.physicalConditionStatus ==
                      PhysicalConditionOptions.challengeUnverified.value ||
                  model.medical.physicalConditionStatus ==
                      PhysicalConditionOptions.challengedVerified.value)
                Column(
                  children: [
                    const SizedBox(
                      height: mediumSpacing,
                    ),
                    const CompulsaryQuestion(question: pleaseSpecify),
                    const SizedBox(
                      height: smallSpacing,
                    ),
                    CustomDropDownMultiSelect(
                        options: possiblePhysicalChallenges,
                        onOptionSelected: (List<String> value) {
                          // Create temp
                          MedicalCRSFormModel updated = model.medical;

                          // Update
                          if (updated.physicalCondition == null) {
                            updated.physicalCondition = value;
                          } else {
                            updated.physicalCondition!.addAll(value);
                          }
                          model.medical = updated;
                        },
                        selectionType: SelectionType.multi,
                        hint: pleaseSelect)
                  ],
                ),
              const Divider(),
              const SizedBox(
                height: mediumSpacing,
              ),

              const CompulsaryQuestionWithTooltip(
                  question: "Other condition:",
                  tooltip: "Select other conditions if any"),
              const SizedBox(
                height: smallSpacing,
              ),
              CustomDropdown(
                  initialValue: model.medical.otherConditionStatus,
                  items: otherConditionOptions,
                  onChanged: (dynamic item) {
                    MedicalCRSFormModel updated = model.medical;

                    updated.otherConditionStatus = item;
                    model.medical = updated;
                  }),

              // Display if other conditions are chronic
              if (model.medical.otherConditionStatus ==
                  OtherConditionOptions.chronic.value)
                Column(
                  children: [
                    const SizedBox(
                      height: mediumSpacing,
                    ),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: CompulsaryQuestion(question: pleaseSpecify)),
                    const SizedBox(
                      height: smallSpacing,
                    ),
                    CustomDropDownMultiSelect(
                        options: possibleOtherChallenges,
                        onOptionSelected: (List<String> value) {
                          MedicalCRSFormModel updated = model.medical;

                          if (updated.otherCondition == null) {
                            updated.otherCondition = value;
                          } else {
                            updated.otherCondition!.addAll(value);
                          }
                          model.medical = updated;
                        },
                        selectionType: SelectionType.multi,
                        hint: pleaseSelect)
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
