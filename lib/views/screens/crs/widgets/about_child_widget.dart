import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown_multiselect.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_selected_item_pill.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/enum/app_enums.dart';

class AboutChildWidget extends StatefulWidget {
  const AboutChildWidget({super.key});

  @override
  State<AboutChildWidget> createState() => _AboutChildWidgetState();
}

class _AboutChildWidgetState extends State<AboutChildWidget> {
  String houseEconomicStatus = pleaseSelect;
  List<String> familyStatus = [];

  List<String> closeFriends = [];
  List<String> hobbies = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'About the child',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          'Initial Details:',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: "NAME: ",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: kTextGrey,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Wakili Mkuu".toUpperCase(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: const TextSpan(
            text: "SEX: ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: kTextGrey,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Male",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: const TextSpan(
            text: "DOB: ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: kTextGrey,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "None",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: const TextSpan(
            text: "AGE(YEARS): ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: kTextGrey,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Under 1 year",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          'Siblings Details:',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        // Siblings list
        // no siblings found
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: kTextGrey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Text('No siblings found'),
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        // house hold economic status
        const Text(
          'Household Economic Status:',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        CustomDropdown(
          initialValue: houseEconomicStatus,
          items: houseEconomicStatusOptions,
          onChanged: (String item) {
            setState(() {
              houseEconomicStatus = item;
            });
          },
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          'Family Status:*',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        CustomDropDownMultiSelect(
          options: familyStatusOptions,
          onOptionSelected: (List<String> value) {
            familyStatus.addAll(value);
          },
          selectionType: SelectionType.multi,
          hint: pleaseSelect,
        ),
        const SizedBox(height: 20),
        const Text(
          'Close Friends:',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hintText: 'Type names + ENTER',
          onFieldSubmitted: (String value) {
            setState(() {
              closeFriends.add(value);
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: closeFriends
                .map(
                  (String friend) => CustomSelectedItemPill(
                    text: friend,
                    onTap: () {
                      setState(() {
                        closeFriends.remove(friend);
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Hobbies:',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hintText: 'Type hobby + ENTER',
          onFieldSubmitted: (String value) {
            setState(() {
              hobbies.add(value);
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: hobbies
                .map(
                  (String hobby) => CustomSelectedItemPill(
                    text: hobby,
                    onTap: () {
                      setState(() {
                        hobbies.remove(hobby);
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
