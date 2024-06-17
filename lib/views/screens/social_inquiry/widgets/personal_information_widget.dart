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
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Divider(),
        Text(
          'First Name',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          'JOHN',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 5),
        Divider(),
        Text(
          'Other Names',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          'Not Provided',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 5),
        Divider(),
        Text(
          'Surname',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          'MUMBA',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5),
        Divider(),
        Text(
          'Nickname or given name',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          'Not Provided',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5),
        Divider(),
        Text(
          'Sex',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          'Male',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5),
        Divider(),
        Text(
          'DOB',
          style: TextStyle(fontSize: 12, color: Colors.grey),
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
