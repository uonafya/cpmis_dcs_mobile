import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdown extends StatefulWidget {
  /// The initial value(s) of the dropdown. This can either be a single value(String) or a list of values(List<String>)
  final dynamic initialValue;
  final String? Function(String? val)? validator;

  /// The list of items to be displayed in the dropdown
  final List<String> items;

  /// The function to be called when the dropdown value changes.This function either takes a single value(String) or a list of values(List<String>). The value(s) passed to this function is/are the selected value(s) from the dropdown. Ensure the value type is dynamic to handle both single and multiple selections
  final Function(dynamic) onChanged;

  /// A boolean value to determine if the dropdown is a multi-select dropdown or not. Default is false
  final bool isMultiSelect;

  const CustomDropdown(
      {super.key,
      required this.initialValue,
      this.validator,
      this.isMultiSelect = false,
      required this.items,
      required this.onChanged}) // Assert that if the dropdown is a multi-select dropdown, the initial value is a list of values
      : assert(isMultiSelect ? initialValue is List<String> : true,
            'Initial value must be a list of values(List<String>) if the dropdown is a multi-select dropdown(isMultiSelect = true)');

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        child: widget.isMultiSelect
            ? DropdownSearch<String>.multiSelection(
                selectedItems: widget.initialValue,
                popupProps: PopupPropsMultiSelection.menu(
                  selectionWidget: (context, item, isSelected) => Row(
                    children: [
                      Icon(
                          isSelected
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: isSelected ? kPrimaryColor : Colors.grey),
                      const SizedBox(
                        width: 14,
                      ),
                    ],
                  ),
                  showSelectedItems: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      labelStyle: const TextStyle(fontSize: 14),
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey[500]!),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  showSearchBox: widget.items.length > 5,
                  fit: FlexFit.loose,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.5),
                  itemBuilder: (context, item, isSelected) => Padding(
                    padding: const EdgeInsets.fromLTRB(14, 6, 14, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        if (widget.items.indexOf(item) !=
                            widget.items.length - 1)
                          const Divider(),
                        if (widget.items.indexOf(item) ==
                            widget.items.length - 1)
                          const SizedBox(
                            height: 10,
                          ),
                      ],
                    ),
                  ),
                ),
                items: widget.items,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(border: InputBorder.none),
                ),
                onChanged: (value) => widget.onChanged(value),
              )
            : DropdownSearch<String>(
                validator: widget.validator,
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      labelStyle: const TextStyle(fontSize: 14),
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey[500]!),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  showSearchBox: widget.items.length > 5,
                  fit: FlexFit.loose,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.5),
                  itemBuilder: (context, item, isSelected) => Padding(
                    padding: const EdgeInsets.fromLTRB(14, 6, 14, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              isSelected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color: isSelected ? kPrimaryColor : Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                item,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        if (widget.items.indexOf(item) !=
                            widget.items.length - 1)
                          const Divider(),
                        if (widget.items.indexOf(item) ==
                            widget.items.length - 1)
                          const SizedBox(
                            height: 10,
                          ),
                      ],
                    ),
                  ),
                ),
                items: widget.items,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(border: InputBorder.none),
                ),
                onChanged: (String? value) {
                  widget.onChanged(value!);
                },
                selectedItem: widget.initialValue,
              ));
  }
}
