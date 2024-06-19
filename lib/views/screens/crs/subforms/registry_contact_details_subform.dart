import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/registry_provider.dart';
import '../../../widgets/custom_text_field.dart';
import '../widgets/subform_wrapper.dart';

class RegistryContactDetailsSubform extends StatefulWidget {
  const RegistryContactDetailsSubform({super.key});

  @override
  State<RegistryContactDetailsSubform> createState() =>
      _RegistryContactDetailsSubformState();
}

class _RegistryContactDetailsSubformState
    extends State<RegistryContactDetailsSubform> {
  @override
  Widget build(BuildContext context) {

    RegistryProvider registryProvider = Provider.of<RegistryProvider>(context);

    return SubformWrapper(
      title: "Contact Information",
      children: [
        const SizedBox(height: 10),
        const Text(
          'Designated Mobile Number *',
        ),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: '07xxxxxxxx',
          initialValue: registryProvider.registryContactDetailsModel.designatedPhoneNumber,
          onChanged: (value) {
            registryProvider.setDesignatedPhoneNumber(value);
          },
        ),
        const SizedBox(height: 15),
        const Text(
          'Other Mobile Number',
          style: TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: '07xxxxxxxx',
          initialValue: registryProvider.registryContactDetailsModel.otherMobileNumber,
          onChanged: (value) {
            registryProvider.setOtherMobileNumber(value);
          },
        ),
        const SizedBox(height: 15),
        const Text(
          'Email Address',
          style: TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: 'Email Address',
          initialValue: registryProvider.registryContactDetailsModel.emailAddress,
          onChanged: (value) {
            registryProvider.setEmailAddress(value);
          },
        ),
        const SizedBox(height: 15),
        const Text('Physical Location', style: TextStyle(color: Colors.black)),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: '',
          maxLines: 4,
          initialValue: registryProvider.registryContactDetailsModel.physicalLocation,
          onChanged: (value) {
            registryProvider.setPhysicalAddress(value);
          },
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
