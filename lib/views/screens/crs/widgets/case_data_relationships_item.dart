import 'package:flutter/material.dart';

class CaseDataRelationshipItem extends StatelessWidget {
  final Map<String, dynamic> data;

  const CaseDataRelationshipItem({
    required this.data,
    super.key
  });

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
                      data['relationship'],
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
                      data['firstname'],
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
                      data['surname'],
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
                      data['othernames'],
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     const Icon(
          //       Icons.edit,
          //       color: kPrimaryColor,
          //       size: 18,
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     InkWell(
          //       onTap: () {
          //         onDelete();
          //       },
          //       child: const Icon(
          //         Icons.delete,
          //         color: Colors.red,
          //         size: 18,
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
