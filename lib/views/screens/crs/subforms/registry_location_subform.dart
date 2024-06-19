import 'package:flutter/material.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:provider/provider.dart';

import '../../../../controller/registry_provider.dart';




class RegistryLocationSubform extends StatefulWidget {
  const RegistryLocationSubform({super.key});

  @override
  State<RegistryLocationSubform> createState() => _RegistryLocationSubformState();
}

class _RegistryLocationSubformState extends State<RegistryLocationSubform> {
  List<String> countyCriteria = [
    'Please Select',
    'HomaBay',
    'Migori',
  ];
  List<String> subcountyCriteria = [
    'Please Select',
    'Suba',
    'Suna West',
    'Ndhiwa',
  ];
  List<String> wardCriteria = [
    'Please Select',
    'Wasibete',
    'Wiga',
    'Wasweta li',
  ];
  String selectedCounty = 'Please Select';
  String selectedSubCounty = 'Please Select';
  String selectedWard = 'Please Select';

  @override
  Widget build(BuildContext context) {

    RegistryProvider registryProvider = Provider.of<RegistryProvider>(context);

    return SubformWrapper(
        title: "Location",
        children: [
          const SizedBox(height: 10),
          const Text(
            'Living in',
            style: TextStyle(color: kTextGrey),
          ),
          const SizedBox(height: 15,),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'County: ',
                style: TextStyle(color: kTextGrey),
              ),
              CustomDropdown(
                initialValue: registryProvider.registryLocationModel.county.isNotEmpty ? registryProvider.registryLocationModel.county : selectedCounty,
                items: countyCriteria,
                onChanged: (val) {
                  setState(() {
                    selectedCounty = val;
                    registryProvider.setCounty(selectedCounty);
                  });
                },
              ),
            ],
          ),
            const SizedBox(height: 15,),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sub-County: ',
                  style: TextStyle(color: kTextGrey),
                ),
                CustomDropdown(
                  initialValue: registryProvider.registryLocationModel.subCounty.isNotEmpty ? registryProvider.registryLocationModel.subCounty : selectedSubCounty,
                  items: subcountyCriteria,
                  onChanged: (val) {
                    setState(() {
                      selectedSubCounty = val;
                      registryProvider.setSubCounty(selectedSubCounty);
                    });
                  },
                ),
                const SizedBox(height: 15,),
                const Divider(),
                const Text(
                  'Ward: ',
                  style: TextStyle(color: kTextGrey),
                ),
                CustomDropdown(
                  initialValue: registryProvider.registryLocationModel.ward.isNotEmpty ? registryProvider.registryLocationModel.ward : selectedWard,
                  items: wardCriteria,
                  onChanged: (val) {
                    setState(() {
                      selectedWard = val;
                      registryProvider.setWard(selectedWard);
                    });
                  },
                ),
              ],
            ),
        ]);
  }
}
