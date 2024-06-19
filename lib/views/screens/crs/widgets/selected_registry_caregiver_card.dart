import 'package:flutter/material.dart';


class SelectedRegistryCaregiverCard extends StatefulWidget {
  const SelectedRegistryCaregiverCard({super.key});

  @override
  State<SelectedRegistryCaregiverCard> createState() => _SelectedRegistryCaregiverCardState();
}

class _SelectedRegistryCaregiverCardState extends State<SelectedRegistryCaregiverCard> {

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
                    Text("Other Relative"),
                    Text("Adult: Yes"),
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
