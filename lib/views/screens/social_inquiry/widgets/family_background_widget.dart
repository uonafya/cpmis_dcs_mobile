import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/crs_details.dart';

class FamilyBackgroundWidget extends StatelessWidget {
  const FamilyBackgroundWidget({super.key, required this.caseLoadModel});
  final CaseLoadModel caseLoadModel;

  // @override
  // void initState() {
  //   super.initState();,
  //   printCRSDetails();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Section 2: Family Background',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 10),
        const Divider(),
        const Text(
          'Case Record Sheet',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text('${caseLoadModel.caseSerial} - ${caseLoadModel.dateCaseOpened}'),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Get.to(() => CRSDetails(caseLoad: caseLoadModel));
          },
          child: Text(
            '1. View case (${caseLoadModel.caseSerial} - ${caseLoadModel.dateCaseOpened})',
            style: const TextStyle(
              fontSize: 11,
              color: Color.fromARGB(255, 27, 107, 173),
              decoration: TextDecoration
                  .underline, // Optional: to make it look like a hyperlink
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const Text(
          'Parents / Caregiver Particulars',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Divider(),
        const Text(
          "Parent (Father)'s Names",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const Text(
          "-",
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 5),
        const Divider(),
        const Text(
          "Parent (Mother)'s Names",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const Text(
          '',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 5),
        const Divider(),
        const SizedBox(height: 20),
        const Text(
          'Home Particulars',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ward',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const SizedBox(height: 5),
        const Divider(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub-county',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
