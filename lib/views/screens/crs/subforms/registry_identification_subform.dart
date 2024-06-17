import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_text_field.dart';

class RegistryIdentificationSubform extends StatefulWidget {
  const RegistryIdentificationSubform({super.key});

  @override
  State<RegistryIdentificationSubform> createState() => _RegistryIdentificationSubformState();
}

class _RegistryIdentificationSubformState extends State<RegistryIdentificationSubform> {
  List<String> countryCriteria = [
    'Please Select',
    'Kenya',
    'Tanzania',
    'Ethopia',
  ];
  List<String> tribeCriteria = [
    'Please Select',
    'Kikuyu',
    'Kamba',
    'Kalenjin',
  ];
  List<String> religionCriteria = [
    'Please Select',
    'Christian',
    'Muslim',
    'Buddhist',
    'Atheist',
    'Other',
  ];

  String selectedCountry = 'Kenya';
  String selectedTribe = 'Please Select';
  String selectedReligion = 'Please Select';

  @override
  Widget build(BuildContext context) {
    return SubformWrapper(
        title: "Identification",
        children: [
          const SizedBox(height: 10,),
          const Text(
              'Birth Registration Number:',
            style: TextStyle(color: kTextGrey),
          ),
          const CustomTextField(hintText: 'Birth Reg ID'),
          const SizedBox(height: 15,),
          const Divider(),
          const Text(
              'Child Given Name',
            style: TextStyle(color: kTextGrey),
          ),
          const CustomTextField(hintText: 'Given Name',),
          const SizedBox(height: 15,),
          const Divider(),
          const Text('Country of Origin'),
          CustomDropdown(
              initialValue: selectedCountry,
              items: countryCriteria,
              onChanged: (val){
                setState(() {
                  selectedCountry = val;
                });
              },
          ),
          const SizedBox(height: 15,),
          const Divider(),
          const Text('Tribe:'),
          CustomDropdown(
            initialValue: selectedTribe,
            items: tribeCriteria,
            onChanged: (val){
              setState(() {
                selectedTribe = val;
              });
            },
          ),
          const SizedBox(height: 15,),
          const Divider(),
          const Text('Tribe:'),
          CustomDropdown(
            initialValue: selectedReligion,
            items: religionCriteria,
            onChanged: (val){
              setState(() {
                selectedReligion = val;
              });
            },
          ),
        ],
    );
  }
}
