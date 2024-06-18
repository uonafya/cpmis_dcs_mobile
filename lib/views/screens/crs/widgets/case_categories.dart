import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/case_data_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CaseCategoriesWidget extends StatefulWidget {
  final Function(CRSCategory item) addCategory;

  const CaseCategoriesWidget({required this.addCategory, super.key});

  @override
  State<CaseCategoriesWidget> createState() => _CaseCategoriesWidgetState();
}

class _CaseCategoriesWidgetState extends State<CaseCategoriesWidget> {
  String caseCategory = pleaseSelect;
  String caseSubcategory = pleaseSelect;
  late DateTime dateOfEvent;
  String placeOfEvent = pleaseSelect;
  String caseNature = pleaseSelect;
  List<String> subCategories = [];

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
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Case category(s)",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(
                height: smallSpacing,
              ),
              CustomDropdown(
                  initialValue: caseCategory,
                  items: caseCategoryOptions,
                  onChanged: (String value) {
                    setState(() {
                      caseCategory = value;
                    });
                  })
            ],
          ),
          const SizedBox(
            height: smallSpacing,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Case subCategory(s)",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              CustomDropdown(
                  initialValue: caseCategory,
                  items: caseCategoryOptions,
                  onChanged: (String value) {
                    setState(() {
                      caseCategory = value;
                    });
                  })
            ],
          ),
          const SizedBox(
            height: smallSpacing,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Date of Event",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              CustomDatePicker(onChanged: (DateTime value) {
                setState(() {
                  dateOfEvent = value;
                });
              })
            ],
          ),
          const SizedBox(
            height: smallSpacing,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Place of Event",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              CustomDropdown(
                initialValue: placeOfEvent,
                items: ['Local'],
                onChanged: (String item) {
                  setState(() {
                    placeOfEvent = item;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: smallSpacing,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Case Nature",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              CustomDropdown(
                initialValue: caseNature,
                items: ["Ongoing event"],
                onChanged: (String item) {
                  setState(() {
                    caseNature = item;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: smallSpacing,
          ),
          const Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomButton(
              text: "Add",
              onTap: () {
                var category = CRSCategory(
                  category: caseCategory,
                  dateOfEvent: caseSubcategory,
                  placeOfEvent: placeOfEvent,
                  caseNature: caseNature,
                );
                widget.addCategory(category);
              },
            ),
          )
        ],
      ),
    );
  }
}
