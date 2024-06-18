import 'package:cpims_dcs_mobile/views/screens/crs/constants/case_data_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_relationships_item.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_info_box.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CaseDataMorePerpetratorsModal extends StatefulWidget {
  const CaseDataMorePerpetratorsModal({super.key});

  @override
  State<CaseDataMorePerpetratorsModal> createState() =>
      _CaseDataMorePerpetratorsModalState();
}

class _CaseDataMorePerpetratorsModalState
    extends State<CaseDataMorePerpetratorsModal> {
  String relationship = pleaseSelect;
  String additionalRelationship = pleaseSelect;
  String firstName = "";
  String lastName = "";
  String otherNames = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // Title
          const FormPageHeading(
            heading: "More Perpetrators",
            hasClosePage: true,
          ),
          const SizedBox(
            height: mediumSpacing,
          ),

          h2Text("Relationship"),
          const SizedBox(
            height: smallSpacing,
          ),
          CustomDropdown(
              initialValue: relationship,
              items: relationshipToChildOptions,
              onChanged: (String value) {
                setState(() {
                  relationship = value;
                });
              }),
          const SizedBox(
            height: smallSpacing,
          ),
          CustomDropdown(
            initialValue: additionalRelationship,
            items: additionalRelationshipToChildOptions,
            onChanged: (String value) {
              setState(() {
                additionalRelationship = value;
              });
            },
          ),
          const SizedBox(
            height: mediumSpacing,
          ),
          const Divider(),

          // Names
          h2Text("Names"),
          const SizedBox(
            height: smallSpacing,
          ),
          CustomTextField(
            hintText: "First Name",
            onChanged: (String value) {
              setState(() {
                firstName = value;
              });
            },
          ),
          const SizedBox(
            height: smallSpacing,
          ),
          CustomTextField(
            hintText: "Last Name",
            onChanged: (String value) {
              setState(() {
                lastName = value;
              });
            },
          ),
          const SizedBox(
            height: smallSpacing,
          ),
          CustomTextField(
            hintText: "Other Name(s)",
            onChanged: (String value) {
              setState(() {
                otherNames = value;
              });
            },
          ),
          const SizedBox(
            height: mediumSpacing,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 60),
              child: CustomButton(
                text: "Add",
                onTap: () {
                  debugPrint("Tapped");
                },
              ),
            ),
          ),
          const SizedBox(
            height: mediumSpacing,
          ),

          const CustomInfoBox(
              child: Text(
                  "You can add up to Four(4) more Perpetrators totaling to Five(5) but first fill the First one on the main page. Only use this to add from the 2nd, 3rd, 4th and 5th.")),
          const SizedBox(
            height: mediumSpacing,
          ),

          // Selected relationships
          const CaseDataRelationshipItem(data: {
            "relationship": "Dad",
            "firstname": "Bob",
            "surname": "Onyango",
            "othernames": "Bentley"
          }),
          const SizedBox(
            height: mediumSpacing,
          ),

          // Actions
          SizedBox(
            width: 200,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        debugPrint("Close");
                      },
                      child: const Text("Close")),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: TextButton(
                  onPressed: () {
                    debugPrint("Action");
                  },
                  child: const Text("Action"),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

Text h2Text(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 16.0),
  );
}
