
import 'package:cpims_dcs_mobile/views/screens/crs/subforms/registry_caregiver_sibling_subform.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/subforms/registry_contact_details_subform.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/subforms/registry_identification_subform.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/subforms/location_subform.dart';
import 'package:flutter/material.dart';

List<Widget> REGISTRY_SUBFORMS = [
  const RegistryIdentificationSubform(),
  const RegistryContactDetailsSubform(),
  const LocationSubform(),
  const RegistryCaregiverSiblingSubform(),
  const Text("Organisation Unit"),
];

List<Map<String, dynamic>> REGISTRY_SUBFORM_HEADERS_TEXT = [
  {
    'title': 'Identification',
    'subtitle': "Person's identification details.",
    'onTap': () {}
  },
  {
    'title': 'Contact Details',
    'subtitle': "Person's contact details.",
    'onTap': () => {},
  },
  {
    'title': 'Location',
    'subtitle': 'Living in and working in details.',
    'onTap': () => {},
  },
  {
    'title': 'Caregiver / Siblings',
    'subtitle': 'Child caregiver(s) / sibling(s) details.',
    'onTap': () => {},
  },
  {
    'title': 'Organisation Unit',
    'subtitle': 'Units attached to person.',
    'onTap': () => {},
  },
];