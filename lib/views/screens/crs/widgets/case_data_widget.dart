import 'package:cpims_dcs_mobile/controller/crs_form_provider.dart';
import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/case_data_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_categories.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_category_item.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_perpetrators_modal.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_referral_items.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_referrals.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/compulsary_question.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown_multiselect.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';

class CaseDataWidget extends StatefulWidget {
  const CaseDataWidget({super.key});

  @override
  State<CaseDataWidget> createState() => _CaseDataWidgetState();
}

class _CaseDataWidgetState extends State<CaseDataWidget> {
  String selectedPerpetrator = pleaseSelect;
  String relationshipToChild = pleaseSelect;
  var firstName = TextEditingController();
  var surname = TextEditingController();
  var othernames = TextEditingController();
  String perpetratorSex = pleaseSelect;
  DateTime? perpetratorDOB;

  String referralActor = "";
  void updateReferralActor(value) {
    setState(() {
      referralActor = value;
    });
  }

  String specify = "";
  void updateSpecify(value) {
    setState(() {
      specify = value;
    });
  }

  String reason = "";
  void updateReason(value) {
    setState(() {
      reason = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Consumer<CRSFormProvider>(builder: (context, model, _) {
      return Form(
        key: formKey,
        child: Column(
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
              initialValue: model.caseData.serialNumber,
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
                initialValue: model.caseData.offenderKnown ?? pleaseSelect,
                items: perpetratorOptions,
                onChanged: (dynamic value) {
                  var update = model.caseData;

                  update.offenderKnown = value;
                  model.caseData = update;
                }),
            const SizedBox(
              height: mediumSpacing,
            ),

            // et details of perpetrator if known
            if (model.caseData.offenderKnown == AllegedPerpetratorOptions.known.value)
              Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:
                        CompulsaryQuestion(question: "Relationship to Child"),
                  ),
                  const SizedBox(
                    height: smallSpacing,
                  ),
                  CustomDropdown(
                      initialValue: relationshipToChild,
                      items: relationshipToChildOptions,
                      onChanged: (dynamic value) {
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
                    controller: firstName,
                    hintText: "First name",
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
                    controller: surname,
                    hintText: "Surname"
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
                    controller: othernames,
                    hintText: "Middle Name",
                  ),
                  const SizedBox(
                    height: mediumSpacing,
                  ),

                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sex",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )),
                  const SizedBox(
                    height: smallSpacing,
                  ),
                  CustomDropdown(
                      initialValue: perpetratorSex,
                      items: sexOptions,
                      onChanged: (dynamic value) {
                        setState(() {
                          perpetratorSex = value;
                        });
                      }),
                  const SizedBox(
                    height: mediumSpacing,
                  ),

                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date of Birth",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )),
                  const SizedBox(
                    height: smallSpacing,
                  ),
                  perpetratorDOB != null ?
                  CustomDatePicker(
                    initialDate: perpetratorDOB,
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                      onChanged: (DateTime time) {
                        setState(() {
                          perpetratorDOB = time;
                        });
                      }) : CustomDatePicker(
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                      onChanged: (DateTime time) {
                        setState(() {
                          perpetratorDOB = time;
                        });
                      }),
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
                      const SizedBox(
                        width: smallSpacing,
                      ),
                      CustomButton(
                          onTap: () {
                            // Save perpetrator
                            CaseDataCRSFormModel update = model.caseData;
                            Perpetrators perp = Perpetrators(
                              firstName: firstName.text,
                              lastName: surname.text,
                              othernames: othernames.text,
                              sex: perpetratorSex,
                              dateOfBirth: perpetratorDOB,
                            );

                            if (update.perpetrators.isEmpty) {
                              update.perpetrators = [perp];
                            } else {
                              update.perpetrators.add(perp);
                            }

                            model.caseData = update;

                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CaseDataMorePerpetratorsModal(
                                    perpetrators: model.caseData.perpetrators,
                                    updatePerpetrators:
                                        (List<Perpetrators> item) {
                                      CaseDataCRSFormModel updated =
                                          model.caseData;
                                      updated.perpetrators = item;
                                      model.caseData = updated;
                                    },
                                  );
                                });
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "More",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: mediumSpacing,
                  )
                ],
              ),

            const CompulsaryQuestion(question: "Case Category(s)"),
            const Divider(),
            const SizedBox(
              height: 10,
            ),

            // Display error if no case categories have been created
            if (model.caseData.crsCategories.isEmpty)
              const Text(
                "One or more case category is required",
                style: TextStyle(color: Colors.red),
              ),

            CaseCategoriesWidget(
              addCategory: (CRSCategory item) {
                CaseDataCRSFormModel update = model.caseData;

                if (update.crsCategories.isEmpty) {
                  update.crsCategories = [item];
                } else {
                  update.crsCategories.add(item);
                }
                model.caseData = update;
              },
            ),

            // Display filled categories
            Column(
              children: [
                for (var i = 0; i < model.caseData.crsCategories.length; i++)
                  CaseDataCategoryItem(
                    index: i,
                    removeItem: (int index) {
                      CaseDataCRSFormModel update = model.caseData;

                      update.crsCategories.removeAt(index);
                      model.caseData = update;
                    },
                    data: model.caseData.crsCategories[i],
                  )
              ],
            ),

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
                onChanged: (dynamic val) {
                  CaseDataCRSFormModel update = model.caseData;
                  update.riskLevel = val;
                  model.caseData = update;
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
                onChanged: (dynamic val) {
                  var update = model.caseData;
                  update.referralsPresent = val == YesNo.yes.value;
                  model.caseData = update;
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
                initialValue: boolToYesNo(model.caseData.summonsIssued).value,
                items: yesNoList,
                onChanged: (dynamic val) {
                  var update = model.caseData;
                  update.summonsIssued = val == YesNo.yes.value;
                  model.caseData = update;
                }),
            const SizedBox(
              height: 30,
            ),

            // If summons issued yes show date
            if (model.caseData.summonsIssued == true)
              Column(
                children: [
                  const CompulsaryQuestion(question: "Date of Summon: "),
                  const SizedBox(
                    height: smallSpacing,
                  ),
                  CustomDatePicker(onChanged: (DateTime value) {
                    CaseDataCRSFormModel update = model.caseData;
                    update.dateOfSummon = value;
                    model.caseData = update;
                  }),
                ],
              ),

            // If referalls present is yes show widget
            if (model.caseData.referralsPresent == true)
              Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: CompulsaryQuestion(question: "Referrals: ")),
                  const SizedBox(
                    height: smallSpacing,
                  ),
                  CaseDataReferrals(
                    updateReferralActors: (updateReferralActor),
                    referralActors: referralActor,
                    specify: specify,
                    updateSpecify: updateSpecify,
                    reason: reason,
                    updateReason: updateReason,
                    addReferral: (CRSReferral item) {
                      CaseDataCRSFormModel update = model.caseData;

                      if (update.referrals == null || update.referrals!.isEmpty ?? false) {
                        update.referrals = [item];
                      } else {
                        update.referrals!.add(item);
                      }

                      model.caseData = update;
                    },
                  ),

                  const SizedBox(
                    height: mediumSpacing,
                  ),

                  // Display filled case records
                  if (model.caseData.referrals?.isNotEmpty ?? false)
                    for (var i = 0; i < model.caseData.referrals!.length; i++)
                      CaseDataRefferalItem(
                        index: i,
                        removeItem: (int index) {
                          CaseDataCRSFormModel update = model.caseData;
                          update.referrals?.removeAt(index);
                          model.caseData = update;
                        },
                        data: model.caseData.referrals![i],
                      ),
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
                  CaseDataCRSFormModel update = model.caseData;

                  if (update.immediateNeeds.isEmpty) {
                    update.immediateNeeds = value;
                  } else {
                    update.immediateNeeds.addAll(value);
                  }
                  model.caseData = update;
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
                  CaseDataCRSFormModel update = model.caseData;

                  if (update.futureNeeds.isEmpty) {
                    update.futureNeeds = value;
                  } else {
                    update.futureNeeds.addAll(value);
                  }
                  model.caseData = update;
                },
                selectionType: SelectionType.multi,
                hint: pleaseSelect),

            // Case Narration
            const Align(
              alignment: Alignment.centerLeft,
              child: CompulsaryQuestion(question: "Case Narration")
            ),
            const SizedBox(
              height: smallSpacing
            ),
            CustomTextField(
              maxLines: 10,
              onChanged: (String text) {
                var update = model.caseData;
                update.caseNarration = text;
                model.caseData = update;
              },
            )
          ],
        ),
      );
    });
  }
}
