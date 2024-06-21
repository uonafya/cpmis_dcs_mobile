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
    return Form(
      key: controller.benefitsFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Is the household receiving benefits from any of the Social Assistance Programmes?',
          ),
          const SizedBox(
            height: 6,
          ),
          CustomDropdown(
              initialValue: controller.householdReceivingBenefits,
              items: houseHoldBenefitsList,
              validator: (val) {
                if (val == 'Please select') {
                  return 'Please select benefits';
                }
                return null;
              },
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
            height: 6,
          ),
          CustomDropdown(
              initialValue: controller.kindOfBenefits,
              validator: (val) {
                if (val == 'Please select') {
                  return 'Please select ';
                }
                return null;
              },
              items: kindOfBenefitsList,
              onChanged: (val) {
                controller.setKindOfBenefits(val);
              }),
          const SizedBox(
            height: 14,
          ),
          if (controller.kindOfBenefits == "Others" ||
              controller.kindOfBenefits == "In-kind")
            const Text(
              'Specify the benefit',
            ),
          if (controller.kindOfBenefits == "Others" ||
              controller.kindOfBenefits == "In-kind")
            const SizedBox(
              height: 6,
            ),
          if (controller.kindOfBenefits == "Others" ||
              controller.kindOfBenefits == "In-kind")
            CustomTextField(
              controller: controller.specifiedBenefit,
              hintText: "Type the benefit",
              validator: (val) {
                if (val!.isEmpty) {
                  return "Benefit is required";
                }
                return null;
              },
            ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
