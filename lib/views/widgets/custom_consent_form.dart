import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/form_page_heading.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ConsentForm extends StatelessWidget {
  final Function(bool value) update;
  final String message;

  const ConsentForm({
    required this.update,
    required this.message,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        children: [
          const FormPageHeading(heading: "Consent Form"),
          const SizedBox(height: mediumSpacing,),
          Text(message),
          const SizedBox(height: mediumSpacing,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                onTap: () {
                  update(true);
                },
                text: "Yes",
                color: Colors.greenAccent,
              ),
              CustomButton(
                onTap: () {
                  update(false);
                },
                text: "No",
                color: Colors.redAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
