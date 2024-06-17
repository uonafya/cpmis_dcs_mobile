import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:flutter/material.dart';

class RegistryIdentificationSubform extends StatefulWidget {
  const RegistryIdentificationSubform({super.key});

  @override
  State<RegistryIdentificationSubform> createState() => _RegistryIdentificationSubformState();
}

class _RegistryIdentificationSubformState extends State<RegistryIdentificationSubform> {
  @override
  Widget build(BuildContext context) {
    return const SubformWrapper(
        title: "Identification",
        children: [],
    );
  }
}
