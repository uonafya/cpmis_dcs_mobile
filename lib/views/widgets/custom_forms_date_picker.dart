import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomFormsDatePicker extends StatefulWidget {
  const CustomFormsDatePicker({
    super.key,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.selectedDateTime,
    this.allowPastDates = true, // Add the flag for allowing past dates
    this.allowFutureDates = true, // Add the flag for allowing future dates
    required this.onDateSelected, // Add the callback here
  });

  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final DateTime? selectedDateTime;
  final bool allowPastDates; // Add the flag for allowing past dates
  final bool allowFutureDates; // Add the flag for allowing future dates
  final Function(DateTime selectedDate)
      onDateSelected; // Define the callback function signature

  @override
  State<CustomFormsDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomFormsDatePicker> {
  DateTime selectedDate = DateTime.now(); // Track the selected date

  @override
  void initState() {
    selectedDate = widget.selectedDateTime ?? selectedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = selectedDate;
    return GestureDetector(
      onTap: () {
        if (!widget.allowPastDates && currentDate.isBefore(DateTime.now())) {
          // If past dates are not allowed, set the firstDate to the current date
        }

        if (!widget.allowFutureDates && currentDate.isAfter(DateTime.now())) {
          // If future dates are not allowed, set the lastDate to the current date
        }

        showDatePicker(
          currentDate: selectedDate,
          context: context,
          initialDate: widget.initialDate ?? DateTime.now(),
          firstDate: widget.firstDate ?? DateTime(2012, 1, 1, 11, 59),
          lastDate: widget.lastDate ?? DateTime(2100, 12, 31, 11, 59),
        ).then((value) {
          if (value != null) {
            setState(() {
              selectedDate = value;
            });
            widget.onDateSelected(
                selectedDate); // Call the callback with selectedDate
          }
        });
      },
      child: CustomTextField(
        enabled: false,
        suffixIcon: widget.suffixIcon ?? Icons.calendar_today,
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        controller: TextEditingController(
          text: DateFormat('dd/MM/yyyy').format(selectedDate),
        ),
        onChanged: (val) {},
      ),
    );
  }
}
