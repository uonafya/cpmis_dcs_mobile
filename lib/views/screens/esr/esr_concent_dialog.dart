import 'package:cpims_dcs_mobile/views/screens/esr/esr_form.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/home_page.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ESRConcentDialog extends StatefulWidget {
  const ESRConcentDialog({super.key});

  @override
  State<ESRConcentDialog> createState() => _ESRConcentDialogState();
}

class _ESRConcentDialogState extends State<ESRConcentDialog> {
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
          const Text(
              "Does the household Head Agree to have this household registered?"),
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
                      isConsent = val!;
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
                      isConsent = val!;
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
              if (isConsent == true) {
                // navigate to the form
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Get.to(() => const ESRForm());
              } else {
                // show dialog to confirm
                Get.offAll(() => const Homepage());
              }
            },
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "If you decline to having the household registered, you are prompted to confirm this action. If you confirm, the household will now be ineligible for registration. If you consent to having the household registered, click on the “FILL REGISTRATION FORM” button and capture the dwelling and household data. Once this is captured, click on the “SAVE HOUSEHOLD DETAILS”.",
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
