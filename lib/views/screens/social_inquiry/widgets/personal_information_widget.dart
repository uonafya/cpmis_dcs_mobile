import 'package:flutter/material.dart';

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Section 1: Personal Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 10),
        Divider(),
        Text(
          'First Name',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        Text(
          'JOHN',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5),
        Text(
          'Other Names',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          'Not Provided',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5),
        Text(
          'Surname',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          'MUMBA',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5),
        Text(
          'Nickname or given name',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          'Not Provided',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5),
        Text(
          'Sex',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          'Male',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5),
        Text(
          'DOB',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          'June 19, 2002',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
