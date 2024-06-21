import 'package:cpims_dcs_mobile/core/network/person_registry/query.dart';
import 'package:flutter/foundation.dart';
import '../models/registry/personal_details_model.dart';
import '../models/registry/registry_caregiver_model.dart';
import '../models/registry/registry_cbo_chv_model.dart';
import '../models/registry/registry_contact_details_model.dart';
import '../models/registry/registry_identification_details_model.dart';
import '../models/registry/registry_location_model.dart';
import '../models/registry/registry_sibling_model.dart';

class RegistryProvider extends ChangeNotifier {
  // final RegisterNewChildModel _registerNewChildModel = RegisterNewChildModel();

  final RegistryPersonalDetailsModel _registryPersonalDetailsModel = RegistryPersonalDetailsModel(personType: "", childOVCProgram: false, firstName: "", surname: "", sex: "", dateOfBirth: "", workforceIdName: "", datePaperFormFilled: "", childClass: "");
  final RegistryIdentificationModel _registryIdentificationModel = RegistryIdentificationModel(birthRegistrationNumber: "", givenName: "", countryOfOrigin: "", tribe: "", religion:  "");
  final RegistryContactDetailsModel _registryContactDetailsModel = RegistryContactDetailsModel(designatedPhoneNumber: "", otherMobileNumber: "", emailAddress: "", physicalLocation: "");
  final RegistryLocationModel _registryLocationModel = RegistryLocationModel(county: "", subCounty: "", ward: "");
  final List<RegistryCaregiverModel> _caregivers = [];
  final List<RegistrySiblingModel> _siblings = [];
  final RegistryCboChvModel _registryCboChvModel = RegistryCboChvModel(cboParentUnit: "", ovcProgramEnrollment: "", chv: "");
  bool _shouldValidateFields = false;

  RegistryPersonalDetailsModel get registryPersonalDetailsModel => _registryPersonalDetailsModel;
  RegistryIdentificationModel get registryIdentificationModel => _registryIdentificationModel;
  RegistryContactDetailsModel get registryContactDetailsModel => _registryContactDetailsModel;
  RegistryLocationModel get registryLocationModel => _registryLocationModel;
  List<RegistryCaregiverModel> get caregivers => _caregivers;
  List<RegistrySiblingModel> get siblings => _siblings;
  RegistryCboChvModel get registryCboChvModel => _registryCboChvModel;
  bool get shouldValidateFields => _shouldValidateFields;

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

  void setDateOfBirth(String value) {
    _registryPersonalDetailsModel.dateOfBirth = value;
  }

  void setChildClass(String value) {
    _registryPersonalDetailsModel.childClass = value;
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

  void removeCaregiver(RegistryCaregiverModel value) {
    caregivers.remove(value);
    notifyListeners();
  }

  void removeSibling(RegistrySiblingModel value) {
    siblings.remove(value);
    notifyListeners();
  }

  void setShouldValidateFields() {
    _shouldValidateFields = true;
    notifyListeners();
  }

  void clearState() {
    _registryPersonalDetailsModel.clear();
    _registryIdentificationModel.clear();
    _registryContactDetailsModel.clear();
    _registryLocationModel.clear();
    _caregivers.clear();
    _siblings.clear();
    _registryCboChvModel.clear();
    _shouldValidateFields = false;
  }

  bool isComplete() {
    return _registryPersonalDetailsModel.isComplete() &&
    _registryIdentificationModel.isComplete() &&
    _registryContactDetailsModel.isComplete() &&
    _registryLocationModel.isComplete() &&
    _registryCboChvModel.isComplete();
  }

  bool isNotComplete() {
    return !isComplete();
  }

  Future<void> submit() async {
    if (isNotComplete()) {
      return;
    }
    try {
      RegisterNewChildModel registerNewChildModel = RegisterNewChildModel(
          personType: registryPersonalDetailsModel.personType,
          childOVCProgram: false,
          firstName: registryPersonalDetailsModel.firstName,
          surname: registryPersonalDetailsModel.surname,
          sex: registryPersonalDetailsModel.sex,
          dateOfBirth: registryPersonalDetailsModel.dateOfBirth,
          childClass: registryPersonalDetailsModel.childClass,
          workforceIdName: registryPersonalDetailsModel.workforceIdName,
          datePaperFormFilled: registryPersonalDetailsModel.datePaperFormFilled,
          registryIdentificationModel: registryIdentificationModel,
          registryContactDetailsModel: registryContactDetailsModel,
          registryLocationModel: registryLocationModel,
          caregivers: caregivers,
          siblings: siblings,
          registryCboChvModel: registryCboChvModel);
      await RegisterNewChildQuery.insertRegistryFormDetails(
          registerNewChildModel);
      clearState();
      if (kDebugMode) {
        print(registerNewChildModel.toJson());
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Error inserting new child: $e");
      }
    }
    // RegisterNewChildQuery.getRegistryFormDetails();
    // RegisterNewChildQuery.getRegistryFormDetailById(1);
  }
}
