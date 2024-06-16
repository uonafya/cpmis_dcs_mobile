import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/steps.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';

class CaseRegistrationSheet extends StatefulWidget {
  const CaseRegistrationSheet({super.key});

  @override
  State<CaseRegistrationSheet> createState() => _CaseRegistrationSheetState();
}

class _CaseRegistrationSheetState extends State<CaseRegistrationSheet> {
  var selectedStep = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          controller: _scrollController,
          children: <Widget>[
            const SizedBox(height: 20),
            Wrap(
              children: [
                RichText(
                  text: TextSpan(
                    text: "Forms ",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kTextGrey,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                        text: "New Case Record Sheet ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: "Wakili Mkuu |".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: "Female | ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: "Under 1 year ||".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // stepper
            CustomStepperWidget(
              data: crsStepperData,
              onTap: (int index) {
                setState(() {
                  selectedStep = index;
                });
              },
              selectedIndex: selectedStep,
            ),
            const SizedBox(
              height: 20,
            ),
            crsStepperWidgets[selectedStep],
            const SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomButton(
                    text: selectedStep <= 0 ? 'Cancel' : 'Previous',
                    onTap: () {
                      if (selectedStep == 0) {
                        Navigator.pop(context);
                      }
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                      );
                      setState(() {
                        if (selectedStep > 0) {
                          selectedStep--;
                        }
                      });
                    },
                    color: kTextGrey,
                  ),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: CustomButton(
                    text: selectedStep == crsStepperWidgets.length - 1
                        ? 'Submit'
                        : 'Next',
                    onTap: () async {
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                      );
                      setState(() {
                        if (selectedStep < crsStepperWidgets.length - 1) {
                          selectedStep++;
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
