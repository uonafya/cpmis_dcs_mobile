import 'package:cpims_dcs_mobile/models/case_load/caregiver_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_category_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/perpetrator_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/siblings_model.dart';

class CaseLoadModel {
  String? orgUnitName;
  String? orgUnitId;
  String? reportSubCountyName;
  String? reportSubCountyId;
  String? occurrenceCountyName;
  String? occurrenceCountyId;
  String? occurrenceSubCountyName;
  String? occurrenceSubCountyId;
  String? occurrenceWardName;
  String? occurrenceVillageName;
  String? caseID;
  String? caseSerial;
  String? perpetratorStatus;
  List<PerpetratorModel>? perpetrators;
  String? ovcCpimsId;
  String? ovcFirstName;
  String? ovcSurname;
  String? ovcOtherNames;
  String? ovcSex;
  List<SiblingsModel>? siblings;
  List<CaregiverModel>? caregivers;
  List<CaseCategoryModel>? caseCategories;
  String? riskLevel;
  String? dateCaseOpened;
  String? caseReporterfirstName;
  String? caseReporterOtherNames;
  String? caseReporterSurName;
  String? caseReporterContacts;
  String? caseReporter;
  String? courtName;
  String? courtNumber;
  String? policeStationName;
  String? obNumber;
  String? caseStatus;
  String? referralPresent;
  String? timeStampCreated;
  String? createdBy;
  String? personId;
  String? caseRemarks;
  String? dateOfSummon;
  bool? summonStatus;
  List<String>? householdEconomicStatus;
  List<String>? mentalCondition;
  List<String>? physicalCondition;
  List<String>? otherCondition;
  List<String>? immediateNeeds;
  List<String>? futureNeeds;
  List<String>? friends;
  List<String>? hobbies;

  CaseLoadModel({
    this.orgUnitName,
    this.orgUnitId,
    this.reportSubCountyName,
    this.reportSubCountyId,
    this.occurrenceCountyName,
    this.occurrenceCountyId,
    this.occurrenceSubCountyName,
    this.occurrenceSubCountyId,
    this.occurrenceWardName,
    this.occurrenceVillageName,
    this.caseID,
    this.caseSerial,
    this.perpetratorStatus,
    this.perpetrators,
    this.ovcCpimsId,
    this.ovcFirstName,
    this.ovcSurname,
    this.ovcOtherNames,
    this.ovcSex,
    this.siblings,
    this.caregivers,
    this.caseCategories,
    this.riskLevel,
    this.dateCaseOpened,
    this.caseReporterfirstName,
    this.caseReporterOtherNames,
    this.caseReporterSurName,
    this.caseReporterContacts,
    this.caseReporter,
    this.courtName,
    this.courtNumber,
    this.policeStationName,
    this.obNumber,
    this.caseStatus,
    this.referralPresent,
    this.timeStampCreated,
    this.createdBy,
    this.personId,
    this.caseRemarks,
    this.dateOfSummon,
    this.summonStatus,
    this.householdEconomicStatus,
    this.mentalCondition,
    this.physicalCondition,
    this.otherCondition,
    this.immediateNeeds,
    this.futureNeeds,
    this.friends,
    this.hobbies,
  });

