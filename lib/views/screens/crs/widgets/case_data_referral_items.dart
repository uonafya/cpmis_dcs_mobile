import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:flutter/material.dart';

class CaseDataRefferalItem extends StatelessWidget {
  final CRSReferral data;
  final int index;
  final Function(int index) removeItem;

  const CaseDataRefferalItem(
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
                      "Actor",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.specify,
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
                      "Specify",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.specify,
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
          Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Reason",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.reason,
                      style: const TextStyle(fontSize: 12),
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
              icon: const Icon(
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
