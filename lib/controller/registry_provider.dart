import 'package:cpims_dcs_mobile/core/network/person_registry/query.dart';
import 'package:cpims_dcs_mobile/models/case_load/caregiver_model.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';

import '../core/network/database.dart';
import '../models/registry/personal_details_model.dart';
import '../models/registry/registry_caregiver_model.dart';
import '../models/registry/registry_cbo_chv_model.dart';
import '../models/registry/registry_contact_details_model.dart';
import '../models/registry/registry_identification_details_model.dart';
import '../models/registry/registry_location_model.dart';
import '../models/registry/registry_sibling_model.dart';

class RegistryProvider extends ChangeNotifier {
  // final RegisterNewChildModel _registerNewChildModel = RegisterNewChildModel();

  final RegistryPersonalDetailsModel _registryPersonalDetailsModel = RegistryPersonalDetailsModel(personType: "", childOVCProgram: false, firstName: "", surname: "", sex: "", dateOfBirth: DateTime.now(), workforceIdName: "", datePaperFormFilled: "");
  final RegistryIdentificationModel _registryIdentificationModel = RegistryIdentificationModel(birthRegistrationNumber: "", givenName: "", countryOfOrigin: "", tribe: "", religion:  "");
  final RegistryContactDetailsModel _registryContactDetailsModel = RegistryContactDetailsModel(designatedPhoneNumber: "", otherMobileNumber: "", emailAddress: "", physicalLocation: "");
  final RegistryLocationModel _registryLocationModel = RegistryLocationModel(county: "", subCounty: "", ward: "");
  final List<RegistryCaregiverModel> _caregivers = [];
  final List<RegistrySiblingModel> _siblings = [];
  final RegistryCboChvModel _registryCboChvModel = RegistryCboChvModel(cboParentUnit: "", ovcProgramEnrollment: "", chv: "");

  RegistryPersonalDetailsModel get registryPersonalDetailsModel => _registryPersonalDetailsModel;
  RegistryIdentificationModel get registryIdentificationModel => _registryIdentificationModel;
  RegistryContactDetailsModel get registryContactDetailsModel => _registryContactDetailsModel;
  RegistryLocationModel get registryLocationModel => _registryLocationModel;
  List<RegistryCaregiverModel> get caregivers => _caregivers;
  List<RegistrySiblingModel> get siblings => _siblings;
  RegistryCboChvModel get registryCboChvModel => _registryCboChvModel;

  void setPersonType(String value) {
    _registryPersonalDetailsModel.personType = value;
  }

  void setIsCaregiver(bool value) {
    _registryPersonalDetailsModel.isCaregiver = value;
  }

  void setFirstName(String value) {
    _registryPersonalDetailsModel.firstName = value;
  }

  void setSurname(String value) {
    _registryPersonalDetailsModel.surname = value;
  }

  void setOtherNames(String value) {
    _registryPersonalDetailsModel.otherNames = value;
  }

  void setSex(String value) {
    _registryPersonalDetailsModel.sex = value;
  }

  void setDateOfBirth(DateTime value) {
    _registryPersonalDetailsModel.dateOfBirth = value;
  }

  void setBirthRegistrationNumber(String value) {
    _registryIdentificationModel.birthRegistrationNumber = value;
  }

  void setGivenName(String value) {
    _registryIdentificationModel.givenName = value;
  }

  void setCountryOfOrigin(String value) {
    _registryIdentificationModel.countryOfOrigin = value;
  }

  void setTribe(String value) {
    _registryIdentificationModel.tribe = value;
  }

  void setReligion(String value) {
    _registryIdentificationModel.religion = value;
  }

  void setDesignatedPhoneNumber(String value) {
    _registryContactDetailsModel.designatedPhoneNumber = value;
  }

  void setOtherMobileNumber(String value) {
    _registryContactDetailsModel.otherMobileNumber = value;
  }