  CaseLoadModel.fromJson(Map<String, dynamic> json) {
    orgUnitName = json['org_unit_name'] ?? '';
    orgUnitId = json['org_unit_id'] ?? '';
    reportSubCountyName = json['report_subcounty_name'] ?? '';
    reportSubCountyId = json['report_subcounty_id'] ?? '';
    occurrenceCountyName = json['occurence_county_name'] ?? '';
    occurrenceCountyId = json['occurence_county_id'] ?? '';
    occurrenceSubCountyName = json['occurence_subcounty_name'] ?? '';
    occurrenceSubCountyId = json['occurence_subcounty_id'] ?? '';
    occurrenceWardName = json['occurence_ward'] ?? '';
    occurrenceVillageName = json['occurence_village'] ?? '';
    caseID = json['case_id'] ?? '';
    caseSerial = json['case_serial'] ?? '';
    perpetratorStatus = json['perpetrator_status'] ?? '';
    if (json['perpetrators'] != null) {
      perpetrators = <PerpetratorModel>[];
      json['perpetrators'].forEach((v) {
        perpetrators!.add(PerpetratorModel.fromJson(v));
      });
    } else {
      perpetrators = [];
    }
    ovcCpimsId = json['ovc_cpims_id'].toString();
    ovcFirstName = json['ovc_first_name'] ?? '';
    ovcSurname = json['ovc_surname'] ?? '';
    ovcOtherNames = json['ovc_other_names'] ?? '';
    ovcSex = json['ovc_sex'] ?? '';
    if (json['siblings'] != null) {
      siblings = <SiblingsModel>[];
      json['siblings'].forEach((v) {
        siblings!.add(SiblingsModel.fromJson(v));
      });
    } else {
      siblings = [];
    }
    if (json['caregivers'] != null) {
      caregivers = <CaregiverModel>[];
      json['caregivers'].forEach((v) {
        caregivers!.add(CaregiverModel.fromJson(v));
      });
    } else {
      caregivers = [];
    }
    if (json['case_categories'] != null) {
      caseCategories = <CaseCategoryModel>[];
      json['case_categories'].forEach((v) {
        caseCategories!.add(CaseCategoryModel.fromJson(v));
      });
    } else {
      caseCategories = [];
    }
    riskLevel = json['risk_level'] ?? '';
    dateCaseOpened = json['date_case_opened'] ?? '';
    caseReporterfirstName = json['case_reporter_first_name'] ?? '';
    caseReporterOtherNames = json['case_reporter_other_names'] ?? '';
    caseReporterSurName = json['case_reporter_surname'] ?? '';
    caseReporterContacts = json['case_reporter_contacts'] ?? '';
    caseReporter = json['case_reporter'] ?? '';
    courtName = json['court_name'] ?? '';
    courtNumber = json['court_number'] ?? '';
    policeStationName = json['police_station'] ?? '';
    obNumber = json['ob_number'] ?? '';
    caseStatus = json['case_status'];
    referralPresent = json['referral_present'] ?? '';
    timeStampCreated = json['timestamp_created'] ?? '';
    createdBy = json['created_by'] ?? '';
    personId = json['person_id'] ?? '';
    caseRemarks = json['case_remarks'] ?? '';
    dateOfSummon = json['date_of_summon'] ?? '';
    summonStatus = json['summon_status'] ?? '';
    householdEconomicStatus = json['household_economic_status'] ?? [];
    mentalCondition = json['mental_condition'] ?? [];
    physicalCondition = json['physical_condition'] ?? [];
    otherCondition = json['other_condition'] ?? [];
    immediateNeeds = json['immediate_needs'] ?? [];
    futureNeeds = json['future_needs'] ?? [];
    friends = json['friends'] ?? [];
    hobbies = json['hobbies'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['org_unit_name'] = orgUnitName;
    data['org_unit_id'] = orgUnitId;
    data['report_subcounty_name'] = reportSubCountyName;
    data['report_subcounty_id'] = reportSubCountyId;
    data['occurence_county_name'] = occurrenceCountyName;
    data['occurence_county_id'] = occurrenceCountyId;
    data['occurence_subcounty_name'] = occurrenceSubCountyName;
    data['occurence_subcounty_id'] = occurrenceSubCountyId;
    data['occurence_ward'] = occurrenceWardName;
    data['occurence_village'] = occurrenceVillageName;
    data['case_id'] = caseID;
    data['case_serial'] = caseSerial;
    data['case_reporter'] = caseReporter;
    data['ovc_cpims_id'] = ovcCpimsId;
    data['ovc_first_name'] = ovcFirstName;
    data['ovc_surname'] = ovcSurname;
    data['ovc_other_names'] = ovcOtherNames;
    data['ovc_sex'] = ovcSex;
    data['perpetrator_status'] = perpetratorStatus;
    if (perpetrators != null) {
      data['perpetrators'] = perpetrators!.map((v) => v.toJson()).toList();
    }
    data['risk_level'] = riskLevel;
    data['date_case_opened'] = dateCaseOpened;
    data['case_status'] = caseStatus;
    if (caseCategories != null) {
      data['case_categories'] = caseCategories!.map((v) => v.toJson()).toList();
    }
    data['case_remarks'] = caseRemarks;
    if (caregivers != null) {
      data['caregivers'] = caregivers!.map((v) => v.toJson()).toList();
    }
    if (siblings != null) {
      data['siblings'] = siblings!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      "case_id": caseID ?? '',
      "case_serial": caseSerial ?? '',
      "case_reporter": caseReporter ?? '',
      "ovc_cpims_id": ovcCpimsId ?? '',
      "ovc_first_name": ovcFirstName ?? '',
      "ovc_surname": ovcSurname ?? '',
      "ovc_other_names": ovcOtherNames ?? '',
      "ovc_sex": ovcSex ?? '',
      "perpetrator_status": perpetratorStatus ?? '',
      "perpetrators": perpetrators?.map((v) => v.toMap()).toList() ?? [],
      "risk_level": riskLevel ?? '',
      "date_case_opened": dateCaseOpened ?? '',
      "case_status": caseStatus ?? '',
      "case_categories": caseCategories?.map((v) => v.toMap()).toList() ?? [],
      "case_remarks": caseRemarks ?? '',
      "caregivers": caregivers?.map((v) => v.toMap()).toList() ?? [],
      "siblings": siblings?.map((v) => v.toMap()).toList() ?? [],
    };
  }

  factory CaseLoadModel.fromMap(Map<String, dynamic> map) {
    return CaseLoadModel(
      caseID: map['case_id'] ?? '',
      caseSerial: map['case_serial'] ?? '',
      caseReporter: map['case_reporter'] ?? '',
      ovcCpimsId: map['ovc_cpims_id'] ?? '',
      ovcFirstName: map['ovc_first_name'] ?? '',
      ovcSurname: map['ovc_surname'] ?? '',
      ovcOtherNames: map['ovc_other_names'] ?? '',
      ovcSex: map['ovc_sex'] ?? '',
      perpetratorStatus: map['perpetrator_status'] ?? '',
      perpetrators: map['perpetrators'] ?? [],
      riskLevel: map['risk_level'] ?? '',
      dateCaseOpened: map['date_case_opened'] ?? '',
      caseStatus: map['case_status'] ?? '',
      caseCategories: map['case_categories'] ?? [],
      caseRemarks: map['case_remarks'] ?? '',
      caregivers: map['caregivers'] ?? [],
      siblings: map['siblings'] ?? [],
    );
  }
}
