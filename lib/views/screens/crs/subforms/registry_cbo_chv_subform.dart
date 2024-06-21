import 'package:cpims_dcs_mobile/views/screens/crs/widgets/subform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/registry_provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../widgets/custom_dropdown.dart';

const String CBO_DROPDOWN_ERROR = "Please select a parent unit.";
const String OVC_DROPDOWN_ERROR = "Please select an OVH program.";
const String CHV_DROPDOWN_ERROR = "Please select a CHV.";

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

    RegistryProvider registryProvider = Provider.of<RegistryProvider>(context);

    String? cboError = registryProvider.registryCboChvModel.cboParentUnit.isEmpty? CBO_DROPDOWN_ERROR : null;
    String? ovcError = registryProvider.registryCboChvModel.ovcProgramEnrollment.isEmpty? OVC_DROPDOWN_ERROR : null;
    String? chvError = registryProvider.registryCboChvModel.chv.isEmpty? CHV_DROPDOWN_ERROR : null;

    return SubformWrapper(
      title: "CBO/CHV Details",
      children: [
        const Text(
          'CBO *',
          style: TextStyle(color: kTextGrey),
        ),
        const SizedBox(height: 6),
        CustomDropdown(
          initialValue: registryProvider.registryCboChvModel.cboParentUnit.isNotEmpty ? registryProvider.registryCboChvModel.cboParentUnit : selectedCBO,
          items: cboCriteria,
          error: registryProvider.shouldValidateFields ? cboError : null,
          onChanged: (val) {
            setState(() {
              selectedCBO = val;
              registryProvider.setCboParentUnit(selectedCBO);
              if (val.isEmpty) {
                cboError = CBO_DROPDOWN_ERROR;
              } else {
                cboError = null;
              }
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
          initialValue: registryProvider.registryCboChvModel.ovcProgramEnrollment.isNotEmpty ? registryProvider.registryCboChvModel.ovcProgramEnrollment : selectedOVC,
          items: ovcCriteria,
          error: registryProvider.shouldValidateFields ? ovcError : null,
          onChanged: (val) {
            setState(() {
              selectedOVC = val;
              registryProvider.setOvcProgramEnrolment(selectedOVC);
              if (val.isEmpty) {
                ovcError = OVC_DROPDOWN_ERROR;
              } else {
                ovcError = null;
              }
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
          initialValue: registryProvider.registryCboChvModel.chv.isNotEmpty ? registryProvider.registryCboChvModel.chv : selectedCHV,
          items: chvCriteria,
          error: registryProvider.shouldValidateFields ? chvError : null,
          onChanged: (val) {
            setState(() {
              selectedCHV = val;
              registryProvider.setChv(selectedCHV);
              if (val.isEmpty) {
                chvError = CHV_DROPDOWN_ERROR;
              } else {
                chvError = null;
              }
            });
          },
        ),
      ],
    );
  }
}
