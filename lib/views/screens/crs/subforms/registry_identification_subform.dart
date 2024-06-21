import 'package:cpims_dcs_mobile/controller/registry_provider.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_text_field.dart';

class RegistryIdentificationSubform extends StatefulWidget {
  const RegistryIdentificationSubform(
      {super.key, required this.birthRegIdController});
  final TextEditingController birthRegIdController;

  @override
  State<RegistryIdentificationSubform> createState() =>
      _RegistryIdentificationSubformState();
}

class _RegistryIdentificationSubformState
    extends State<RegistryIdentificationSubform> {
  List<String> countryCriteria = [
    'Kenya',
    'Tanzania',
    'Ethopia',
  ];
  List<String> tribeCriteria = [
    'Kikuyu',
    'Kamba',
    'Kalenjin',
  ];
  List<String> religionCriteria = [
    'Christian',
    'Muslim',
    'Buddhist',
    'Atheist',
    'Other',
  ];

  String selectedCountry = 'Please Select';
  String selectedTribe = 'Please Select';
  String selectedReligion = 'Please Select';

  @override
  Widget build(BuildContext context) {

    RegistryProvider registryProvider = Provider.of<RegistryProvider>(context);

    return SubformWrapper(
      title: "Identification",
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Birth Registration Number:',
          style: TextStyle(color: kTextGrey),
        ),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: 'Birth Reg ID',
          // controller: widget.birthRegIdController,
          initialValue: registryProvider.registryIdentificationModel.birthRegistrationNumber,
          onChanged: (value) {
            registryProvider.setBirthRegistrationNumber(value);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        const Text(
          'Child Given Name',
          style: TextStyle(color: kTextGrey),
        ),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: 'Given Name',
          initialValue: registryProvider.registryIdentificationModel.givenName,
          onChanged: (value) {
            registryProvider.setGivenName(value);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        const Text('Country of Origin'),
        const SizedBox(height: 6),
        CustomDropdown(
          initialValue: registryProvider.registryIdentificationModel.countryOfOrigin.isNotEmpty ? registryProvider.registryIdentificationModel.countryOfOrigin : selectedCountry,
          items: countryCriteria,
          onChanged: (val) {
            setState(() {
              selectedCountry = val;
              registryProvider.setCountryOfOrigin(selectedCountry);
              if (val != "Kenya") {
                selectedTribe = "Please Select";
                registryProvider.setTribe("");
              }
            });
          },
        ),
        selectedCountry == "Kenya"
        ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              const Text('Tribe:'),
              const SizedBox(height: 6),
              CustomDropdown(
                initialValue: registryProvider.registryIdentificationModel.tribe.isNotEmpty ? registryProvider.registryIdentificationModel.tribe : selectedTribe,
                items: tribeCriteria,
                onChanged: (val) {
                  setState(() {
                    selectedTribe = val;
                    registryProvider.setTribe(selectedTribe);
                  });
                },
              ),
            ],
          )
        :
          Container(),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        const Text('Religion:'),
        const SizedBox(height: 6),
        CustomDropdown(
          initialValue: registryProvider.registryIdentificationModel.religion.isNotEmpty ? registryProvider.registryIdentificationModel.religion : selectedReligion,
          items: religionCriteria,
          onChanged: (val) {
            setState(() {
              selectedReligion = val;
              registryProvider.setReligion(selectedReligion);
            });
          },
        ),
      ],
    );
  }
}
