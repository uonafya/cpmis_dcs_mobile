import 'package:cpims_dcs_mobile/controller/crs_form_provider.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/constants/get_age_from_dob.dart';
import 'package:cpims_dcs_mobile/core/network/crs_form.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/crs_home.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/steps.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/follow_up_home.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/custom_drawer.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/home_page.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_consent_form.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CaseRegistrationSheet extends StatefulWidget {
  const CaseRegistrationSheet({
    super.key,
  });

  @override
  State<CaseRegistrationSheet> createState() => _CaseRegistrationSheetState();
}

class _CaseRegistrationSheetState extends State<CaseRegistrationSheet> {
  var selectedStep = 0;
  bool hasConcented = false;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: Consumer<CRSFormProvider>(
        builder: (context, model, _) {
          return Padding(
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
                            text:
                                "${model.form.about?.initialDetails.firstName} ${model.about?.initialDetails.otherNames} ${model.about?.initialDetails.surName}| "
                                    .toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "${model.form.about?.initialDetails.sex} | ",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: model.form.about?.initialDetails
                                        .dateOfBirth ==
                                    null
                                ? ""
                                : getAgeFromDateOf(model.form.about!
                                            .initialDetails.dateOfBirth!) <
                                        1
                                    ? "Under 1 Year |"
                                    : "${getAgeFromDateOf(model.form.about!.initialDetails.dateOfBirth!)} Years |",
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

                // Form body
                hasConcented == false
                    ? ConsentForm(
                        update: (bool value) {
                          setState(() {
                            hasConcented = value;
                          });
                        },
                        message: "You have concented to filling the form",
                      )
                    : Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey[300]!, width: 1.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0))),
                        padding: const EdgeInsets.all(15.0),
                        child: crsStepperWidgets[selectedStep],
                      ),
                const SizedBox(
                  height: 10,
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
                          if (selectedStep == crsStepperWidgets.length - 1) {
                            // Print data
                            var cprdata = Provider.of<CRSFormProvider>(
                                listen: false, context);
                            debugPrint("--------CRS DATA----------------");
                            debugPrint(cprdata.form.toJSON().toString());
                            debugPrint("--------------------------------");

                            // Save to DB
                            var form = cprdata.form;
                            var db = await localdb.database;
                            var uuid = const Uuid();
                            var formID = uuid.v4();
                            
                            CRSDatabaseForm.storeFormInDB(cprdata.form, db, formID);
                            await form.sendToUpstream();

                            Get.to(() => const CRSHome());
                          }
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
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
