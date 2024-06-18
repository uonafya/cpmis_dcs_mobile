import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:flutter/material.dart';

class CaseDataCategoryItem extends StatelessWidget {
  final CRSCategory data;
  final int index;
  final Function(int index) removeItem;

  const CaseDataCategoryItem(
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
                      "Category",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.category,
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
                      "Subcategory",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    data.subcategory != null && data.subcategory!.isNotEmpty ? 
                    Column(
                      children: [
                        for (var i = 0; i < data.subcategory!.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data.subcategory![i]),
                          )
                      ],
                    ) :
                    const Text("None"), 
                    
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
                      "Date of Event",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.dateOfEvent,
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
                      "Place of Event",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.placeOfEvent,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: smallSpacing,),
          Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Case Nature",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      data.caseNature,
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
