import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/social_inquiry_form_model.dart';
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
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class SocialInquiry extends StatefulWidget {
  const SocialInquiry({super.key, required this.crsDetails});
  final CaseLoadModel crsDetails;
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

  final caseHistoryController = TextEditingController();
  final caseObservationController = TextEditingController();
  final caseRecomendationController = TextEditingController();
  final caseSubCountyController = TextEditingController();
  final nameOfOfficerController = TextEditingController();
  final officerTelephoneController = TextEditingController();
  String? dateOfSocialInquiry;
  void submitForm() async {
    // if (formKey.currentState!.validate()) {
    final inquiry = SocialInquiryFormModel(
        caseHistory: caseHistoryController.text,
        caseObservation: caseObservationController.text,
        caseRecommendation: caseRecomendationController.text,
        subCountyChildrenOffice: caseSubCountyController.text,
        officerName: nameOfOfficerController.text,
        officerPhone: officerTelephoneController.text,
        caseId: widget.crsDetails.caseID,
        dateOfSocialInquiry: dateOfSocialInquiry);
    print(inquiry.toJson());
    final db = LocalDB.instance;
    await db.insertSocialInquiryForm(inquiry);
    Get.back();
    showSuccessSnackBar(context, "Social Inquiry Form Submitted Successfully");
    // }
  }

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> socialInquiryWidgets = [
      PersonalInformationWidget(
        caseLoad: widget.crsDetails,
      ),
      FamilyBackgroundWidget(
        caseLoadModel: widget.crsDetails,
      ),
      ChildCaseHistoryWidget(
        caseHistoryController: caseHistoryController,
        caseObservationController: caseObservationController,
        caseRecommendationController: caseRecomendationController,
        caseSubCountyController: caseSubCountyController,
        nameOfOfficerController: nameOfOfficerController,
        officerTelephoneController: officerTelephoneController,
        dateOfSocialInquiry: dateOfSocialInquiry,
      ),
    ];
    return Scaffold(
      appBar: customAppBar(),
      drawer: const Drawer(),
      body: WillPopScope(
        onWillPop: () async {
          if (selectedIndex == 0) {
            return true;
          } else {
            setState(() {
              selectedIndex--;
            });
            return false;
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
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
                  'Form FMSI005F',
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
                        isDisabled: selectedIndex == 0,
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 100,
                      child: CustomButton(
                        isDisabled: selectedIndex == 2,
                        text: 'Next',
                        onTap: _goToNextStep,
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
                CustomDatePicker(
                  hintText: 'Date',
                  onChanged: (val) {
                    setState(() {
                      dateOfSocialInquiry =
                          DateFormat('yyyy-MM-dd').format(val);
                    });
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    selectedIndex == 2
                        ? Expanded(
                            child: CustomButton(
                              text: 'Submit',
                              textColor: Colors.white,
                              onTap: () {
                                submitForm();
                              },
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
        ),
      ),
    );
  }
}
