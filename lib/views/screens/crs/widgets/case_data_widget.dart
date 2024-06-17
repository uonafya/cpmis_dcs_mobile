import 'package:cpims_dcs_mobile/models/crs_category.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/case_data_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/compulsary_question.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
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
  final String serialNumber = "";
  String selectedPerpetrator = "";
  String riskLevel = "";
  String referralsPresent = "";
  List<CRSCategory> caseCategories = [];
  List<String> immediateneeds = [];
  List<String> futureNeeds = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        const FormPageHeading(heading: "Case Data"),

        // Questions
        const CompulsaryQuestion(question: "Case Serial Number"),
        CustomTextField(
          initialValue: serialNumber,
          enabled: false,
        ),

        const CompulsaryQuestion(
            question: "Alleged Perpetrator / Offender Known? "),
        CustomDropdown(
            initialValue: pleaseSelect,
            items: perpetratorOptions,
            onChanged: (String value) {
              setState(() {
                selectedPerpetrator = value;
              });
            }),
        const SizedBox(
          height: 40,
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

        // Column(
        //   children: [
        //     // Case category and sub category
        //     Row(
        //       children: [
        //         Expanded(
        //           child: Row(
        //             children: [
        //               Text("Case Category(s)"),
        //               CustomDropdown(
        //                 initialValue: pleaseSelect,
        //                 items: items,
        //                 onChanged: onChanged
        //                 )
        //             ],)
        //         )
        //       ],
        //     )
        //   ],
        // ),

        const SizedBox(
          height: 10,
        ),
        const CompulsaryQuestion(question: "Risk Level"),
        CustomDropdown(
            initialValue: pleaseSelect,
            items: lowMedHighList,
            onChanged: (String val) {
              setState(() {
                riskLevel = val;
              });
            }),

        const CompulsaryQuestion(question: "Refferals Present?"),
        CustomDropdown(
            initialValue: pleaseSelect,
            items: yesNoList,
            onChanged: (String val) {
              setState(() {
                referralsPresent = val;
              });
            }),

        const CompulsaryQuestion(question: "Summons Issued?"),
        CustomDropdown(
            initialValue: pleaseSelect,
            items: yesNoList,
            onChanged: (String val) {
              setState(() {
                referralsPresent = val;
              });
            }),
        const SizedBox(
          height: 30,
        ),

        const CompulsaryQuestion(question: "Immediate Needs"),
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
          height: 10.0,
        ),

        const CompulsaryQuestion(question: "Future Needs"),
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
