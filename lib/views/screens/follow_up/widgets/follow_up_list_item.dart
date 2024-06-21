import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/follow_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FollowUpListItem extends StatelessWidget {
  const FollowUpListItem({super.key, required this.caseLoad});
  final CaseLoadModel caseLoad;

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${caseLoad.ovcFirstName} ${caseLoad.ovcSurname} ${caseLoad.ovcOtherNames}",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(caseLoad.caseSerial ?? "-"),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "PID: 174675",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                caseLoad.caseStatus ?? "-",
                style: const TextStyle(fontSize: 12, color: Colors.red),
              ),
              Text(caseLoad.ovcSex ?? "-"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.remove_red_eye,
                      color: kPrimaryColor,
                      size: 18,
                    ),
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
                      Get.to(() => FollowUpScreen(caseLoadModel: caseLoad));
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
