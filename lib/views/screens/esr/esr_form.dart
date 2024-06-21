// ignore_for_file: use_build_context_synchronously

import 'package:cpims_dcs_mobile/controller/esr_controller.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/esr/esr_benefits.dart';
import 'package:cpims_dcs_mobile/views/screens/esr/esr_family_details.dart';
import 'package:cpims_dcs_mobile/views/screens/esr/esr_household_demographic.dart';
import 'package:cpims_dcs_mobile/views/screens/esr/esr_household_geolocation.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/custom_drawer.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_stepper.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class ESRForm extends StatefulWidget {
  const ESRForm({super.key});

  @override
  State<ESRForm> createState() => _ESRFormState();
}

class _ESRFormState extends State<ESRForm> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ESRController>(context);
    return Scaffold(
      appBar: customAppBar(),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          const SizedBox(
            height: 14,
          ),
          CustomStepperWidget(
            data: esrStepperData,
            onTap: (int index) {
              controller.setSelectedIndex(index);
            },
            selectedIndex: controller.selectedIndex,
          ),
          const SizedBox(
            height: 20,
          ),

          // Form body
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            padding: const EdgeInsets.all(15.0),
            child: esrStepperWidgets[controller.selectedIndex],
          ),

          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CustomButton(
                  text: controller.selectedIndex <= 0 ? 'Cancel' : 'Previous',
                  onTap: () {
                    if (controller.selectedIndex == 0) {
                      Navigator.pop(context);
                    }
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                    );

                    if (controller.selectedIndex > 0) {
                      controller.setSelectedIndex(controller.selectedIndex - 1);
                    }
                  },
                  color: kTextGrey,
                ),
              ),
              const SizedBox(width: 50),
              Expanded(
                child: CustomButton(
                  text: controller.selectedIndex == esrStepperWidgets.length - 1
                      ? 'Submit'
                      : 'Next',
                  onTap: () async {
                    // _scrollController.animateTo(
                    //   0,
                    //   duration: const Duration(milliseconds: 100),
                    //   curve: Curves.easeInOut,
                    // );

                    try {
                      await controller.handleSubmit();
                      Get.back();
                      showSuccessSnackBar(
                          context, "Successfully submitted ESR form.");
                    } catch (e) {
                      showErrorSnackBar(context,
                          "Failed to ESRsubmit form. Please try again.");
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> esrStepperData = [
  {
    'title': 'Household Geolocation',
    'subtitle': 'Reporter and additional details',
    'onTap': () {},
  },
  {
    'title': 'BENEFITS FROM SOCIAL ASSISTANCE PROGRAMMES',
    'subtitle': 'Name and additional details',
    'onTap': () => {},
  },
  {
    'title': 'Household Demographics',
    'subtitle': 'Medical history and additional details',
    'onTap': () => {},
  },
  {
    'title': 'Family',
    'subtitle': 'Medical history and additional details',
    'onTap': () => {},
  },
];

List<Widget> esrStepperWidgets = [
  const ESRHouseholdGeolocation(),
  const ESRBenefits(),
  const ESRHouseholdDemographic(),
  const ESRFamilyDetails(),
];
