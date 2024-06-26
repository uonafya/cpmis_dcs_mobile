import 'package:cpims_dcs_mobile/models/registry/registry_sibling_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/registry_provider.dart';
import '../../../widgets/custom_button.dart';

class SelectedRegistrySiblingCard extends StatefulWidget {
  const SelectedRegistrySiblingCard({super.key, required this.sibling});
  final RegistrySiblingModel sibling;
  @override
  State<SelectedRegistrySiblingCard> createState() =>
      _SelectedRegistrySiblingCardState();
}

class _SelectedRegistrySiblingCardState
    extends State<SelectedRegistrySiblingCard> {
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
                      ("${widget.sibling.firstName} ${widget.sibling.surName}")
                          .toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "ID: XXXXXX",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.sibling.sex),
                    Text(widget.sibling.dateOfBirth?.toString() ?? "Uknown"),
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
                        registryProvider.removeSibling(widget.sibling);
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
