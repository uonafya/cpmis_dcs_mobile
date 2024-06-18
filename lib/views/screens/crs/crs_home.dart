import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/register_new_child.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/utils/constants_crs.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/search_crs_results.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/custom_drawer.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_card.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:cpims_dcs_mobile/views/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
  List<Map<String, dynamic>> searchedResults = caseLoadDummy;
  final childTextController = TextEditingController();

  void searchChild() async {
    if (selectedCriteria == 'Names') {
      final List<Map<String, dynamic>> results = [];
      for (final child in caseLoadDummy) {
        if (child['names'].toString().contains(childTextController.text)) {
          results.add(child);
        }
      }
      setState(() {
        searchedResults = results;
      });
    } else if (selectedCriteria == 'Org Unit') {
      final List<Map<String, dynamic>> results = [];
      for (final child in caseLoadDummy) {
        if (child['org_unit'].toString().contains(childTextController.text)) {
          results.add(child);
        }
      }
      setState(() {
        searchedResults = results;
      });
    } else if (selectedCriteria == 'Residence') {
      final List<Map<String, dynamic>> results = [];
      for (final child in caseLoadDummy) {
        if (child['residence'].toString().contains(childTextController.text)) {
          results.add(child);
        }
      }
      setState(() {
        searchedResults = results;
      });
    } else if (selectedCriteria == 'CPIMS ID') {
      final List<Map<String, dynamic>> results = [];
      for (final child in caseLoadDummy) {
        if (child['id'].toString() == (childTextController.text)) {
          results.add(child);
        }
      }
      setState(() {
        searchedResults = results;
      });
    }
  }

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
                CustomTextField(
                  hintText: 'Enter Child Name(s)',
                  controller: childTextController,
                ),
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
                    Expanded(
                        child:
                            CustomButton(text: 'Search', onTap: searchChild)),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: CustomButton(
                            text: 'Register New',
                            onTap: () {
                              Get.to(() => const RegisterNewChildScreen());
                            })),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SearchCrsResults(crsRecords: searchedResults),
              ]),
              const Footer(),
            ]));
  }
}
