import 'package:flutter/material.dart';

import '../../../widgets/custom_card_grid_item.dart';
import '../../../widgets/custom_grid_view.dart';

class SelectedRegistrySiblingCard extends StatefulWidget {
  const SelectedRegistrySiblingCard({super.key});

  @override
  State<SelectedRegistrySiblingCard> createState() => _SelectedRegistrySiblingCardState();
}

class _SelectedRegistrySiblingCardState extends State<SelectedRegistrySiblingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey[300]!,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "BABY KATHAMBI",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "ID: 9886",
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Male"),
                    Text("02-02-2004"),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {

                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
