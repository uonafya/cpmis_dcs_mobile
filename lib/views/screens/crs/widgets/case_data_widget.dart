import 'package:cpims_dcs_mobile/models/crs_category.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/case_data_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_categories.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_perpetrators_modal.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_referrals.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/compulsary_question.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/compulsary_question_with_tooltip.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown_multiselect.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class CaseDataWidget extends StatefulWidget {
  const CaseDataWidget({super.key});

  @override
  State<CaseDataWidget> createState() => _CaseDataWidgetState();
}

class _CaseDataWidgetState extends State<CaseDataWidget> {
  final String serialNumber = "CNSCANCDCFA";
  String selectedPerpetrator = pleaseSelect;
  String riskLevel = pleaseSelect;
  String referralsPresent = pleaseSelect;
  List<CRSCategory> caseCategories = [];
  List<String> immediateneeds = [];
  List<String> futureNeeds = [];
  String relationshipToChild = pleaseSelect;
  String firstName = "";
  String surname = "";
  String othernames = "";
  String summonsIssued = pleaseSelect;
  late DateTime summonsDate;

  String referralActor = "";
  void updateReferralActor(String value) {
    setState(() {
      referralActor = value;
    });
  }

  String specify = "";
  void updateSpecify(String value) {
    setState(() {
      specify = value;
    });
  }

  String reason = "";
  void updateReason(String value) {
    setState(() {
      reason = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title of section
        const FormPageHeading(heading: "Case Data"),
        const SizedBox(
          height: mediumSpacing,
        ),

        // Questions
        const Align(
            alignment: Alignment.centerLeft,
            child: CompulsaryQuestion(question: "Case Serial Number")),
        const SizedBox(
          height: smallSpacing,
        ),
        CustomTextField(
          initialValue: serialNumber,
          enabled: false,
        ),
        const SizedBox(
          height: mediumSpacing,
        ),

        const Align(
          alignment: Alignment.centerLeft,
          child: CompulsaryQuestion(
              question: "Alleged Perpetrator / Offender Known? "),
        ),
        const SizedBox(
          height: smallSpacing,
        ),
        CustomDropdown(
            initialValue: selectedPerpetrator,
            items: perpetratorOptions,
            onChanged: (String value) {
              setState(() {
                selectedPerpetrator = value;
              });
            }),
        const SizedBox(
          height: mediumSpacing,
        ),

        // et details of perpetrator if known
        if (selectedPerpetrator == AllegedPerpetratorOptions.known.value)
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: CompulsaryQuestion(question: "Relationship to Child"),
              ),
              const SizedBox(
                height: smallSpacing,
              ),
              CustomDropdown(
                  initialValue: relationshipToChild,
                  items: relationshipToChildOptions,
                  onChanged: (String value) {
                    setState(() {
                      relationshipToChild = value;
                    });
                  }),
              const SizedBox(
                height: mediumSpacing,
              ),

              // Names part
              const Align(
                alignment: Alignment.centerLeft,
                child: CompulsaryQuestion(question: "First name"),
              ),
              const SizedBox(
                height: smallSpacing,
              ),
              CustomTextField(
                hintText: "First name",
                onChanged: (String value) {
                  setState(() {
                    firstName = value;
                  });
                },
              ),
              const SizedBox(
                height: mediumSpacing,
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: CompulsaryQuestion(question: "Surname"),
              ),
              const SizedBox(
                height: smallSpacing,
              ),
              CustomTextField(
                hintText: "Surname",
                onChanged: (String value) {
                  setState(() {
                    surname = value;
                  });
                },
              ),
              const SizedBox(
                height: mediumSpacing,
              ),

              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Other name(s)",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
              const SizedBox(
                height: smallSpacing,
              ),
              CustomTextField(
                hintText: "Middle Name",
                onChanged: (String value) {
                  setState(() {
                    othernames = value;
                  });
                },
              ),
              const SizedBox(
                height: mediumSpacing,
              ),

              // Perpertrators modal
              Row(
                children: [
                  const Text(
                    "Perpetrators",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const CaseDataMorePerpetratorsModal();
                            });
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("More")
                        ],
                      ))
                ],
              )
            ],
          ),

        const CompulsaryQuestion(question: "Case Category(s)"),
        const Divider(),
        const SizedBox(
          height: 10,
        ),

        // Display error if no case categories have been created
        if (caseCategories.isEmpty)
          const Text(
            "One or more case category is required",
            style: TextStyle(color: Colors.red),
          ),

        CaseCategoriesWidget(),

        const SizedBox(
          height: mediumSpacing,
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: CompulsaryQuestion(question: "Risk Level")),
        const SizedBox(
          height: smallSpacing,
        ),
        CustomDropdown(
            initialValue: pleaseSelect,
            items: lowMedHighList,
            onChanged: (String val) {
              setState(() {
                riskLevel = val;
              });
            }),
        const SizedBox(
          height: mediumSpacing,
        ),

        const Align(
            alignment: Alignment.centerLeft,
            child: CompulsaryQuestion(question: "Refferals Present?")),
        const SizedBox(
          height: smallSpacing,
        ),
        CustomDropdown(
            initialValue: pleaseSelect,
            items: yesNoList,
            onChanged: (String val) {
              setState(() {
                referralsPresent = val;
              });
            }),
        const SizedBox(
          height: mediumSpacing,
        ),

        const Align(
            alignment: Alignment.centerLeft,
            child: CompulsaryQuestion(question: "Summons Issued?")),
        const SizedBox(
          height: smallSpacing,
        ),
        CustomDropdown(
            initialValue: summonsIssued,
            items: yesNoList,
            onChanged: (String val) {
              setState(() {
                summonsIssued = val;
              });
            }),
        const SizedBox(
          height: 30,
        ),

        // If summons issued yes show date
        if (summonsIssued == YesNo.yes.value)
          Column(
            children: [
              const CompulsaryQuestion(question: "Date of Summon: "),
              const SizedBox(
                height: smallSpacing,
              ),
              CustomDatePicker(onChanged: (DateTime value) {
                setState(() {
                  summonsDate = value;
                });
              }),
            ],
          ),

        // If referalls present is yes show widget
        if (referralsPresent == YesNo.yes.value)
          Column(
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: CompulsaryQuestion(question: "Referrals: ")),
              const SizedBox(
                height: smallSpacing,
              ),
              CaseDataReferrals(
                  updateReferralActors: updateReferralActor,
                  referralActors: referralActor,
                  specify: specify,
                  updateSpecify: updateSpecify,
                  reason: reason,
                  updateReason: updateReason),
            ],
          ),

        const Align(
            alignment: Alignment.centerLeft,
            child: CompulsaryQuestion(question: "Immediate Needs")),
        const SizedBox(
          height: smallSpacing,
        ),
        CustomDropDownMultiSelect(
            options: immediateNeedsOptions,
            onOptionSelected: (List<String> value) {
              immediateneeds.addAll(value);
              setState(() {
                immediateneeds = immediateneeds;
              });
            },
            selectionType: SelectionType.multi,
            hint: pleaseSelect),
        const SizedBox(
          height: mediumSpacing,
        ),

        const Align(
            alignment: Alignment.centerLeft,
            child: CompulsaryQuestion(question: "Future Needs")),
        const SizedBox(
          height: smallSpacing,
        ),
        CustomDropDownMultiSelect(
            options: futureNeedsOptions,
            onOptionSelected: (List<String> value) {
              futureNeeds.addAll(value);
              setState(() {
                futureNeeds = futureNeeds;
              });
            },
            selectionType: SelectionType.multi,
            hint: pleaseSelect),
      ],
    );
  }
}
