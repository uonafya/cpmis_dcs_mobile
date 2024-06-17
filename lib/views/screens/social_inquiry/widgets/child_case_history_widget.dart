import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChildCaseHistoryWidget extends StatelessWidget {
  const ChildCaseHistoryWidget({
    super.key,
    required this.caseHistoryController,
    required this.caseObservationController,
    required this.caseRecommendationController,
    required this.caseSubCountyController,
    required this.nameOfOfficerController,
    required this.officerTelephoneController,
    required dateOfSocialInquiry,
  });

  final TextEditingController caseHistoryController;
  final TextEditingController caseObservationController;
  final TextEditingController caseRecommendationController;
  final TextEditingController caseSubCountyController;
  final TextEditingController nameOfOfficerController;
  final TextEditingController officerTelephoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Section 3: Case History of the Child',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Case History *',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          maxLines: 5,
          controller: caseHistoryController,
          validator: (val) {
            if (val!.isEmpty) {
              return 'Please provide case history';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Case Observation *',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          maxLines: 5,
          controller: caseObservationController,
          validator: (val) {
            if (val!.isEmpty) {
              return 'Please provide case observation';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Case Recommendation *',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          maxLines: 5,
          controller: caseRecommendationController,
          validator: (val) {
            if (val!.isEmpty) {
              return 'Please provide a recommendation';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Case Sub-County Children Office *',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: caseSubCountyController,
          validator: (val) {
            if (val!.isEmpty) {
              return 'Please provide case sub-county children office';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Name of Officer *',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: nameOfOfficerController,
          validator: (val) {
            if (val!.isEmpty) {
              return 'Please provide name of officer';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Officer Telephone Number *',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: officerTelephoneController,
          validator: (val) {
            if (val!.isEmpty) {
              return 'Please provide officer telephone number';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
