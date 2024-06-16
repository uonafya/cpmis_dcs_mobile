import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CaseEventItem extends StatelessWidget {
  const CaseEventItem({super.key});

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
          const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Type",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      "CLOSURE",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Case Category",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      "ALL CASES",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Details",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      "First Summon",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date Of Event",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      "11-Oct-2018",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.edit,
                color: kPrimaryColor,
                size: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
