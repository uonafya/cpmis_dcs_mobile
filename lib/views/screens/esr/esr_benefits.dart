import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';

class ESRBenefits extends StatefulWidget {
  const ESRBenefits({super.key});

  @override
  State<ESRBenefits> createState() => _ESRBenefitsState();
}

class _ESRBenefitsState extends State<ESRBenefits> {
  String householdReceivingBenefits = 'Please select';

  final houseHoldBenefitsList = [
    'Please select',
    'CT-OVC',
    'HSNP',
    'PWSD-CT',
    'OPCT',
    'NONE',
    'Other-specify'
  ];

  String kindOfBenefits = 'Please select';

  final kindOfBenefitsList = [
    'Please select',
    'Cash',
    'In-kind',
    'Others',
  ];
  final lastReceivedBenefitController = TextEditingController();
  final specifyInKindController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Is the household receiving benefits from any of the Social Assistance Programmes?',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDropdown(
            initialValue: householdReceivingBenefits,
            items: houseHoldBenefitsList,
            onChanged: (val) {
              setState(() {
                householdReceivingBenefits = val;
              });
            }),
        const SizedBox(
          height: 14,
        ),
        const Text(
          'What type of the BENEFITS do you Receive?',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDropdown(
            initialValue: kindOfBenefits,
            items: kindOfBenefitsList,
            onChanged: (val) {
              setState(() {
                kindOfBenefits = val;
              });
            }),
        const SizedBox(
          height: 14,
        ),
        const Text(
          'How much benefit did you last receive?',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: lastReceivedBenefitController,
          hintText: "Ksh...",
        ),
        const SizedBox(
          height: 14,
        ),
        const Text(
          'Specify IN-KIND of benefit',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: specifyInKindController,
          hintText: "...",
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
