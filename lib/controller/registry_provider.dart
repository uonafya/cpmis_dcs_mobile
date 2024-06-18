import 'package:cpims_dcs_mobile/models/registry/personal_details_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/registry/registry_caregiver_model.dart';
import '../models/registry/registry_cbo_chv_model.dart';
import '../models/registry/registry_contact_details_model.dart';
import '../models/registry/registry_identification_details_model.dart';
import '../models/registry/registry_location_model.dart';
import '../models/registry/registry_sibling_model.dart';

class RegistryProvider extends ChangeNotifier {

  // final RegisterNewChildModel _registerNewChildModel = RegisterNewChildModel();

  final RegistryIdentificationModel _registryIdentificationModel = RegistryIdentificationModel(birthRegistrationNumber: "", givenName: "", countryOfOrigin: "", tribe: "", religion:  "");
  final RegistryContactDetailsModel _registryContactDetailsModel = RegistryContactDetailsModel(designatedPhoneNumber: "", otherMobileNumber: "", emailAddress: "", physicalLocation: "");
  final RegistryLocationModel _registryLocationModel = RegistryLocationModel(county: "", subCounty: "", ward: "");
  final List<RegistryCaregiverModel> _caregivers = [];
  final List<RegistrySiblingModel> _siblings = [];
  final RegistryCboChvModel _registryCboChvModel = RegistryCboChvModel(cboParentUnit: "", ovcProgramEnrollment: "", chv: "");

  RegistryIdentificationModel get registryIdentificationModel => _registryIdentificationModel;
  RegistryContactDetailsModel get registryContactDetailsModel => _registryContactDetailsModel;
  RegistryLocationModel get registryLocationModel => _registryLocationModel;
  List<RegistryCaregiverModel> get caregivers => _caregivers;
  List<RegistrySiblingModel> get siblings => _siblings;
  RegistryCboChvModel get registryCboChvModel => _registryCboChvModel;



}