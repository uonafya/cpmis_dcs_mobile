import 'package:flutter/material.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';


enum ServiceLevel { national, county, subCounty }


class LocationSubform extends StatefulWidget {
  const LocationSubform({super.key});

  @override
  State<LocationSubform> createState() => _LocationSubformState();
}

class _LocationSubformState extends State<LocationSubform> {
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
  ServiceLevel? _radioValue;

  @override
  Widget build(BuildContext context) {
    return SubformWrapper(
        title: "Location",
        children: [
          const SizedBox(height: 10),
          const Text(
            'Working in',
            style: TextStyle(color: kTextGrey),
          ),
          const SizedBox(height: 15,),
          const Text(
            'Region',
            style: TextStyle(color: kTextGrey),
          ),
          // Radio button with two values, true or false
          Column(
            children: [
              Row(
                children: [
                  Radio<ServiceLevel>(
                    value: ServiceLevel.national,
                    groupValue: _radioValue,
                    onChanged: (ServiceLevel? value) {
                      setState(() {
                        _radioValue = value;
                      });
                    },
                  ),
                  const Text('National'),
                  Radio<ServiceLevel>(
                    value: ServiceLevel.county,
                    groupValue: _radioValue,
                    onChanged: (ServiceLevel? value) {
                      setState(() {
                        _radioValue = value;
                      });
                    },
                  ),
                  const Text('County'),
                ],
              ),
              Row(
                children: [
                  Radio<ServiceLevel>(
                    value: ServiceLevel.subCounty,
                    groupValue: _radioValue,
                    onChanged: (ServiceLevel? value) {
                      setState(() {
                        _radioValue = value;
                      });
                    },
                  ),
                  const Text('Sub-County'),
                ],
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 10),
          if(_radioValue == ServiceLevel.county)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'County *',
                style: TextStyle(color: kTextGrey),
              ),
              CustomDropdown(
                initialValue: selectedCounty,
                items: countyCriteria,
                onChanged: (val) {
                  setState(() {
                    selectedCounty = val;
                  });
                },
              ),
            ],
          ),
          if(_radioValue == ServiceLevel.subCounty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'County *',
                  style: TextStyle(color: kTextGrey),
                ),
                CustomDropdown(
                  initialValue: selectedCounty,
                  items: countyCriteria,
                  onChanged: (val) {
                    setState(() {
                      selectedCounty = val;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                const Text(
                  'Sub-County *',
                  style: TextStyle(color: kTextGrey),
                ),
                CustomDropdown(
                  initialValue: selectedSubCounty,
                  items: subcountyCriteria,
                  onChanged: (val) {
                    setState(() {
                      selectedSubCounty = val;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                const Text(
                  'Ward *',
                  style: TextStyle(color: kTextGrey),
                ),
                CustomDropdown(
                  initialValue: selectedWard,
                  items: wardCriteria,
                  onChanged: (val) {
                    setState(() {
                      selectedWard = val;
                    });
                  },
                ),
              ],
            ),
        ]);
  }
}
