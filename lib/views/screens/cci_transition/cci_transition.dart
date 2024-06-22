
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/core/network/mobile_settings.dart';
import 'package:intl/intl.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd");

class CCI extends StatefulWidget {
  const CCI({super.key});

  @override
  State<CCI> createState() => _CCIState();
}

class _CCIState extends State<CCI> {
  List<String> orgUnits = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final data = await getOrganizationalUnits(null);
      orgUnits = data.map((e) => e.name ?? "-").toList();
      setState(() {});
    });
  }
  List<String> cciGenders = [];
  List<String> cciAges = [];
  String selectedCCI = 'Please Select a CCI';
  bool? cciNCCSRegistered = false;
  final cciRegNo = TextEditingController();
  String cciRegDate = '';
  final cciRegValidYrs = TextEditingController();
  bool? cciOtherRegistered = false;
  String cciRegOtherType = "";
  String cciServesDisabled = "";
  String cciServesGender = "";
  bool? cciAgeGroupsOne =false;
  bool? cciAgeGroupsTwo =false;
  bool? cciAgeGroupsThree=false;
  bool? cciAgeGroupsFour =false;
  bool? cciAgeGroupsFive =false;
  String cciStartedTransition = pleaseSelect;
  String cciBasisOfTransition = pleaseSelect;
  String cciLegaFramework = pleaseSelect;
  String cciStakeholderEngagement = pleaseSelect;
  String cciMakeDecision = pleaseSelect;
  String cciAssessment = pleaseSelect;
  String cciStrategicPlanning = pleaseSelect;
  String cciOrganizationPlanning = pleaseSelect;
  String cciProgramPlanning = pleaseSelect;
  String cciTransitionPlanning = pleaseSelect;
  String cciEmployeeDev = pleaseSelect;
  String cciPilotValidation = pleaseSelect;
  String cciProgramImplementation = pleaseSelect;
  String cciMonitorEvaluate = pleaseSelect;
  String cciTransitionTo = pleaseSelect;
  List<String> cciSurvivalRights = [];
  List<String> cciDevRights = [];
  List<String> cciProtectionRights = [];
  List<String> cciParticipationRights = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 14),
                  const Text("CCI Transition Form",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'CCI details',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomDropdown(
                                initialValue: selectedCCI,
                                items: orgUnits,
                                onChanged: (val) {
                                  setState(() {
                                    selectedCCI = val;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Is it registered with NCCS ?"),
                            Checkbox(
                                value:cciNCCSRegistered,
                                onChanged: (val) {
                                  setState(() {
                                    cciNCCSRegistered = val;
                                  });
                                }),
                            if (cciNCCSRegistered == true)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    hintText: "if Yes, Registration number",
                                    controller: cciRegNo,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Registration Number required";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Date of registration *',
                                    style: TextStyle(color: kTextGrey),
                                  ),
                                  CustomDatePicker(
                                      hintText: 'Date of Registration',
                                      lastDate: DateTime.now(),
                                      firstDate: DateTime(1970, 12, 31, 11, 59),
                                      onChanged: (val) {
                                        setState(() {
                                          cciRegDate = dateFormat.format(val);
                                        });
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Valid Unitl (Yrs)  *',
                                    style: TextStyle(color: kTextGrey),
                                  ),
                                  CustomTextField(
                                      hintText: 'Valid until: (in years)',
                                      controller: cciRegValidYrs,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Valid years required";
                                        }
                                        return null;
                                      }),
                                ],
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (cciNCCSRegistered == false)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'CCI registered by another entity ?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        backgroundColor: Colors.amberAccent),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      "CCI Registered by another Entity"),
                                  Checkbox(
                                      value: cciOtherRegistered,
                                      onChanged: (val) {
                                        setState(() {
                                          cciOtherRegistered = val;
                                        });
                                      }),
                                  if (cciOtherRegistered != false)
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Select Registration type:"),
                                        CustomDropdown(
                                          initialValue: "Please Select",
                                          items: const [
                                            "Please Select",
                                            "NGO",
                                            "CBO",
                                            "FBO",
                                            "Trust",
                                            "Company",
                                            "Society"
                                          ],
                                          onChanged: (val) {
                                            setState(() {
                                              cciRegOtherType = val;
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextField(
                                          hintText:
                                          "if Yes, Registration number",
                                          controller: cciRegNo,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Registration Number required";
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Date of registration *',
                                          style: TextStyle(color: kTextGrey),
                                        ),
                                        CustomDatePicker(
                                            hintText: 'Date of Registration',
                                            onChanged: (val) {
                                              setState(() {
                                                cciRegDate= dateFormat.format(val);
                                              });
                                            }),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Valid until: (in years) *',
                                          style: TextStyle(color: kTextGrey),
                                        ),
                                        CustomTextField(
                                            hintText:
                                            'Other Entity Valid until: (in years)',
                                            controller: cciRegValidYrs,
                                            onChanged: (val) {
                                              setState(() {

                                              });
                                            }),
                                      ],
                                    ),
                                ],
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Category of Accommodated Children',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  backgroundColor: Colors.amberAccent),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomDropdown(
                                initialValue: "Select Disability",
                                items: cciDisability,
                                onChanged: (item) {
                                  setState(() {
                                    cciServesDisabled = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Please Select Sex: "),
                            CustomDropdown(
                              items: genders,
                              isMultiSelect: true,
                              initialValue: const ["Please Select Sex: "],
                              onChanged: (item) {
                                setState(() {
                                  cciServesGender = item.join(";");
                                });
                                print(cciServesGender);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Select Age Groups of Children: "),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value:
                                    cciAgeGroupsOne,
                                    onChanged: (val) {
                                      setState(() {
                                        cciAgeGroupsOne =
                                            val;
                                      });
                                    }),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("0-4 Years"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value:
                                    cciAgeGroupsTwo,
                                    onChanged: (val) {
                                      setState(() {
                                        cciAgeGroupsTwo =
                                            val;
                                      });
                                    }),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("5 - 9 Years"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value:
                                    cciAgeGroupsThree,
                                    onChanged: (val) {
                                      setState(() {
                                        cciAgeGroupsThree = val;
                                      });
                                    }),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("10 -14 Years"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value:
                                    cciAgeGroupsFour,
                                    onChanged: (val) {
                                      setState(() {
                                        cciAgeGroupsFour = val;
                                      });
                                    }),
                                const SizedBox(width: 5),
                                const Text("15 - 17 Years"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: cciAgeGroupsFive,
                                    onChanged: (val) {
                                      setState(() {
                                        cciAgeGroupsFive = val;
                                      });
                                    }),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("18+ Years ?"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              ' Phase 1 - Learning and decision making',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  backgroundColor: Colors.amberAccent),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                                "Has the CCI started the transitioning process? "),
                            CustomDropdown(
                                initialValue:
                                cciStartedTransition,
                                items: yesNoOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciStartedTransition =
                                        item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                                "Learning the reason and basis for transition  "),
                            CustomDropdown(
                                initialValue:
                                cciBasisOfTransition,
                                items: cciAwareOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciBasisOfTransition =  item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                                "Understanding the legal framework/strategy  "),
                            CustomDropdown(
                                initialValue:
                                cciLegaFramework,
                                items: cciAwareOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciLegaFramework=  item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Stakeholder engagement  "),
                            CustomDropdown(
                                initialValue:
                                cciStakeholderEngagement,
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciStakeholderEngagement =item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Making the decision  "),
                            CustomDropdown(
                                initialValue: cciMakeDecision,
                                items: cciDecisionOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciMakeDecision = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Phase 2  Preparing for transitioning',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  backgroundColor: Colors.amberAccent),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Assessment"),
                            CustomDropdown(
                                initialValue: cciAssessment,
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciAssessment = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Strategic Planning"),
                            CustomDropdown(
                                initialValue:
                                cciStrategicPlanning,
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciStrategicPlanning = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Organizational planning"),
                            CustomDropdown(
                                initialValue: cciOrganizationPlanning,
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciOrganizationPlanning = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Program planning"),
                            CustomDropdown(
                                initialValue:
                                cciProgramPlanning,
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciProgramPlanning = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Transition planning"),
                            CustomDropdown(
                                initialValue:
                                cciTransitionPlanning,
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciTransitionPlanning = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Phase 3. Implementing the transition',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  backgroundColor: Colors.amberAccent),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Employee Development"),
                            CustomDropdown(
                                initialValue:
                                cciEmployeeDev,
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciEmployeeDev = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Piloting and validation "),
                            CustomDropdown(
                                initialValue:
                                cciPilotValidation,
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciPilotValidation = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Program implementation"),
                            CustomDropdown(
                                initialValue:
                                cciProgramImplementation,
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciProgramImplementation = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Monitoring and evaluation"),
                            CustomDropdown(
                                initialValue: cciMonitorEvaluate,
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciMonitorEvaluate = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                                "Which programme has the CCI transition to? "),
                            CustomDropdown(
                                initialValue:
                                cciTransitionTo,
                                items: cciProgramsOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciTransitionTo = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'If implementing a child welfare program which areas of intervention are being addressed?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  backgroundColor: Colors.amberAccent),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Survival rights"),
                            CustomDropdown(
                                isMultiSelect: true,
                                initialValue: cciSurvivalRights,
                                items: cciSurvivalRightsOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciSurvivalRights= item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Development rights"),
                            CustomDropdown(
                                isMultiSelect: true,
                                initialValue: cciDevRights,
                                items: cciDevRightsOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciDevRights = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Protection rights"),
                            CustomDropdown(
                                isMultiSelect: true,
                                initialValue:
                                cciProtectionRights,
                                items: cciProtectRightsOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciProtectionRights = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Participation rights"),
                            CustomDropdown(
                                isMultiSelect: true,
                                initialValue:
                                cciParticipationRights,
                                items: cciParticipateRightsOptions,
                                onChanged: (item) {
                                  setState(() {
                                    cciParticipationRights = item;
                                  });
                                  print(cciParticipationRights);
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Submit',
                          onTap:  () async {

                            if(cciAgeGroupsOne == true){cciAges.add('0_4_yrs');}
                            if(cciAgeGroupsTwo == true){cciAges.add('5_9_yrs');}
                            if(cciAgeGroupsThree == true){cciAges.add('10_14_yrs');}
                            if(cciAgeGroupsFour == true){cciAges.add('15_17_yrs');}
                            if(cciAgeGroupsFive == true){cciAges.add('18_plus_yrs');}
                            final db = LocalDB.instance;
                            db.saveCciTransition(
                              selectedCCI: selectedCCI,
                              cciNCCSRegistered: cciNCCSRegistered,
                              cciRegNo: cciRegNo.text,
                              cciRegDate: cciRegDate,
                              cciRegValidYrs: cciRegValidYrs.text,
                              cciOtherRegistered: cciOtherRegistered,
                              cciServesDisabled: cciServesDisabled,
                              cciServesGender: cciServesGender,
                              cciAges: cciAges.join(";"),
                              cciStartedTransition: cciStartedTransition,
                              cciBasisOfTransition: cciBasisOfTransition,
                              cciLegaFramework: cciLegaFramework,
                              cciStakeholderEngagement: cciStakeholderEngagement,
                              cciMakeDecision: cciMakeDecision,
                              cciAssessment: cciAssessment,
                              cciStrategicPlanning: cciStrategicPlanning,
                              cciOrganizationPlanning: cciOrganizationPlanning,
                              cciProgramPlanning: cciProgramPlanning,
                              cciTransitionPlanning: cciTransitionPlanning,
                              cciEmployeeDev: cciEmployeeDev,
                              cciPilotValidation: cciPilotValidation,
                              cciProgramImplementation: cciProgramImplementation,
                              cciMonitorEvaluate: cciMonitorEvaluate,
                              cciTransitionTo: cciTransitionTo,
                              cciSurvivalRights: cciSurvivalRights.join(";"),
                              cciDevRights: cciDevRights.join(";"),
                              cciProtectionRights: cciProtectionRights.join(";"),
                              cciParticipationRights: cciParticipationRights.join(";"),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}