  void setEmailAddress(String value) {
    _registryContactDetailsModel.emailAddress = value;
  }

  void setPhysicalAddress(String value) {
    _registryContactDetailsModel.physicalLocation = value;
  }

  void setCounty(String value) {
    _registryLocationModel.county = value;
  }

  void setSubCounty(String value) {
    _registryLocationModel.subCounty = value;
  }

  void setWard(String value) {
    _registryLocationModel.ward = value;
  }

  void setCboParentUnit(String value) {
    _registryCboChvModel.cboParentUnit = value;
  }

  void setOvcProgramEnrolment(String value) {
    _registryCboChvModel.ovcProgramEnrollment = value;
  }

  void setChv(String value) {
    _registryCboChvModel.chv = value;
  }

  void addCaregiver(RegistryCaregiverModel value) {
    caregivers.add(value);
    notifyListeners();

  }

  void addSibling(RegistrySiblingModel value) {
    siblings.add(value);
    notifyListeners();
  }

  void submit() {
    print(registryPersonalDetailsModel.toJson());
    print(_registryIdentificationModel.toJson());
    print(_registryContactDetailsModel.toJson());
    print("[");
    caregivers.forEach((value) {print(value.toJson());});
    print("]");
    print("[");
    siblings.forEach((value) {print(value.toJson());});
    print("]");
    print(_registryLocationModel.toJson());
    print(_registryCboChvModel.toJson());

    RegisterNewChildModel registerNewChildModel = RegisterNewChildModel(personType: registryPersonalDetailsModel.personType, childOVCProgram: false, firstName: registryPersonalDetailsModel.firstName, surname: registryPersonalDetailsModel.surname, sex: registryPersonalDetailsModel.sex, dateOfBirth: DateTime.now(), workforceIdName: registryPersonalDetailsModel.workforceIdName, datePaperFormFilled: registryPersonalDetailsModel.datePaperFormFilled, registryIdentificationModel: registryIdentificationModel, registryContactDetailsModel: registryContactDetailsModel, registryLocationModel: registryLocationModel, caregivers: caregivers, siblings: siblings, registryCboChvModel: registryCboChvModel);
    RegisterNewChildQuery.insertRegistryFormDetails(registerNewChildModel);
  }

  //DB instance
  Future<void> loadRegistryData() async {
    var database = await localdb.database;

    // Assuming you have tables for each model in your database
    var personaldetailsData = await database.query(registrtPersonalDetails);
    var identificationData = await database.query(registryIdentificationTable);
    var contactData = await database.query(registryContactTable);
    var locationData = await database.query(registryLocationTable);
    var caregiverData = await database.query(registryCaregiverTable);
    var siblingData = await database.query(registrySiblingTable);
    var cboChvData = await database.query(registryCboChvTable);

    // Convert the database data to model instances and assign them to the provider's fields
    if (personaldetailsData.isNotEmpty){
      RegistryPersonalDetailsModel.fromJson(personaldetailsData.first);
    }
    if (identificationData.isNotEmpty) {
      RegistryIdentificationModel.fromJson(identificationData.first);
    }
    if (contactData.isNotEmpty) {
      RegistryContactDetailsModel.fromJson(contactData.first);
    }
    if (locationData.isNotEmpty) {
      RegistryLocationModel.fromJson(locationData.first);
    }
    if (caregiverData.isNotEmpty) {
      _caregivers.clear();
      for (var caregiver in caregiverData) {
        _caregivers.add(RegistryCaregiverModel.fromJson(caregiver));
      }
    }
    if (siblingData.isNotEmpty) {
      _siblings.clear();
      for (var sibling in siblingData) {
        _siblings.add(RegistrySiblingModel.fromJson(sibling));
      }
    }
    if (cboChvData.isNotEmpty) {
      RegistryCboChvModel.fromJson(cboChvData.first);
    }

    notifyListeners();
  }
}
