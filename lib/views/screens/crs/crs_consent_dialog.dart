import 'package:cpims_dcs_mobile/views/screens/esr/esr_form.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/home_page.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CRSConcentDialog extends StatefulWidget {
  final Function(bool) changeConsent;

  const CRSConcentDialog({required this.changeConsent, super.key});

  @override
  State<CRSConcentDialog> createState() => _CRSConcentDialogState();
}

class _CRSConcentDialogState extends State<CRSConcentDialog> {
  bool? isConsent;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          const Text(
            "CONSENT TO REGISTER HOUSEHOLD",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text("Was Consent/Assent provided?"),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text("Yes"),
              Radio(
                  value: true,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => Colors.green.shade900),
                  groupValue: isConsent,
                  onChanged: (val) {
                    setState(() {
                      isConsent = val;
                    });
                  }),
              const Text("No"),
              Radio(
                  value: false,
                  groupValue: isConsent,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => Colors.green.shade900),
                  onChanged: (val) {
                    setState(() {
                      isConsent = val;
                    });
                  }),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          CustomButton(
            text: "Submit",
            isDisabled: isConsent == null,
            onTap: () {
              widget.changeConsent(isConsent ?? false);
            },
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "This form is to be filled out whenever a child protection issue is brought before a child protection office, institution, or facility. Where public authority, legal obligation as lawful basis for obtaining, processing and sharing data in the best interest of the child do not apply, Consent/ Assent is required",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12,
                color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
