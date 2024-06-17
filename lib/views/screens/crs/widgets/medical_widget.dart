import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/medical_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/compulsary_question.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/info_icon.dart';
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
  String mentalCondition = "";
  String physicalCondition = "";
  String otherCondition = "";
  List<String> mentalChallenges = [];
  List<String> physicalChallenges = [];
  List<String> otherChallenges = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title of section
        const Text("Medical"),
        const Divider(),

        // Questions
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CompulsaryQuestion(question: "Mental condition:"),
            InfoIcon(tooltipString: "Select a mental condition")
          ],
        ),
        CustomDropdown(
            initialValue: pleaseSelect,
            items: mentalConditionOptions,
            onChanged: (String item) {
              setState(() {
                mentalCondition = item;
              });
            }),

        // Display list to specify challenge
        if (mentalCondition ==
                MentalConditionOptions.challengeUnverified.value ||
            mentalCondition == MentalConditionOptions.challengeVerifed.value)
          Column(
            children: [
              const CompulsaryQuestion(question: pleaseSpecify),
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

        const Row(
          children: [
            CompulsaryQuestion(question: "Physical condition:"),
            InfoIcon(tooltipString: "Select physical condition")
          ],
        ),
        CustomDropdown(
            initialValue: pleaseSelect,
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
              const CompulsaryQuestion(question: pleaseSpecify),
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

        const Row(
          children: [
            CompulsaryQuestion(question: "Other condition:"),
            InfoIcon(tooltipString: "Select other conditions if any")
          ],
        ),
        CustomDropdown(
            initialValue: pleaseSelect,
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
              const CompulsaryQuestion(question: pleaseSpecify),
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
