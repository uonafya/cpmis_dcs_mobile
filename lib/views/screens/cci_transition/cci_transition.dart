import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown_multiselect.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:cpims_dcs_mobile/views/screens/cci_transition/lists.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';

class CCI extends StatefulWidget {
  const CCI({super.key});

  @override
  State<CCI> createState() => _CCIState();
}

class _CCIState extends State<CCI> {
  final placeOfServiceController = TextEditingController();
  String selectedCCI = 'Please Select a CCI';
  List<String> genders = [];
  Map<String, dynamic> selectedValues = {
    "cci_registered": false,
    "other_entity_registered": false,
    "cci_started_transiton": pleaseSelect,
    "child_accom_0_4_yrs": false,
    "child_accom_5_9_yrs": false,
    "child_accom_10_14_yrs": false,
    "child_accom_15_17_yrs": false,
    "child_accom_18plus_yrs": false,
    "reason_basis_transition": pleaseSelect,
    "legal_framework_strategy": pleaseSelect,
    "stakeholder_engagement": pleaseSelect,
    "making_decision": pleaseSelect,
    "assessment": pleaseSelect,
    "strategic_planning": pleaseSelect,
    "org_planning": pleaseSelect,
    "program_planning": pleaseSelect,
    "transiton_planning": pleaseSelect,
    "employee_development": pleaseSelect,
    "piloting_validation": pleaseSelect,
    "program_implement": pleaseSelect,
    "monitoring_eval": pleaseSelect,
    "program_transition_to": pleaseSelect,
    "survival_rights": pleaseSelect,
    "dev_rights": pleaseSelect,
    "protection_rights": pleaseSelect,
    "participate_rights": pleaseSelect
  };

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
                                items: cciLists,
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
                                value: selectedValues['cci_registered'],
                                onChanged: (val) {
                                  setState(() {
                                    selectedValues['cci_registered'] = val;
                                  });
                                }),
                            if (selectedValues['cci_registered'])
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    hintText: "if Yes, Registration number",
                                    controller: placeOfServiceController,
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
                                          selectedValues.putIfAbsent(
                                              "cci_registered_date", () => val);
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
                                      onChanged: (val) {
                                        setState(() {
                                          selectedValues.putIfAbsent(
                                              "cci_registered_date_expiry",
                                              () => val);
                                        });
                                      }),
                                ],
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (selectedValues['cci_registered'] == false)
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
                                      value: selectedValues[
                                          'other_entity_registered'],
                                      onChanged: (val) {
                                        setState(() {
                                          selectedValues[
                                              'other_entity_registered'] = val;
                                        });
                                      }),
                                  if (selectedValues['other_entity_registered'])
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
                                              selectedValues.putIfAbsent(
                                                  "other_registered_type",
                                                  () => val);
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextField(
                                          hintText:
                                              "if Yes, Registration number",
                                          controller: placeOfServiceController,
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
                                                selectedValues.putIfAbsent(
                                                    "other_date_registered",
                                                    () => val);
                                              });
                                            }),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Valid until: (in years) *',
                                          style: TextStyle(color: kTextGrey),
                                        ),
                                        CustomDatePicker(
                                            hintText: 'Valid until:',
                                            onChanged: (val) {
                                              setState(() {
                                                selectedValues.putIfAbsent(
                                                    "other_date_registered_expiry",
                                                    () => val);
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
                                    selectedValues["cci_serves_disabled"] =
                                        item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomDropDownMultiSelect(
                                options: gender,
                                onOptionSelected: (List<String> value) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "select_geneders_served", () => value);
                                  });
                                },
                                selectionType: SelectionType.multi,
                                hint: "Select Sex"),
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
                                        selectedValues['child_accom_0_4_yrs'],
                                    onChanged: (val) {
                                      setState(() {
                                        selectedValues.putIfAbsent(
                                            "child_accom_0_4_yrs", () => val);
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
                                        selectedValues['child_accom_5_9_yrs'],
                                    onChanged: (val) {
                                      setState(() {
                                        selectedValues['child_accom_5_9_yrs'] =
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
                                        selectedValues['child_accom_15_17_yrs'],
                                    onChanged: (val) {
                                      setState(() {
                                        selectedValues[
                                            'child_accom_15_17_yrs'] = val;
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
                                        selectedValues['child_accom_15_17_yrs'],
                                    onChanged: (val) {
                                      setState(() {
                                        selectedValues[
                                            'child_accom_15_17_yrs'] = val;
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
                                    value: selectedValues[
                                        'child_accom_18plus_yrs'],
                                    onChanged: (val) {
                                      setState(() {
                                        selectedValues[
                                            'child_accom_18plus_yrs'] = val;
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
                                    selectedValues['cci_started_transiton'],
                                items: yesNoOptions,
                                onChanged: (item) {
                                  setState(() {
                                    // selectedQuestion = item;
                                    selectedValues['cci_started_transiton'] =
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
                                    selectedValues['reason_basis_transition'],
                                items: cciAwareOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "reason_basis_transition", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                                "Understanding the legal framework/strategy  "),
                            CustomDropdown(
                                initialValue:
                                    selectedValues['legal_framework_strategy'],
                                items: cciAwareOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "legal_framework_strategy", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Stakeholder engagement  "),
                            CustomDropdown(
                                initialValue:
                                    selectedValues['stakeholder_engagement'],
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "stakeholder_engagement", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Making the decision  "),
                            CustomDropdown(
                                initialValue: selectedValues['making_decision'],
                                items: cciDecisionOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "making_decision", () => item);
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
                                initialValue: selectedValues['assessment'],
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues['assessment'] = item;
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Strategic Planning"),
                            CustomDropdown(
                                initialValue:
                                    selectedValues['strategic_planning'],
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "strategic_planning", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Organizational planning"),
                            CustomDropdown(
                                initialValue: selectedValues['org_planning'],
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "org_planning", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Program planning"),
                            CustomDropdown(
                                initialValue:
                                    selectedValues['program_planning'],
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "program_planning", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Transition planning"),
                            CustomDropdown(
                                initialValue:
                                    selectedValues['transiton_planning'],
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "transiton_planning", () => item);
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
                                    selectedValues['employee_development'],
                                items: cciDoneOptions,
                                onChanged: (String item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "employee_development", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Piloting and validation "),
                            CustomDropdown(
                                initialValue:
                                    selectedValues['piloting_validation'],
                                items: cciDoneOptions,
                                onChanged: (String item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "piloting_validation", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Program implementation"),
                            CustomDropdown(
                                initialValue:
                                    selectedValues['program_implement'],
                                items: cciDoneOptions,
                                onChanged: (String item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "program_implement", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Monitoring and evaluation"),
                            CustomDropdown(
                                initialValue: selectedValues['monitoring_eval'],
                                items: cciDoneOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "monitoring_eval", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                                "Which programme has the CCI transition to? "),
                            CustomDropdown(
                                initialValue:
                                    selectedValues['program_transition_to'],
                                items: cciProgramsOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "program_transition_to", () => item);
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
                                initialValue: selectedValues['survival_rights'],
                                items: cciSurvivalRightsOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "survival_rights", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Development rights"),
                            CustomDropdown(
                                initialValue: selectedValues['dev_rights'],
                                items: cciDevRightsOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "dev_rights", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Protection rights"),
                            CustomDropdown(
                                initialValue:
                                    selectedValues['protection_rights'],
                                items: cciProtectRightsOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "protection_rights", () => item);
                                  });
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Participation rights"),
                            CustomDropdown(
                                initialValue: selectedQuestion,
                                items: cciParticipateRightsOptions,
                                onChanged: (item) {
                                  setState(() {
                                    selectedValues.putIfAbsent(
                                        "participate_rights", () => item);
                                  });
                                  print(selectedValues);
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
                          onTap: () {
                            setState(() {});
                            print(selectedValues);
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
