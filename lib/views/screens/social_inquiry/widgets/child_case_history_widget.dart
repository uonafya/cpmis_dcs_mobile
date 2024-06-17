import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChildCaseHistoryWidget extends StatelessWidget {
  const ChildCaseHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Section 3: Case History of the Child',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        Divider(),
        SizedBox(
          height: 10,
        ),
        Text(
          'Case History',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          maxLines: 5,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Case Observation',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          maxLines: 5,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Case Recommendation',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          maxLines: 5,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Case Sub-County Children Office',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(),
        SizedBox(
          height: 20,
        ),
        Text(
          'Name of Officer',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(),
        SizedBox(
          height: 20,
        ),
        Text(
          'Officer Telephone Number',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
