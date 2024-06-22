// import 'dart:ffi';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';
// import 'dart:typed_data';
//
// import 'package:cpims_dcs_mobile/views/screens/cci_transition/cci_transition.dart';

class CciTransitionModel {
  String? cciId;
  String? cciName;
  bool? nccsRegistered;
  String? cciRegNo;
  String? cciDateOfReg;
  String? cciValidYrs;
  bool? cciOtherReg;
  String? cciServesDisabled;
  String? cciGender;
  String? cciAccommodateAges;
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
  String? survivalRights;
  String? developmentRights;
  String? protectionRights;
  String? participationRights;
  String? createdAt;

  CciTransitionModel({
    this.cciId,
    this.cciName,
    this.nccsRegistered,
    this.cciRegNo,
    this.cciDateOfReg,
    this.cciValidYrs,
    this.cciOtherReg,
    this.cciServesDisabled,
    this.cciGender,
    this.cciAccommodateAges,
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
    this.developmentRights,
    this.protectionRights,
    this.participationRights,
    this.createdAt,
  });

  CciTransitionModel.fromJson(Map<String, dynamic> json) {
    cciId   = json['cci_id'];
    cciName = json['cci_name'];
    nccsRegistered = json['nccs_registered'];
    cciRegNo = json['cci_reg_no'];
    cciDateOfReg = json['cci_date_of_reg'];
    cciValidYrs = json['cci_valid_yrs'];
    cciOtherReg = json['cci_other_reg'];
    cciServesDisabled = json['cci_serves_disabled'];
    cciGender = json['cci_gender'];
    cciAccommodateAges = json['cci_accommodate_ages'];
    transitionStarted = json['transition_started'];
    basisTransition = json['basis_transition'];
    legalFrameworkStrategy = json['legal_framework_strategy'];
    stakeholderEngagement = json['stakeholder_engagement'];
    makeDecision = json['make_decision'];
    assessment = json['assessment_'];
    strategicPlan = json['strategic_plan'];
    orgPlanning = json['org_planning'];
    progPlanning = json['prog_planning'];
    transitionPlanning = json['transition_planning'];
    employeeDevelopment = json['employee_development'];
    pilotingAndValidation = json['piloting_and_validation'];
    programImplementation = json['program_implementation'];
    monitoringAndEvaluation = json['monitoring_and_evaluation'];
    cciTransitionTo = json['cci_transition_to'];
    survivalRights = json['survival_rights'];
    developmentRights = json['development_rights'];
    protectionRights = json['protection_rights'];
    participationRights = json['participation_rights'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cci_id'] = cciId  ;
    data['cci_name'] = cciName;
    data['nccs_registered'] = nccsRegistered;
    data['cci_reg_no'] = cciRegNo;
    data['cci_date_of_reg'] = cciDateOfReg;
    data['cci_valid_yrs'] = cciValidYrs;
    data['cci_other_reg'] = cciOtherReg;
    data['cci_serves_disabled'] = cciServesDisabled;
    data['cci_gender'] = cciGender;
    data['cci_accommodate_ages'] = cciAccommodateAges;
    data['transition_started'] = transitionStarted;
    data['basis_transition'] = basisTransition;
    data['legal_framework_strategy'] = legalFrameworkStrategy;
    data['stakeholder_engagement'] = stakeholderEngagement;
    data['make_decision'] = makeDecision;
    data['assessment_'] = assessment;
    data['strategic_plan'] = strategicPlan;
    data['org_planning'] = orgPlanning;
    data['prog_planning'] = progPlanning;
    data['transition_planning'] = transitionPlanning;
    data['employee_development'] = employeeDevelopment;
    data['piloting_and_validation'] = pilotingAndValidation;
    data['program_implementation'] = programImplementation;
    data['monitoring_and_evaluation'] = monitoringAndEvaluation;
    data['cci_transition_to'] = cciTransitionTo;
    data['survival_rights'] = survivalRights;
    data['development_rights'] = developmentRights;
    data['protection_rights'] = protectionRights;
    data['participation_rights'] = participationRights;
    data['created_at'] = createdAt;
    return data;
  }
}