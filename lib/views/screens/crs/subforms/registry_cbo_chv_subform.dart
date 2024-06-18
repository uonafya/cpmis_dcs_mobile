import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../widgets/custom_dropdown.dart';

class RegistryCBOandCHVSubform extends StatefulWidget {
  const RegistryCBOandCHVSubform({super.key});

  @override
  State<RegistryCBOandCHVSubform> createState() =>
      _RegistryCBOandCHVSubformState();
}

class _RegistryCBOandCHVSubformState extends State<RegistryCBOandCHVSubform> {
  List<String> cboCriteria = [
    'Select Parent Unit',
    'UO27664 - CARITAS DOHB',
    'U73643 - KARAYA',
  ];
  List<String> ovcCriteria = [
    'Please Select One',
    'OVC',
    'Preventive',
    'Dreams',
    'Fs/Other',
  ];
  List<String> chvCriteria = [
    'Select CHV',
    'RUTH AKINYI',
    'ANNA. OWINO',
    'DAMARIS. OTOLO',
  ];

  String selectedCBO = 'Select Parent Unit';
  String selectedOVC = 'Please Select One';
  String selectedCHV = 'Please Select One';

  @override
  Widget build(BuildContext context) {
    return SubformWrapper(
      title: "CBO/CHV Details",
      children: [
        const Text(
          'CBO *',
          style: TextStyle(color: kTextGrey),
        ),
        const SizedBox(height: 6),
        CustomDropdown(
          initialValue: selectedCBO,
          items: cboCriteria,
          onChanged: (val) {
            setState(() {
              selectedCBO = val;
            });
          },
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        const Text(
          'OVC Program Enrollment *',
          style: TextStyle(color: kTextGrey),
        ),
        const SizedBox(height: 6),
        CustomDropdown(
          initialValue: selectedOVC,
          items: ovcCriteria,
          onChanged: (val) {
            setState(() {
              selectedOVC = val;
            });
          },
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        const Text(
          'CHV *',
          style: TextStyle(color: kTextGrey),
        ),
        const SizedBox(height: 6),
        CustomDropdown(
          initialValue: selectedCHV,
          items: chvCriteria,
          onChanged: (val) {
            setState(() {
              selectedCHV = val;
            });
          },
        ),
      ],
    );
  }
}
