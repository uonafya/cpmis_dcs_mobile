import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({super.key, required this.childDetails});
  final InitialChildDetails childDetails;

  @override
  // void initState() {
  //   super.initState();,
  //   printCRSDetails();
  // }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Section 1: Personal Information',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        const Divider(),
        const Text(
          'First Name',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          childDetails.firstName,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 5),
        const Divider(),
        const Text(
          'Other Names',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          childDetails.otherNames,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 5),
        const Divider(),
        const Text(
          'Surname',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          childDetails.surname,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 5),
        const Divider(),
        const Text(
          'Nickname or given name',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const Text(
          'Not Provided',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 5),
        const Divider(),
        const Text(
          'Sex',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          childDetails.sex,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 5),
        const Divider(),
        const Text(
          'DOB',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          DateFormat("dd, MMM yyyy")
              .format((childDetails.dateOfBirth ?? DateTime.now())),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
