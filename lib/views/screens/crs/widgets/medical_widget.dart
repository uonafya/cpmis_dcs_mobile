import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/medical_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/compulsary_question.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/compulsary_question_with_tooltip.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown_multiselect.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class MedicalWidget extends StatefulWidget {
  const MedicalWidget({super.key});

  @override
  State<MedicalWidget> createState() => _MedicalWidgetState();
}

class _MedicalWidgetState extends State<MedicalWidget> {
  String mentalCondition = pleaseSelect;
  String physicalCondition = pleaseSelect;
  String otherCondition = pleaseSelect;
  List<String> mentalChallenges = [];
  List<String> physicalChallenges = [];
  List<String> otherChallenges = [];

  @override
  Widget build(BuildContext context) {
    return Column(
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
            initialValue: mentalCondition,
            items: mentalConditionOptions,
            onChanged: (String item) {
              setState(() {
                mentalCondition = item;
              });
            }),
        const SizedBox(
          height: mediumSpacing,
        ),

        // Display list to specify challenge
        if (mentalCondition ==
                MentalConditionOptions.challengeUnverified.value ||
            mentalCondition == MentalConditionOptions.challengeVerifed.value)
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
                    mentalChallenges.addAll(value);
                    setState(() {
                      mentalChallenges = mentalChallenges;
                    });
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
            initialValue: physicalCondition,
            items: physicalConditionOptions,
            onChanged: (String item) {
              setState(() {
                physicalCondition = item;
              });
            }),

        // Display possible challenges
        if (physicalCondition ==
                PhysicalConditionOptions.challengeUnverified.value ||
            physicalCondition ==
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
                    physicalChallenges.addAll(value);
                    setState(() {
                      physicalChallenges = physicalChallenges;
                    });
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
            initialValue: otherCondition,
            items: otherConditionOptions,
            onChanged: (String item) {
              setState(() {
                otherCondition = item;
              });
            }),

        // Display if other conditions are chronic
        if (otherCondition == OtherConditionOptions.chronic.value)
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
                    otherChallenges.addAll(value);
                    setState(() {
                      otherChallenges = otherChallenges;
                    });
                  },
                  selectionType: SelectionType.multi,
                  hint: pleaseSelect)
            ],
          ),
      ],
    );
  }
}
