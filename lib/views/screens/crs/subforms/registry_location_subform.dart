import 'package:flutter/material.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';




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

  @override
  Widget build(BuildContext context) {
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
                  initialValue: selectedSubCounty,
                  items: subcountyCriteria,
                  onChanged: (val) {
                    setState(() {
                      selectedSubCounty = val;
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
