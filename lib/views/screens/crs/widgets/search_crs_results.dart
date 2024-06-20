import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/crs_details.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SearchCrsResults extends StatelessWidget {
  const SearchCrsResults({super.key, required this.crsRecords});

  final List<CaseLoadModel> crsRecords;

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
                  Get.to(() => CRSDetails(
                        caseLoad: crsRecord,
                      ));
                },
                child: Container(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Name",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            "${crsRecord.ovcFirstName} ${crsRecord.ovcSurname} ",
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                                  "CPMIS ID",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  crsRecord.ovcCpimsId ?? "-",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Sex",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  crsRecord.ovcSex ?? "-",
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
                                  "Case Serial",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  crsRecord.caseSerial ?? "-",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 14,
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
                            "Case Category",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            crsRecord.caseCategories == null
                                ? "-"
                                : crsRecord.caseCategories!
                                    .map((e) => e.caseCategory)
                                    .join(","),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
  }
}
