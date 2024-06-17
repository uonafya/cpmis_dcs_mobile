import 'package:cpims_dcs_mobile/views/screens/crs/constants/case_data_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown_multiselect.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class CaseCategoriesWidget extends StatefulWidget {
  const CaseCategoriesWidget({super.key});

  @override
  State<CaseCategoriesWidget> createState() => _CaseCategoriesWidgetState();
}

class _CaseCategoriesWidgetState extends State<CaseCategoriesWidget> {
  String caseCategory = pleaseSelect;
  String caseSubcategory = pleaseSelect;
  late DateTime dateOfEvent;
  List<String> placeOfEvent = [];
  List<String> caseNature = [];
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
              CustomDropDownMultiSelect(
                  options: placeOfEventOptions,
                  onOptionSelected: (List<String> value) {
                    setState(() {
                      placeOfEvent = value;
                    });
                  },
                  selectionType: SelectionType.multi,
                  hint: "Please Select")
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
              CustomDropDownMultiSelect(
                  options: caseNatureOptions,
                  onOptionSelected: (List<String> value) {
                    setState(() {
                      caseNature = value;
                    });
                  },
                  selectionType: SelectionType.multi,
                  hint: "Please Select")
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
                debugPrint("Add");
              },
            ),
          )
        ],
      ),
    );
  }
}
