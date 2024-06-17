import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/social_inquiry/widgets/child_case_history_widget.dart';
import 'package:cpims_dcs_mobile/views/screens/social_inquiry/widgets/family_background_widget.dart';
import 'package:cpims_dcs_mobile/views/screens/social_inquiry/widgets/personal_information_widget.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_card.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/footer.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';

class SocialInquiry extends StatefulWidget {
  const SocialInquiry({super.key});
  @override
  State<SocialInquiry> createState() => _CRSHomeState();
}

class _CRSHomeState extends State<SocialInquiry> {
  List<String> criteria = [
    'Select Criteria',
    'Names',
    'Org Unit',
    'Residence',
    'CPIMS ID',
  ];
  String selectedTypeOfPerson = 'Please Select';
  String selectedCriteria = 'Select Criteria';
  List<Map<String, dynamic>> socialInquiryStepperData = [
    {'title': 'Details of the Child', 'subtitle': 'Details of the Child'},
    {'title': 'Family Background', 'subtitle': 'Family Background'},
    {
      'title': 'Case History of the Child',
      'subtitle': 'Case History of the Child'
    },
  ];
  int selectedIndex = 0;
  DateTime? selectedDate;

  void _goToNextStep() {
    if (selectedIndex < socialInquiryStepperData.length - 1) {
      setState(() {
        selectedIndex++;
      });
    }
  }

  void _goToPreviousStep() {
    if (selectedIndex > 0) {
      setState(() {
        selectedIndex--;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text('General Social Enquiry',
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
            CustomStepperWidget(
              data: socialInquiryStepperData,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedIndex: selectedIndex,
            ),
            const SizedBox(height: 20),
            CustomCard(
              title: socialInquiryStepperData[selectedIndex]['title'],
              children: <Widget>[
                socialInquiryWidgets[selectedIndex],
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: CustomButton(
                    text: 'Previous',
                    onTap: selectedIndex > 0 ? _goToPreviousStep : null,
                    color: Colors.transparent,
                    textColor: Colors.grey,
                    borderColor: Colors.grey,
                    borderRadius: 15,
                    height: 30,
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  width: 100,
                  child: CustomButton(
                    text: 'Next',
                    onTap: selectedIndex < socialInquiryStepperData.length - 1
                        ? _goToNextStep
                        : null,
                    color: const Color.fromARGB(255, 20, 89, 144),
                    textColor: Colors.white,
                    borderRadius: 15,
                    height: 30,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            // form input
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Date of Social Inquiry',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomDatePicker(
              hintText: 'Date',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                selectedIndex == 2
                    ? Expanded(
                        child: CustomButton(
                          text: 'Submit Form FMSI005F',
                          textColor: Colors.white,
                          onTap: selectedDate != null
                              ? () {}
                              : null, // Make it a required field
                        ),
                      )
                    : const SizedBox(),
                selectedIndex == 2
                    ? const SizedBox(width: 15)
                    : const SizedBox.shrink(),
                Expanded(
                  child: CustomButton(
                    text: 'Cancel',
                    textColor: Colors.white,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

List<Widget> socialInquiryWidgets = [
  const PersonalInformationWidget(),
  const FamilyBackgroundWidget(),
  const ChildCaseHistoryWidget(),
];
