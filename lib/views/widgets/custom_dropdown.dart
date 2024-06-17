import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdown extends StatefulWidget {
  final String initialValue;
  final List<String> items;
  final Function(String) onChanged;

  const CustomDropdown(
      {super.key,
      required this.initialValue,
      required this.items,
      required this.onChanged});

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
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
                  if (widget.items.indexOf(item) != widget.items.length - 1)
                    const Divider(),
                  if (widget.items.indexOf(item) == widget.items.length - 1)
                    const SizedBox(
                      height: 10,
                    ),
                ],
              ),
            ),
          ),
          items: widget.items,
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(border: InputBorder.none),
          ),
          onChanged: (String? value) {
            widget.onChanged(value!);
          },
          selectedItem: widget.initialValue,
        ));
  }
}
