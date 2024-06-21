import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class CustomDropDownMultiSelect extends StatefulWidget {
  final List<ValueItem<String>> options;
  final Function(List<String>) onOptionSelected;
  final SelectionType selectionType;
  final String hint;

  const CustomDropDownMultiSelect({
    Key? key,
    required this.options,
    required this.onOptionSelected,
    required this.selectionType,
    required this.hint,
  }) : super(key: key);

  @override
  State<CustomDropDownMultiSelect> createState() =>
      _CustomDropDownMultiSelectState();
}

class _CustomDropDownMultiSelectState extends State<CustomDropDownMultiSelect> {
  List<ValueItem<String>> selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown<String>(
      hint: widget.hint,
      onOptionSelected: (List<ValueItem<String>> selectedItems) {
        setState(() {
          selectedValues = selectedItems;
        });
        // Convert ValueItem<String> to String before passing to the parent
        // Filter out any null values and convert to non-nullable List<String>
        List<String> nonNullableList = selectedItems
            .map((item) => item.value)
            .where((value) => value != null)
            .cast<String>()
            .toList();
        widget.onOptionSelected(nonNullableList);
      },
      options: widget.options,
      maxItems: 35,
      selectionType: widget.selectionType,
      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
      dropdownHeight: 300,
      optionTextStyle: const TextStyle(fontSize: 16),
      selectedOptionIcon: const Icon(Icons.check_circle),
      borderRadius: BorderRadius.circular(5).topLeft.x,
    );
  }
}
