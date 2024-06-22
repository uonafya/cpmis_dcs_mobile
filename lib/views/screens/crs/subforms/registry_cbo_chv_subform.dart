import 'package:cpims_dcs_mobile/controller/metadata_manager.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/registry_provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../widgets/custom_dropdown.dart';

class RegistryCBOandCHVSubform extends StatefulWidget {
  const RegistryCBOandCHVSubform({super.key});

  @override
  State<RegistryCBOandCHVSubform> createState() =>
      _RegistryCBOandCHVSubformState();
}

class _RegistryCBOandCHVSubformState extends State<RegistryCBOandCHVSubform> {

  List<String> ovcCriteria = [
    'OVC',
    'Preventive',
    'Dreams',
    'Fs/Other',
  ];
  List<String> chvCriteria = [
    'RUTH AKINYI',
    'ANNA. OWINO',
    'DAMARIS. OTOLO',
  ];

  String selectedCBO = 'Select Parent Unit';
  String selectedOVC = 'Please Select One';
  String selectedCHV = 'Please Select One';

  @override
  Widget build(BuildContext context) {

    RegistryProvider registryProvider = Provider.of<RegistryProvider>(context);

    return SubformWrapper(
      title: "CBO/CHV Details",
      children: [
        const Text(
          'CBO',
          style: TextStyle(color: kTextGrey),
        ),
        const SizedBox(height: 6),
        CustomDropdown(
          initialValue: registryProvider.registryCboChvModel.cboParentUnit.isNotEmpty ? registryProvider.registryCboChvModel.cboParentUnit : selectedCBO,
          items: MetadataManager.getInstance().orgUnitNames,
          onChanged: (val) {
            setState(() {
              selectedCBO = val;
              registryProvider.setCboParentUnit(selectedCBO);
            });
          },
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        const Text(
          'OVC Program Enrollment',
          style: TextStyle(color: kTextGrey),
        ),
        const SizedBox(height: 6),
        CustomDropdown(
          initialValue: registryProvider.registryCboChvModel.ovcProgramEnrollment.isNotEmpty ? registryProvider.registryCboChvModel.ovcProgramEnrollment : selectedOVC,
          items: ovcCriteria,
          onChanged: (val) {
            setState(() {
              selectedOVC = val;
              registryProvider.setOvcProgramEnrolment(selectedOVC);
            });
          },
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        const Text(
          'CHV',
          style: TextStyle(color: kTextGrey),
        ),
        const SizedBox(height: 6),
        CustomDropdown(
          initialValue: registryProvider.registryCboChvModel.chv.isNotEmpty ? registryProvider.registryCboChvModel.chv : selectedCHV,
          items: chvCriteria,
          onChanged: (val) {
            setState(() {
              selectedCHV = val;
              registryProvider.setChv(selectedCHV);
            });
          },
        ),
      ],
    );
  }
}
