import 'package:cpims_dcs_mobile/views/screens/crs/widgets/modals/person_registry_attach_caregiver.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/modals/person_registry_attach_child.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/selected_registry_caregiver_card.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../widgets/selected_registry_sibling_card.dart';
import '../widgets/subform_wrapper.dart';

class RegistryCaregiverSiblingSubform extends StatefulWidget {
  const RegistryCaregiverSiblingSubform({super.key});

  @override
  State<RegistryCaregiverSiblingSubform> createState() =>
      _RegistryCaregiverSiblingSubformState();
}

class _RegistryCaregiverSiblingSubformState
    extends State<RegistryCaregiverSiblingSubform> {
  List<int> list = [1, 2];

  @override
  Widget build(BuildContext context) {
    return SubformWrapper(
      title: "Child caregiver and sibling details",
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Caregiver"),
            CustomButton(
              text: "Attach caregiver",
              onTap: () {
                Get.to(() => const PersonRegistryAttachCareGiver());
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        list.isEmpty
            ? const Center(
                child: Text("No caregiver attached"),
              )
            : ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const SelectedRegistryCaregiverCard();
                },
              ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Siblings"),
            CustomButton(
              text: "Attach sibling",
              onTap: () {
                Get.to(() => const PersonRegistryAttachSiblingModal());
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        list.isEmpty
            ? const Center(
                child: Text("No sibling attached"),
              )
            : ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const SelectedRegistrySiblingCard();
                },
              ),
      ],
    );
  }
}
