import 'package:flutter/material.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:provider/provider.dart';

import '../../../../controller/registry_provider.dart';

const String COUNTY_DROPDOWN_ERROR = "Please select a county.";
const String SUBCOUNTY_DROPDOWN_ERROR = "Please select sub-county.";
const String WARD_DROPDOWN_ERROR = "Please select a ward.";

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
  String? countyError = COUNTY_DROPDOWN_ERROR;
  String? subCountyError = SUBCOUNTY_DROPDOWN_ERROR;
  String? wardError = WARD_DROPDOWN_ERROR;

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
                'County *',
                style: TextStyle(color: kTextGrey),
              ),
              CustomDropdown(
                initialValue: registryProvider.registryLocationModel.county.isNotEmpty ? registryProvider.registryLocationModel.county : selectedCounty,
                items: countyCriteria,
                error: countyError,
                onChanged: (val) {
                  setState(() {
                    selectedCounty = val;
                    registryProvider.setCounty(selectedCounty);
                    selectedSubCounty = "";
                    selectedWard = "";
                    registryProvider.setSubCounty("");
                    registryProvider.setWard("");
                    if (val.isEmpty) {
                      countyError = COUNTY_DROPDOWN_ERROR;
                      subCountyError = SUBCOUNTY_DROPDOWN_ERROR;
                      wardError = WARD_DROPDOWN_ERROR;
                    } else {
                      countyError = null;
                    }
                    
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
                  'Sub-County *',
                  style: TextStyle(color: kTextGrey),
                ),
                CustomDropdown(
                  initialValue: registryProvider.registryLocationModel.subCounty.isNotEmpty ? registryProvider.registryLocationModel.subCounty : selectedSubCounty,
                  items: subcountyCriteria,
                  error: subCountyError,
                  onChanged: (val) {
                    setState(() {
                      selectedSubCounty = val;
                      registryProvider.setSubCounty(selectedSubCounty);
                      selectedWard = "";
                      registryProvider.setWard("");
                      if (val.isEmpty) {
                        subCountyError = SUBCOUNTY_DROPDOWN_ERROR;
                        wardError = WARD_DROPDOWN_ERROR;
                      } else {
                        subCountyError = null;
                      }
                    });
                  },
                ),
                const SizedBox(height: 15,),
                const Divider(),
                const Text(
                  'Ward *',
                  style: TextStyle(color: kTextGrey),
                ),
                CustomDropdown(
                  initialValue: registryProvider.registryLocationModel.ward.isNotEmpty ? registryProvider.registryLocationModel.ward : selectedWard,
                  items: wardCriteria,
                  error: wardError,
                  onChanged: (val) {
                    setState(() {
                      selectedWard = val;
                      registryProvider.setWard(selectedWard);
                      if (val.isEmpty) {
                        wardError = WARD_DROPDOWN_ERROR;
                      } else {
                        wardError = null;
                      }
                    });
                  },
                ),
              ],
            ),
        ]);
  }
}
