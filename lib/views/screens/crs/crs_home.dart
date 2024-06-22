import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/search_caseload.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/register_new_child.dart';
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
    'Case Serial',
    'CPIMS ID',
  ];

  String selectedTypeOfPerson = 'Please Select';
  String selectedCriteria = 'Select Criteria';
  List<CaseLoadModel> searchedResults = [];
  final childTextController = TextEditingController();

  void searchChild() async {
    setState(() {
      searchedResults = [];
    });
    if (selectedCriteria == 'Names') {
      final results =
          await searchCaseLoad.searchOVCByNames(childTextController.text);
      setState(() {
        searchedResults = results ?? [];
      });
    } else if (selectedCriteria == 'CPIMS ID') {
      final results =
          await searchCaseLoad.searchOVCByCPIMSID(childTextController.text);
      setState(() {
        searchedResults = results ?? [];
      });
    } else if (selectedCriteria == 'Case Serial') {
      final results =
          await searchCaseLoad.searchOVCByCaseSerial(childTextController.text);
      setState(() {
        searchedResults = results ?? [];
      });
    } else if (selectedCriteria == 'Org Unit') {
      final results =
          await searchCaseLoad.searchOVCByOrgUnit(childTextController.text);
      setState(() {
        searchedResults = results ?? [];
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
              const Text('Case Record Sheet',
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
                        child: CustomButton(
                      text: 'Search',
                      onTap: searchChild,
                      isDisabled: selectedCriteria == 'Select Criteria',
                    )),
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
