import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/registry_provider.dart';
import '../../../widgets/custom_text_field.dart';
import '../widgets/subform_wrapper.dart';

const String DESIGNATED_PHONE_NUMBER_INPUT_ERROR = "Please enter a valid phone number.";

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

    String? designatedPhoneNumberError = DESIGNATED_PHONE_NUMBER_INPUT_ERROR;

    return SubformWrapper(
      title: "Contact Information",
      shouldAlwaysAutoValidate: registryProvider.shouldValidateFields,
      children: [
        const SizedBox(height: 10),
        const Text(
          'Designated Mobile Number *',
        ),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: '07xxxxxxxx',
          error: designatedPhoneNumberError,
          initialValue: registryProvider.registryContactDetailsModel.designatedPhoneNumber,
          onChanged: (value) {
            const pattern = r'^(01|07)\d{8}$';
            final regExp = RegExp(pattern);
            if (value.isEmpty || !regExp.hasMatch(value) ) {
              designatedPhoneNumberError = DESIGNATED_PHONE_NUMBER_INPUT_ERROR;
            } else {
              designatedPhoneNumberError = null;
            }
            registryProvider.setDesignatedPhoneNumber(value);
          },
          validator: (val) {
            if (val!.isEmpty) {
              return "Please enter required details.";
            }
            return null;
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
