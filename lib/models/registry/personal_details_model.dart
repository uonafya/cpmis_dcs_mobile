import 'package:cpims_dcs_mobile/models/registry/registry_caregiver_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_cbo_chv_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_contact_details_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_identification_details_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_location_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_sibling_model.dart';

class RegisterNewChildModel {
  String personType;
  bool? isCaregiver;
  bool childOVCProgram;
  String firstName;
  String surname;
  String? otherNames;
  String sex;
  DateTime dateOfBirth;
  RegistryIdentificationModel registryIdentificationModel;
  RegistryContactDetailsModel registryContactDetailsModel;
  RegistryLocationModel registryLocationModel;
  List<RegistryCaregiverModel> caregivers;
  List<RegistrySiblingModel> siblings;
  RegistryCboChvModel registryCboChvModel;
  String workforceIdName;
  String datePaperFormFilled;

  RegisterNewChildModel({
    required this.personType,
    this.isCaregiver,
    required this.childOVCProgram,
    required this.firstName,
    required this.surname,
    this.otherNames,
    required this.sex,
    required this.dateOfBirth,
    required this.registryIdentificationModel,
    required this.registryContactDetailsModel,
    required this.registryLocationModel,
    required this.caregivers,
    required this.siblings,
    required this.registryCboChvModel,
    required this.workforceIdName,
    required this.datePaperFormFilled,
  });

  // Converts a RegisterNewChildModel instance to a map for JSON encoding
  Map<String, dynamic> toJson() {
    return {
      'personType': personType,
      'isCaregiver': isCaregiver,
      'providesServicesToChildren': childOVCProgram,
      'firstName': firstName,
      'surname': surname,
      'otherNames': otherNames,
      'sex': sex,
      'dateOfBirth': dateOfBirth,
      'registryIdentificationModel' : registryIdentificationModel,
      'registryContactDetailsModel' : registryContactDetailsModel,
      'registryLocationModel' : registryLocationModel,
      'caregivers' : caregivers,
      'siblings' : siblings,
      'registryCboChvModel' : registryCboChvModel,
      'workforceIdName': workforceIdName,
      'datePaperFormFilled': datePaperFormFilled,
    };
  }

  // Creates a RegisterNewChildModel instance from a map (e.g., decoded JSON)
  factory RegisterNewChildModel.fromJson(Map<String, dynamic> json) {
    return RegisterNewChildModel(
      personType: json['personType'],
      isCaregiver: json['isCaregiver'],
      childOVCProgram: json['providesServicesToChildren'],
      firstName: json['firstName'],
      surname: json['surname'],
      otherNames: json['otherNames'],
      sex: json['sex'],
      dateOfBirth: json['dateOfBirth'],
      registryIdentificationModel: json['registryIdentificationModel'],
      registryContactDetailsModel: json['registryContactDetailsModel'],
      registryLocationModel: json['registryLocationModel'],
      caregivers: json['caregivers'],
      siblings: json['siblings'],
      registryCboChvModel: json['registryCboChvModel'],
      workforceIdName: json['workforceIdName'],
      datePaperFormFilled: json['datePaperFormFilled'],
    );
  }
}
