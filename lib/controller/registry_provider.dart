import 'package:cpims_dcs_mobile/models/registry/personal_details_model.dart';
import 'package:flutter/cupertino.dart';
import '../core/network/database.dart';

import '../models/registry/registry_caregiver_model.dart';
import '../models/registry/registry_cbo_chv_model.dart';
import '../models/registry/registry_contact_details_model.dart';
import '../models/registry/registry_identification_details_model.dart';
import '../models/registry/registry_location_model.dart';
import '../models/registry/registry_sibling_model.dart';

class RegistryProvider extends ChangeNotifier {

  // final RegisterNewChildModel _registerNewChildModel = RegisterNewChildModel();

  final RegistryIdentificationModel _registryIdentificationModel = RegistryIdentificationModel(
      birthRegistrationNumber: "",
      givenName: "",
      countryOfOrigin: "",
      tribe: "",
      religion:  ""
  );
  final RegistryContactDetailsModel _registryContactDetailsModel = RegistryContactDetailsModel(
      designatedPhoneNumber: "",
      otherMobileNumber: "",
      emailAddress: "",
      physicalLocation: ""
  );
  final RegistryLocationModel _registryLocationModel = RegistryLocationModel(
      county: "",
      subCounty: "",
      ward: ""
  );
  final List<RegistryCaregiverModel> _caregivers = [];
  final List<RegistrySiblingModel> _siblings = [];
  final RegistryCboChvModel _registryCboChvModel = RegistryCboChvModel(
      cboParentUnit: "",
      ovcProgramEnrollment: "",
      chv: ""
  );

  RegistryIdentificationModel get registryIdentificationModel => _registryIdentificationModel;
  RegistryContactDetailsModel get registryContactDetailsModel => _registryContactDetailsModel;
  RegistryLocationModel get registryLocationModel => _registryLocationModel;
  List<RegistryCaregiverModel> get caregivers => _caregivers;
  List<RegistrySiblingModel> get siblings => _siblings;
  RegistryCboChvModel get registryCboChvModel => _registryCboChvModel;

  //DB instance
  Future<void> loadRegistryData() async {
    var database = await localdb.database;

    // Assuming you have tables for each model in your database
    var idData = await database.query('RegistryIdentification');
    var contactData = await database.query('RegistryContactDetails');
    var locationData = await database.query('RegistryLocation');
    var caregiverData = await database.query('RegistryCaregivers');
    var siblingData = await database.query('RegistrySiblings');
    var cboChvData = await database.query('RegistryCboChv');

    // Convert the database data to model instances and assign them to the provider's fields
    if (idData.isNotEmpty) {
      RegistryIdentificationModel.fromJson(idData.first);
    }
    if (contactData.isNotEmpty) {
      RegistryContactDetailsModel.fromJson(contactData.first);
    }
    if (locationData.isNotEmpty) {
      RegistryLocationModel.fromJson(locationData.first);
    }
    if (caregiverData.isNotEmpty) {
      _caregivers.clear();
      caregiverData.forEach((caregiver) {
        _caregivers.add(RegistryCaregiverModel.fromJson(caregiver));
      });
    }
    if (siblingData.isNotEmpty) {
      _siblings.clear();
      siblingData.forEach((sibling) {
        _siblings.add(RegistrySiblingModel.fromJson(sibling));
      });
    }
    if (cboChvData.isNotEmpty) {
      RegistryCboChvModel.fromJson(cboChvData.first);
    }

    notifyListeners();
  }
}