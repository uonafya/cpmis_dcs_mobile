import 'package:cpims_dcs_mobile/views/screens/crs/crs_details.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_card_grid_item.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SearchCrsResults extends StatelessWidget {
  const SearchCrsResults({super.key, required this.crsRecords});

  final List<Map<String, dynamic>> crsRecords;

  @override
  Widget build(BuildContext context) {
    return crsRecords.isEmpty
        ? const Center(
            child: Text("No records found"),
          )
        : ListView.builder(
            itemCount: crsRecords.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final crsRecord = crsRecords[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => const CRSDetails());
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1))
                      ]),
                  child: CustomGridView(
                    crossAxisCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      CustomCardGridItem(
                        header: "CPIMS ID",
                        details: crsRecord["id"].toString(),
                      ),
                      CustomCardGridItem(
                          header: "First Name",
                          details: crsRecord["first_name"]),
                      CustomCardGridItem(
                          header: "surname", details: crsRecord["surname"]),
                      CustomCardGridItem(
                          header: "sex", details: crsRecord["sex"]),
                      CustomCardGridItem(
                          header: "org_unit", details: crsRecord["org_unit"]),
                      CustomCardGridItem(
                          header: "residence", details: crsRecord["residence"]),
                      CustomCardGridItem(
                          header: "previous_cases",
                          details: crsRecord["previous_cases"].toString())
                    ],
                  ),
                ),
              );
            });
  }
}
