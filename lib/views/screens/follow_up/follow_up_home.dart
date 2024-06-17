import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/widgets/follow_up_list_item.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/custom_drawer.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_card.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:cpims_dcs_mobile/views/widgets/footer.dart';
import 'package:flutter/material.dart';

class FollowUpHome extends StatefulWidget {
  const FollowUpHome({super.key});

  @override
  State<FollowUpHome> createState() => _FollowUpHomeState();
}

class _FollowUpHomeState extends State<FollowUpHome> {
  List<String> typeOfPersons = [
    'Please Select',
    'Child protection case',
    'Children resident in institution',
    'Alternative family care',
    'School & Bursary',
  ];

  String selectedTypeOfPerson = 'Please Select';
  String selectedCriteria = 'Select Criteria';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              const SizedBox(height: 20),
              const Text('Form Follow-Ups',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(height: 5),
              const Text(
                'Search form',
                style: TextStyle(color: kTextGrey),
              ),
              const SizedBox(height: 30),
              CustomCard(title: 'Search Form', children: [
                CustomDropdown(
                  initialValue: selectedTypeOfPerson,
                  items: typeOfPersons,
                  onChanged: (val) {
                    setState(() {
                      selectedTypeOfPerson = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomTextField(hintText: 'Enter Child Name(s)'),
                const SizedBox(
                  height: 15,
                ),
                const CustomTextField(hintText: 'CCO/XX/XXX/5/29/XX/YYYY'),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(child: CustomButton(text: 'Search', onTap: () {})),
                    const SizedBox(
                      width: 15,
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ]),
              ...List.generate(10, (index) => const FollowUpListItem()),
              const Footer(),
            ]));
  }
}
