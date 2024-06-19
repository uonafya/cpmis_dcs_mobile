import 'dart:ffi';
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';
import 'dart:typed_data';

import 'package:cpims_dcs_mobile/views/screens/cci_transition/cci_transition.dart';

class CciTransitionModel {
  String? cciName;
  String? cciId;
  bool? cciNCCSReg;
  String? nccsRegNo;
  String? nccsDateofReg;
  Int? nccsvalidyrs;
  bool? cciOtherReg;
  String? otherRegNo;
  String? otherDateofReg;
  Int? othervalidyrs;
  List<String>? cciDisability;
  List<String>? cciAccommondatedGender;
  List<String>? cciAccommondatedAges;
  String? transitionStarted;
  String? basisTransition;
  String? legalFrameworkStrategy;
  String? stakeholderEngagement;
  String? makeDecision;
  String? assessment;
  String? strategicPlan;
  String? orgPlanning;
  String? progPlanning;
  String? transitionPlanning;
  String? employeeDevelopment;
  String? pilotingAndValidation;
  String? programImplementation;
  String? monitoringAndEvaluation;
  String? cciTransitionTo;
  List<String>? survivalRights;
  List<String>? developmentRigts;
  List<String>? protectionRights;
  List<String>? participationRights;

  CciTransitionModel({
    required this.cciName,
    this.cciId,
    this.cciNCCSReg,
    this.nccsRegNo,
    this.nccsDateofReg,
    this.nccsvalidyrs,
    this.cciOtherReg,
    this.otherRegNo,
    this.otherDateofReg,
    this.othervalidyrs,
    this.cciDisability,
    this.cciAccommondatedGender,
    this.cciAccommondatedAges,
    this.transitionStarted,
    this.basisTransition,
    this.legalFrameworkStrategy,
    this.stakeholderEngagement,
    this.makeDecision,
    this.assessment,
    this.strategicPlan,
    this.orgPlanning,
    this.progPlanning,
    this.transitionPlanning,
    this.employeeDevelopment,
    this.pilotingAndValidation,
    this.programImplementation,
    this.monitoringAndEvaluation,
    this.cciTransitionTo,
    this.survivalRights,
    this.developmentRigts,
    this.protectionRights,
    this.participationRights,
  });

  CciTransitionModel.fromJson(Map<String, dynamic> json) {
    cciName = json['cci_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cci_name'] = cciName;
    return data;
  }
}
