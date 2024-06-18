import 'package:cpims_dcs_mobile/models/case_load/caregiver_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_category_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/perpetrator_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/siblings_model.dart';

class CaseLoadModel {
  String? caseID;
  String? caseSerial;
  String? caseReporter;
  String? ovcCpimsId;
  String? ovcFirstName;
  String? ovcSurname;
  String? ovcOtherNames;
  String? ovcSex;
  String? perpetratorStatus;
  List<PerpetratorModel>? perpetrators;
  String? riskLevel;
  String? dateCaseOpened;
  String? caseStatus;
  List<CaseCategoryModel>? caseCategories;
  String? caseRemarks;
  List<CaregiverModel>? caregivers;
  List<SiblingsModel>? siblings;

  CaseLoadModel({
    this.caseID,
    this.caseSerial,
    this.caseReporter,
    this.ovcCpimsId,
    this.ovcFirstName,
    this.ovcSurname,
    this.ovcOtherNames,
    this.ovcSex,
    this.perpetratorStatus,
    this.perpetrators,
    this.riskLevel,
    this.dateCaseOpened,
    this.caseStatus,
    this.caseCategories,
    this.caseRemarks,
    this.caregivers,
    this.siblings,
  });

  CaseLoadModel.fromJson(Map<String, dynamic> json) {
    caseID = json['case_id'] ?? '';
    caseSerial = json['case_serial'] ?? '';
    caseReporter = json['case_reporter'] ?? '';
    ovcCpimsId = json['ovc_cpims_id'].toString();
    ovcFirstName = json['ovc_first_name'] ?? '';
    ovcSurname = json['ovc_surname'] ?? '';
    ovcOtherNames = json['ovc_other_names'] ?? '';
    ovcSex = json['ovc_sex'] ?? '';
    perpetratorStatus = json['perpetrator_status'] ?? '';
    if (json['perpetrators'] != null) {
      perpetrators = <PerpetratorModel>[];
      json['perpetrators'].forEach((v) {
        perpetrators!.add(PerpetratorModel.fromJson(v));
      });
    } else {
      perpetrators = [];
    }
    riskLevel = json['risk_level'] ?? '';
    dateCaseOpened = json['date_case_opened'] ?? '';
    caseStatus = json['case_status'];
    if (json['case_categories'] != null) {
      caseCategories = <CaseCategoryModel>[];
      json['case_categories'].forEach((v) {
        caseCategories!.add(CaseCategoryModel.fromJson(v));
      });
    } else {
      caseCategories = [];
    }
    caseRemarks = json['case_remarks'] ?? '';
    if (json['caregivers'] != null) {
      caregivers = <CaregiverModel>[];
      json['caregivers'].forEach((v) {
        caregivers!.add(CaregiverModel.fromJson(v));
      });
    } else {
      caregivers = [];
    }
    if (json['siblings'] != null) {
      siblings = <SiblingsModel>[];
      json['siblings'].forEach((v) {
        siblings!.add(SiblingsModel.fromJson(v));
      });
    } else {
      siblings = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
