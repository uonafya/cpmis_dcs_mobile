import 'package:cpims_dcs_mobile/core/constants/convert_date_to_YMD.dart';
import 'package:cpims_dcs_mobile/core/constants/get_age_from_dob.dart';
import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:flutter/material.dart';

class AboutChildSiblingItem extends StatelessWidget {
  final SiblingDetails data;

  const AboutChildSiblingItem({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[300]!),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.firstName,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: mediumSpacing,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sex",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.sex,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Date of Birth",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      convertDateToYMD(data.dateOfBirth),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: mediumSpacing,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "AGE",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      getAgeFromDateOf(data.dateOfBirth ?? DateTime.now())
                          .toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(
            height: smallSpacing,
          ),
        ],
      ),
    );
  }
}
