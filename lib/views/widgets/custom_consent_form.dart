import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ConsentForm extends StatefulWidget {
  final Function(bool value) update;
  final String message;

  const ConsentForm({required this.update, required this.message, super.key});

  @override
  State<ConsentForm> createState() => _ConsentFormState();
}

class _ConsentFormState extends State<ConsentForm> {
  RadioButtonOptions? hasAgreed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: [
          const FormPageHeading(heading: "Consent Form"),
          const SizedBox(
            height: mediumSpacing,
          ),
          Text(widget.message),
          const SizedBox(
            height: mediumSpacing,
          ),
          RadioListTile<RadioButtonOptions>(
            title: const Text('Yes'),
            value: RadioButtonOptions.yes,
            groupValue: hasAgreed,
            onChanged: (value) {
              widget.update(true);
            },
          ),
          RadioListTile<RadioButtonOptions>(
            title: const Text('No'),
            value: RadioButtonOptions.no,
            groupValue: hasAgreed,
            onChanged: (value) {
              widget.update(false);
            },
          )
        ],
      ),
    );
  }
}
