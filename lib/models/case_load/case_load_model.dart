import 'package:cpims_dcs_mobile/models/case_load/caregiver_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_category_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/event_model.dart';
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
  String? ovcDoB;
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
  List<dynamic>? householdEconomicStatus;
  List<dynamic>? mentalCondition;
  List<dynamic>? physicalCondition;
  List<dynamic>? otherCondition;
  List<dynamic>? immediateNeeds;
  List<dynamic>? futureNeeds;
  List<dynamic>? friends;
  List<dynamic>? hobbies;
  List<EventModel>? events;

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
    this.ovcDoB,
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
    this.events,
  });

  CaseLoadModel.fromJson(Map<String, dynamic> json) {
    orgUnitName = json['org_unit_name'] ?? '';
    orgUnitId = json['org_unit_id'].toString();
    reportSubCountyName = json['report_subcounty_name'] ?? '';
    reportSubCountyId = json['report_subcounty_id'].toString();
    occurrenceCountyName = json['occurence_county_name'] ?? '';
    occurrenceCountyId = json['occurence_county_id'].toString();
    occurrenceSubCountyName = json['occurence_subcounty_name'] ?? '';
    occurrenceSubCountyId = json['occurence_subcounty_id'].toString();
    occurrenceWardName = json['occurence_ward'].toString();
    occurrenceVillageName = json['occurence_village'] ?? '';
    caseID = json['case_id'].toString();
    caseSerial = json['case_serial'].toString();
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
    ovcDoB = json['ovc_dob'].toString();
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
    dateCaseOpened = json['date_case_opened'].toString();
    caseReporterfirstName = json['case_reporter_first_name'] ?? '';
    caseReporterOtherNames = json['case_reporter_other_names'] ?? '';
    caseReporterSurName = json['case_reporter_surname'] ?? '';
    caseReporterContacts = json['case_reporter_contacts'].toString();
    caseReporter = json['case_reporter'] ?? '';
    courtName = json['court_name'] ?? '';
    courtNumber = json['court_number'] ?? '';
    policeStationName = json['police_station'] ?? '';
    obNumber = json['ob_number'] ?? '';
    caseStatus = json['case_status'];
    referralPresent = json['referral_present'] ?? '';
    timeStampCreated = json['timestamp_created'] ?? '';
    createdBy = json['created_by'].toString();
    personId = json['person_id'].toString();
    caseRemarks = json['case_remarks'] ?? '';
    dateOfSummon = json['date_of_summon'] ?? '';
    summonStatus = json['summon_status'] ?? false;
    householdEconomicStatus = json['household_economic_status'] ?? [];
    mentalCondition = json['mental_condition'] ?? [];
    physicalCondition = json['physical_condition'] ?? [];
    otherCondition = json['other_condition'] ?? [];
    immediateNeeds = json['immediate_needs'] ?? [];
    futureNeeds = json['future_needs'] ?? [];
    friends = json['friends'] ?? [];
    hobbies = json['hobbies'] ?? [];
    events = json['events'] != null
        ? List<EventModel>.from(
            json['events'].map((x) => EventModel.fromJson(x)),
          )
        : [];
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
    data['perpetrator_status'] = perpetratorStatus;
    if (perpetrators != null) {
      data['perpetrators'] = perpetrators!.map((v) => v.toJson()).toList();
    }
    data['ovc_cpims_id'] = ovcCpimsId;
    data['ovc_first_name'] = ovcFirstName;
    data['ovc_surname'] = ovcSurname;
    data['ovc_other_names'] = ovcOtherNames;
    data['ovc_dob'] = ovcDoB;
    data['ovc_sex'] = ovcSex;
    if (siblings != null) {
      data['siblings'] = siblings!.map((v) => v.toJson()).toList();
    }
    if (caregivers != null) {
      data['caregivers'] = caregivers!.map((v) => v.toJson()).toList();
    }
    if (caseCategories != null) {
      data['case_categories'] = caseCategories!.map((v) => v.toJson()).toList();
    }
    data['risk_level'] = riskLevel;
    data['date_case_opened'] = dateCaseOpened;
    data['case_reporter_first_name'] = caseReporterfirstName;
    data['case_reporter_other_names'] = caseReporterOtherNames;
    data['case_reporter_surname'] = caseReporterSurName;
    data['case_reporter_contacts'] = caseReporterContacts;
    data['case_reporter'] = caseReporter;
    data['court_name'] = courtName;
    data['court_number'] = courtNumber;
    data['police_station'] = policeStationName;
    data['ob_number'] = obNumber;
    data['case_status'] = caseStatus;
    data['referral_present'] = referralPresent;
    data['timestamp_created'] = timeStampCreated;
    data['created_by'] = createdBy;
    data['person_id'] = personId;
    data['case_remarks'] = caseRemarks;
    data['date_of_summon'] = dateOfSummon;
    data['summon_status'] = summonStatus;
    data['household_economic_status'] = householdEconomicStatus;
    data['mental_condition'] = mentalCondition;
    data['physical_condition'] = physicalCondition;
    data['other_condition'] = otherCondition;
    data['immediate_needs'] = immediateNeeds;
    data['future_needs'] = futureNeeds;
    data['friends'] = friends;
    data['hobbies'] = hobbies;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'org_unit_name': orgUnitName ?? '',
      'org_unit_id': orgUnitId ?? '',
      'report_subcounty_name': reportSubCountyName ?? '',
      'report_subcounty_id': reportSubCountyId ?? '',
      'occurence_county_name': occurrenceCountyName ?? '',
      'occurence_county_id': occurrenceCountyId ?? '',
      'occurence_subcounty_name': occurrenceSubCountyName ?? '',
      'occurence_subcounty_id': occurrenceSubCountyId ?? '',
      'occurence_ward': occurrenceWardName ?? '',
      'occurence_village': occurrenceVillageName ?? '',
      'case_id': caseID ?? '',
      'case_serial': caseSerial ?? '',
      'perpetrator_status': perpetratorStatus ?? '',
      'perpetrators': perpetrators?.map((x) => x.toMap()).toList() ?? [],
      'ovc_cpims_id': ovcCpimsId ?? '',
      'ovc_first_name': ovcFirstName ?? '',
      'ovc_surname': ovcSurname ?? '',
      'ovc_other_names': ovcOtherNames ?? '',
      'ovc_dob': ovcDoB ?? '',
      'ovc_sex': ovcSex ?? '',
      'siblings': siblings?.map((x) => x.toMap()).toList() ?? [],
      'caregivers': caregivers?.map((x) => x.toMap()).toList() ?? [],
      'case_categories': caseCategories?.map((x) => x.toMap()).toList() ?? [],
      'risk_level': riskLevel ?? '',
      'date_case_opened': dateCaseOpened ?? '',
      'case_reporter_first_name': caseReporterfirstName ?? '',
      'case_reporter_other_names': caseReporterOtherNames ?? '',
      'case_reporter_surname': caseReporterSurName ?? '',
      'case_reporter_contacts': caseReporterContacts ?? '',
      'case_reporter': caseReporter ?? '',
      'court_name': courtName ?? '',
      'court_number': courtNumber ?? '',
      'police_station': policeStationName ?? '',
      'ob_number': obNumber ?? '',
      'case_status': caseStatus ?? '',
      'referral_present': referralPresent ?? '',
      'timestamp_created': timeStampCreated ?? '',
      'created_by': createdBy ?? '',
      'person_id': personId ?? '',
      'case_remarks': caseRemarks ?? '',
      'date_of_summon': dateOfSummon ?? '',
      'summon_status': (summonStatus ?? false) ? 1 : 0,
      'household_economic_status': householdEconomicStatus ?? [],
      'mental_condition': mentalCondition ?? [],
      'physical_condition': physicalCondition ?? [],
      'other_condition': otherCondition ?? [],
      'immediate_needs': immediateNeeds ?? [],
      'future_needs': futureNeeds ?? [],
      'friends': friends ?? [],
      'hobbies': hobbies ?? [],
    };
  }

  factory CaseLoadModel.fromMap(Map<String, dynamic> map) {
    return CaseLoadModel(
      orgUnitName: map['org_unit_name'] ?? '',
      orgUnitId: map['org_unit_id'] ?? '',
      reportSubCountyName: map['report_subcounty_name'] ?? '',
      reportSubCountyId: map['report_subcounty_id'] ?? '',
      occurrenceCountyName: map['occurence_county_name'] ?? '',
      occurrenceCountyId: map['occurence_county_id'] ?? '',
      occurrenceSubCountyName: map['occurence_subcounty_name'] ?? '',
      occurrenceSubCountyId: map['occurence_subcounty_id'] ?? '',
      occurrenceWardName: map['occurence_ward'] ?? '',
      occurrenceVillageName: map['occurence_village'] ?? '',
      caseID: map['case_id'] ?? '',
      caseSerial: map['case_serial'] ?? '',
      perpetratorStatus: map['perpetrator_status'] ?? '',
      perpetrators: map['perpetrators'] ?? [],
      ovcCpimsId: map['ovc_cpims_id'] ?? '',
      ovcFirstName: map['ovc_first_name'] ?? '',
      ovcSurname: map['ovc_surname'] ?? '',
      ovcOtherNames: map['ovc_other_names'] ?? '',
      ovcDoB: map['ovc_dob'] ?? '',
      ovcSex: map['ovc_sex'] ?? '',
      siblings: map['siblings'] ?? [],
      caregivers: map['caregivers'] ?? [],
      caseCategories: map['case_categories'] ?? [],
      riskLevel: map['risk_level'] ?? '',
      dateCaseOpened: map['date_case_opened'] ?? '',
      caseReporterfirstName: map['case_reporter_first_name'] ?? '',
      caseReporterOtherNames: map['case_reporter_other_names'] ?? '',
      caseReporterSurName: map['case_reporter_surname'] ?? '',
      caseReporterContacts: map['case_reporter_contacts'] ?? '',
      caseReporter: map['case_reporter'] ?? '',
      courtName: map['court_name'] ?? '',
      courtNumber: map['court_number'] ?? '',
      policeStationName: map['police_station'] ?? '',
      obNumber: map['ob_number'] ?? '',
      caseStatus: map['case_status'] ?? '',
      referralPresent: map['referral_present'] ?? '',
      timeStampCreated: map['timestamp_created'] ?? '',
      createdBy: map['created_by'] ?? '',
      personId: map['person_id'] ?? '',
      caseRemarks: map['case_remarks'] ?? '',
      dateOfSummon: map['date_of_summon'] ?? '',
      summonStatus: map['summon_status'] ?? '',
      householdEconomicStatus: map['household_economic_status'] ?? [],
      mentalCondition: map['mental_condition'] ?? [],
      physicalCondition: map['physical_condition'] ?? [],
      otherCondition: map['other_condition'] ?? [],
      immediateNeeds: map['immediate_needs'] ?? [],
      futureNeeds: map['future_needs'] ?? [],
      friends: map['friends'] ?? [],
      hobbies: map['hobbies'] ?? [],
    );
  }

  // copyWith method
  CaseLoadModel copyWith({
    String? orgUnitName,
    String? orgUnitId,
    String? reportSubCountyName,
    String? reportSubCountyId,
    String? occurrenceCountyName,
    String? occurrenceCountyId,
    String? occurrenceSubCountyName,
    String? occurrenceSubCountyId,
    String? occurrenceWardName,
    String? occurrenceVillageName,
    String? caseID,
    String? caseSerial,
    String? perpetratorStatus,
    List<PerpetratorModel>? perpetrators,
    String? ovcCpimsId,
    String? ovcFirstName,
    String? ovcSurname,
    String? ovcOtherNames,
    String? ovcDoB,
    String? ovcSex,
    List<SiblingsModel>? siblings,
    List<CaregiverModel>? caregivers,
    List<CaseCategoryModel>? caseCategories,
    String? riskLevel,
    String? dateCaseOpened,
    String? caseReporterfirstName,
    String? caseReporterOtherNames,
    String? caseReporterSurName,
    String? caseReporterContacts,
    String? caseReporter,
    String? courtName,
    String? courtNumber,
    String? policeStationName,
    String? obNumber,
    String? caseStatus,
    String? referralPresent,
    String? timeStampCreated,
    String? createdBy,
    String? personId,
    String? caseRemarks,
    String? dateOfSummon,
    bool? summonStatus,
    List<dynamic>? householdEconomicStatus,
    List<dynamic>? mentalCondition,
    List<dynamic>? physicalCondition,
    List<dynamic>? otherCondition,
    List<dynamic>? immediateNeeds,
    List<dynamic>? futureNeeds,
    List<dynamic>? friends,
    List<dynamic>? hobbies,
  }) {
    return CaseLoadModel(
      orgUnitName: orgUnitName ?? this.orgUnitName,
      orgUnitId: orgUnitId ?? this.orgUnitId,
      reportSubCountyName: reportSubCountyName ?? this.reportSubCountyName,
      reportSubCountyId: reportSubCountyId ?? this.reportSubCountyId,
      occurrenceCountyName: occurrenceCountyName ?? this.occurrenceCountyName,
      occurrenceCountyId: occurrenceCountyId ?? this.occurrenceCountyId,
      occurrenceSubCountyName:
          occurrenceSubCountyName ?? this.occurrenceSubCountyName,
      occurrenceSubCountyId:
          occurrenceSubCountyId ?? this.occurrenceSubCountyId,
      occurrenceWardName: occurrenceWardName ?? this.occurrenceWardName,
      occurrenceVillageName:
          occurrenceVillageName ?? this.occurrenceVillageName,
      caseID: caseID ?? this.caseID,
      caseSerial: caseSerial ?? this.caseSerial,
      perpetratorStatus: perpetratorStatus ?? this.perpetratorStatus,
      perpetrators: perpetrators ?? this.perpetrators,
      ovcCpimsId: ovcCpimsId ?? this.ovcCpimsId,
      ovcFirstName: ovcFirstName ?? this.ovcFirstName,
      ovcSurname: ovcSurname ?? this.ovcSurname,
      ovcOtherNames: ovcOtherNames ?? this.ovcOtherNames,
      ovcDoB: ovcDoB ?? this.ovcDoB,
      ovcSex: ovcSex ?? this.ovcSex,
      siblings: siblings ?? this.siblings,
      caregivers: caregivers ?? this.caregivers,
      caseCategories: caseCategories ?? this.caseCategories,
      riskLevel: riskLevel ?? this.riskLevel,
      dateCaseOpened: dateCaseOpened ?? this.dateCaseOpened,
      caseReporterfirstName:
          caseReporterfirstName ?? this.caseReporterfirstName,
      caseReporterOtherNames:
          caseReporterOtherNames ?? this.caseReporterOtherNames,
      caseReporterSurName: caseReporterSurName ?? this.caseReporterSurName,
      caseReporterContacts: caseReporterContacts ?? this.caseReporterContacts,
      caseReporter: caseReporter ?? this.caseReporter,
      courtName: courtName ?? this.courtName,
      courtNumber: courtNumber ?? this.courtNumber,
      policeStationName: policeStationName ?? this.policeStationName,
      obNumber: obNumber ?? this.obNumber,
      caseStatus: caseStatus ?? this.caseStatus,
      referralPresent: referralPresent ?? this.referralPresent,
      timeStampCreated: timeStampCreated ?? this.timeStampCreated,
      createdBy: createdBy ?? this.createdBy,
      personId: personId ?? this.personId,
      caseRemarks: caseRemarks ?? this.caseRemarks,
      dateOfSummon: dateOfSummon ?? this.dateOfSummon,
      summonStatus: summonStatus ?? this.summonStatus,
      householdEconomicStatus:
          householdEconomicStatus ?? this.householdEconomicStatus,
      mentalCondition: mentalCondition ?? this.mentalCondition,
      physicalCondition: physicalCondition ?? this.physicalCondition,
      otherCondition: otherCondition ?? this.otherCondition,
      immediateNeeds: immediateNeeds ?? this.immediateNeeds,
      futureNeeds: futureNeeds ?? this.futureNeeds,
      friends: friends ?? this.friends,
      hobbies: hobbies ?? this.hobbies,
    );
  }
}
