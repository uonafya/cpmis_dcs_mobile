import 'package:cpims_dcs_mobile/core/constants/constants.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.labelText,
    this.prefixIcon,
    this.textInputAction,
    this.suffixIcon,
    this.initialValue,
    this.controller,
    this.validator,
    this.enabled,
    this.readOnly = false,
    this.maxLines = 1,
    this.hintText,
    this.error,
    this.onFieldSubmitted,
  });

  final String? labelText;
  final String? hintText;
  final Function(String val)? onChanged;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputAction? textInputAction;
  final String? Function(String? val)? validator;
  final bool? enabled;
  final bool readOnly;
  final String? initialValue;
  final TextEditingController? controller;
  final int maxLines;
  final String? error;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (val) {
        if (onChanged != null) {
          onChanged!(val);
        }
      },
      onFieldSubmitted: (value) {
        onFieldSubmitted?.call(value);
      },
      validator: validator,
      controller: controller,
      enabled: enabled,
      initialValue: initialValue,
      cursorColor: kPrimaryColor,
      textInputAction: textInputAction,
      textAlignVertical: TextAlignVertical.center,
      maxLines: maxLines,
      decoration: InputDecoration(
        errorText: error,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 14),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: kTextGrey),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        errorStyle: const TextStyle(color: Colors.redAccent),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: 20,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                size: 20,
              )
            : null,
      ),
      readOnly: readOnly,
    );
  }
}
