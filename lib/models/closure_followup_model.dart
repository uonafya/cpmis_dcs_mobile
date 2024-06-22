import 'dart:convert';

class ClosureFollowupModel {
  String? caseId;
  String? formId;
  String? caseOutcome;
  String? transferedTo;
  List<InterventionList>? interventionList;
  String? caseClosureNotes;
  String? dateOfCaseClosure;

  ClosureFollowupModel({
    this.caseId,
    this.formId,
    this.caseOutcome,
    this.transferedTo,
    this.interventionList,
    this.caseClosureNotes,
    this.dateOfCaseClosure,
  });

  ClosureFollowupModel.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    formId = json['form_id'];
    caseOutcome = json['case_outcome'];
    transferedTo = json['transfered_to'];
    if (json['intervention_list'] != null) {
      interventionList = <InterventionList>[];
      if (json['intervention_list'] is String) {
        // If it's a string, parse it as JSON
        List<dynamic> list = jsonDecode(json['intervention_list']);
        for (var v in list) {
          interventionList!.add(InterventionList.fromJson(v));
        }
      } else if (json['intervention_list'] is List) {
        json['intervention_list'].forEach((v) {
          interventionList!.add(InterventionList.fromJson(v));
        });
      }
    }
    caseClosureNotes = json['case_closure_notes'];
    dateOfCaseClosure = json['date_of_case_closure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['case_id'] = caseId;
    data['form_id'] = formId;
    data['case_outcome'] = caseOutcome;
    data['transfered_to'] = transferedTo;
    if (interventionList != null) {
      data['intervention_list'] =
          interventionList!.map((v) => v.toJson()).toList();
    }
    data['case_closure_notes'] = caseClosureNotes;
    data['date_of_case_closure'] = dateOfCaseClosure;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'case_id': caseId,
      'form_id': formId,
      'case_outcome': caseOutcome,
      'transfered_to': transferedTo,
      'intervention_list':
          interventionList?.map((e) => e.toMap()).toList() ?? [],
      'case_closure_notes': caseClosureNotes,
      'date_of_case_closure': dateOfCaseClosure,
    };
  }
}

class InterventionList {
  String? intervention;
  String? caseCategory;

  InterventionList({this.intervention, this.caseCategory});

  InterventionList.fromJson(Map<String, dynamic> json) {
    intervention = json['intervention'];
    caseCategory = json['case_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['intervention'] = intervention;
    data['case_category'] = caseCategory;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'intervention': intervention,
      'case_category': caseCategory,
    };
  }
}