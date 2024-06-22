import 'package:flutter/material.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:provider/provider.dart';

import '../../../../controller/registry_provider.dart';
import '../../../../core/network/locations.dart';
import '../../../../models/nameid.dart';

const String COUNTY_DROPDOWN_ERROR = "Please select a county.";
const String SUBCOUNTY_DROPDOWN_ERROR = "Please select a sub-county.";
const String WARD_DROPDOWN_ERROR = "Please select a ward.";

class RegistryLocationSubform extends StatefulWidget {
  const RegistryLocationSubform({super.key});

  @override
  State<RegistryLocationSubform> createState() => _RegistryLocationSubformState();
}

class _RegistryLocationSubformState extends State<RegistryLocationSubform> {

  List<NameID> counties = [
  ];
  List<NameID> subCounties = [
  ];
  List<NameID> wards = [
  ];

  String selectedCounty = 'Please Select';
  String selectedSubCounty = 'Please Select';
  String selectedWard = 'Please Select';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      counties = await getCounties();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    RegistryProvider registryProvider = Provider.of<RegistryProvider>(context);

    String? countyError = registryProvider.registryLocationModel.county.isEmpty? COUNTY_DROPDOWN_ERROR : null;
    String? subCountyError = registryProvider.registryLocationModel.subCounty.isEmpty? SUBCOUNTY_DROPDOWN_ERROR : null;
    String? wardError = registryProvider.registryLocationModel.ward.isEmpty? WARD_DROPDOWN_ERROR : null;

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
                items: counties.map((e) => e.name).toList(),
                error: registryProvider.shouldValidateFields ? countyError : null,
                onChanged: (val) async {
                  final values = await getSubCountiesOfCounty(val);
                  setState(() {
                    selectedCounty = val;
                    registryProvider.setCounty(selectedCounty);
                    selectedSubCounty = 'Please Select';
                    selectedWard = 'Please Select';
                    registryProvider.setSubCounty("");
                    registryProvider.setWard("");
                    if (val.isEmpty) {
                      countyError = COUNTY_DROPDOWN_ERROR;
                      subCountyError = SUBCOUNTY_DROPDOWN_ERROR;
                      wardError = WARD_DROPDOWN_ERROR;
                    } else {
                      countyError = null;
                    }
                    subCounties.clear();
                    subCounties.addAll(values);
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
                  items: subCounties.map((e) => e.name).toList(),
                  error: registryProvider.shouldValidateFields ? subCountyError : null,
                  onChanged: (val) async {
                    final values = await getWardsFromSubCounty(selectedSubCounty);
                    setState(() async {
                      selectedSubCounty = val;
                      registryProvider.setSubCounty(selectedSubCounty);
                      selectedWard = 'Please Select';
                      registryProvider.setWard("");
                      if (val.isEmpty) {
                        subCountyError = SUBCOUNTY_DROPDOWN_ERROR;
                        wardError = WARD_DROPDOWN_ERROR;
                      } else {
                        subCountyError = null;
                      }
                      wards.clear();
                      wards.addAll(values);
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
                  items: wards.map((e) => e.name).toList(),
                  error: registryProvider.shouldValidateFields ? wardError : null,
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
