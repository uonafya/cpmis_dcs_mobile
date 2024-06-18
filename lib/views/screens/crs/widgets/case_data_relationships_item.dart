import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:flutter/material.dart';

class CaseDataRelationshipItem extends StatelessWidget {
  final Perpetrators data;
  final int index;
  final Function(int index) removeItem;

  const CaseDataRelationshipItem(
      {required this.index,
      required this.removeItem,
      required this.data,
      super.key});

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
                      "Relationship",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.relationshipType ?? "",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "First Name",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.firstName,
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
                      "Surname",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.lastName,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Other Names",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.othernames ?? "",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: smallSpacing,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                removeItem(index);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
