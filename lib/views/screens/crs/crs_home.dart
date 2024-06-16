import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_card.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:cpims_dcs_mobile/views/widgets/footer.dart';
import 'package:flutter/material.dart';

class CRSHome extends StatefulWidget {
  const CRSHome({super.key});

  @override
  State<CRSHome> createState() => _CRSHomeState();
}

class _CRSHomeState extends State<CRSHome> {
  List<String> criteria = [
    'Select Criteria',
    'Names',
    'Org Unit',
    'Residence',
    'CPIMS ID',
  ];

  String selectedTypeOfPerson = 'Please Select';
  String selectedCriteria = 'Select Criteria';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        drawer: const Drawer(),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              const SizedBox(height: 20),
              const Text('Case Registration Sheet',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(height: 5),
              const Text(
                'Search child',
                style: TextStyle(color: kTextGrey),
              ),
              const SizedBox(height: 30),
              CustomCard(title: 'Search Child', children: [
                const CustomTextField(hintText: 'Enter Child Name(s)'),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdown(
                  initialValue: selectedCriteria,
                  items: criteria,
                  onChanged: (val) {
                    setState(() {
                      selectedCriteria = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(child: CustomButton(text: 'Search', onTap: () {})),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child:
                            CustomButton(text: 'Register New', onTap: () {})),
                  ],
                ),
              ]),
              const Footer(),
            ]));
  }
}
