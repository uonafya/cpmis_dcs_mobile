import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/case_data_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_relationships_item.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_info_box.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CaseDataMorePerpetratorsModal extends StatefulWidget {
  final Function(List<Perpetrators> item) updatePerpetrators;
  final List<Perpetrators> perpetrators;

  const CaseDataMorePerpetratorsModal(
      {required this.updatePerpetrators,
      required this.perpetrators,
      super.key});

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
  String sex = pleaseSelect;
  late DateTime dob;

  @override
  Widget build(BuildContext context) {
    if (widget.perpetrators.length >= 4) {
      return Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: const [
            // Title
            FormPageHeading(
              heading: "More Perpetrators",
              hasClosePage: true,
            ),
            SizedBox(
              height: mediumSpacing,
            ),
            CustomInfoBox(
                child: Text(
                    "You have added the maximum number of perpetrators i.e 4"))
          ],
        ),
      );
    }
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
            height: smallSpacing,
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
              initialValue: sex,
              items: sexOptions,
              onChanged: (String value) {
                setState(() {
                  sex = value;
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
          CustomDatePicker(
              firstDate: DateTime(1950),
              lastDate: DateTime.now(),
              onChanged: (DateTime time) {
                setState(() {
                  dob = time;
                });
              }),
          const SizedBox(
            height: mediumSpacing,
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
                  Perpetrators perp = Perpetrators(
                    firstName: firstName,
                    lastName: lastName,
                    relationshipType: additionalRelationship == pleaseSelect
                        ? relationship
                        : additionalRelationship,
                    othernames: otherNames,
                    sex: sex,
                    dateOfBirth: dob,
                  );
                  widget.perpetrators.add(perp);
                  widget.updatePerpetrators(widget.perpetrators);
                  Navigator.pop(context);
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < widget.perpetrators.length; i++)
                CaseDataRelationshipItem(
                  data: widget.perpetrators[i],
                  index: i,
                  removeItem: (int index) {
                    widget.perpetrators.removeAt(index);
                    widget.updatePerpetrators(widget.perpetrators);
                  },
                )
            ],
          ),
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
