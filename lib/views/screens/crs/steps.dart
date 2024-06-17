// crs stepper data
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/about_child_widget.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_data_widget.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/case_reporting_widget.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/medical_widget.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> crsStepperData = [
  {
    'title': 'Case Reporting',
    'subtitle': 'Reporter and additional details',
    'onTap': () {},
  },
  {
    'title': 'About the child',
    'subtitle': 'Name and additional details',
    'onTap': () => {},
  },
  {
    'title': 'Medical',
    'subtitle': 'Medical history and additional details',
    'onTap': () => {},
  },
  {
    'title': 'Case Data',
    'subtitle': 'Case type and additional details',
    'onTap': () => {},
  },
];

List<Widget> crsStepperWidgets = [
  const CaseReportingWidget(),
  const AboutChildWidget(),
  const MedicalWidget(),
  const CaseDataWidget(),
];
