import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/follow_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';

class FollowUpListItem extends StatelessWidget {
  const FollowUpListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BABY KATHAMBI",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text("CCO/47/287/5/29/3004/2018	"),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "PID: 174675",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "INACTIVE",
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
              const Text("Female"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.remove_red_eye,
                    color: kPrimaryColor,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.edit,
                    color: kPrimaryColor,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const FollowUpScreen());
                    },
                    child: const Icon(
                      Icons.barcode_reader,
                      color: kPrimaryColor,
                      size: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
