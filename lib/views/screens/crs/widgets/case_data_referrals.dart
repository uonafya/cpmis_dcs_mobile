import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/case_data_page_options.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CaseDataReferrals extends StatelessWidget {
  final String referralActors;
  final Function(dynamic) updateReferralActors;
  final String specify;
  final Function(dynamic) updateSpecify;
  final String reason;
  final Function(dynamic) updateReason;
  final Function(CRSReferral item) addReferral;

  const CaseDataReferrals(
      {required this.updateReferralActors,
      required this.referralActors,
      required this.specify,
      required this.updateSpecify,
      required this.reason,
      required this.addReferral,
      required this.updateReason,
      super.key});

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
                "Refferal Actor",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              CustomDropdown(
                  initialValue: referralActors,
                  items: referralActorOptions,
                  onChanged: updateReferralActors)
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
                "Specify",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              CustomDropdown(
                  initialValue: specify,
                  items: specifyOptions,
                  onChanged: updateSpecify)
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
                "Reason",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              CustomDropdown(
                  initialValue: reason,
                  items: reasonOptions,
                  onChanged: updateReason)
            ],
          ),
          const SizedBox(
            height: smallSpacing,
          ),
          CustomButton(
            onTap: () {
              CRSReferral referral = CRSReferral(
                  actor: referralActors, reason: reason, specify: specify);
              addReferral(referral);
            },
            text: "Add",
          ),
          const SizedBox(
            height: mediumSpacing,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
