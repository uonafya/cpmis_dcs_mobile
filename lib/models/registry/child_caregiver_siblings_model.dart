import 'package:cpims_dcs_mobile/models/registry/registry_caregiver_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_sibling_model.dart';

class ChildCaregiverSiblingsModel {
  String workForceId;
  DateTime dateOfAdmission;
  List<RegistryCaregiverModel> caregivers;
  List<RegistrySiblingModel> siblings;

  ChildCaregiverSiblingsModel({
    required this.workForceId,
    required this.dateOfAdmission,
    required this.caregivers,
    required this.siblings,
  });

  Map<String, dynamic> toJson() {
    return {
      'workForceId': workForceId,
      'dateOfAdmission': dateOfAdmission,
      'caregivers': caregivers.map((e) => e.toJson()).toList(),
      'siblings': siblings.map((e) => e.toJson()).toList(),
    };
  }

  factory ChildCaregiverSiblingsModel.fromJson(Map<String, dynamic> json) {
    return ChildCaregiverSiblingsModel(
      workForceId: json['workForceId'],
      dateOfAdmission: json['dateOfAdmission'],
      caregivers: List<RegistryCaregiverModel>.from(
          json['caregivers'].map((x) => RegistryCaregiverModel.fromJson(x))),
      siblings: List<RegistrySiblingModel>.from(
          json['siblings'].map((x) => RegistrySiblingModel.fromJson(x))),
    );
  }
}
