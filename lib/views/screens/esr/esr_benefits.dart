import 'package:cpims_dcs_mobile/controller/esr_controller.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ESRBenefits extends StatefulWidget {
  const ESRBenefits({super.key});

  @override
  State<ESRBenefits> createState() => _ESRBenefitsState();
}

class _ESRBenefitsState extends State<ESRBenefits> {
  final houseHoldBenefitsList = [
    'Please select',
    'CT-OVC',
    'HSNP',
    'PWSD-CT',
    'OPCT',
    'NONE',
    'Other-specify'
  ];

  final kindOfBenefitsList = [
    'Please select',
    'Cash',
    'In-kind',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ESRController>(context);
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
            initialValue: controller.householdReceivingBenefits,
            items: houseHoldBenefitsList,
            onChanged: (val) {
              controller.setHouseholdReceivingBenefits(val);
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
            initialValue: controller.kindOfBenefits,
            items: kindOfBenefitsList,
            onChanged: (val) {
              controller.setKindOfBenefits(val);
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
          controller: controller.lastReceivedBenefitController,
          hintText: "Ksh...",
        ),
       
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
