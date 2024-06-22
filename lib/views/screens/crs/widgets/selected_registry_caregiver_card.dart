import 'package:cpims_dcs_mobile/models/registry/registry_caregiver_model.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/registry_provider.dart';

class SelectedRegistryCaregiverCard extends StatefulWidget {
  const SelectedRegistryCaregiverCard({super.key, required this.caregiver});
  final RegistryCaregiverModel caregiver;

  @override
  State<SelectedRegistryCaregiverCard> createState() =>
      _SelectedRegistryCaregiverCardState();
}

class _SelectedRegistryCaregiverCardState
    extends State<SelectedRegistryCaregiverCard> {
  @override
  Widget build(BuildContext context) {
    RegistryProvider registryProvider = Provider.of<RegistryProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey[300]!,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ("${widget.caregiver.firstName} ${widget.caregiver.surName}")
                          .toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(widget.caregiver.relationshipToChild),),

                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    CustomButton(
                      text: "REMOVE",
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      height: 35,
                      onTap: () {
                        registryProvider.removeCaregiver(widget.caregiver);
                      },
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
