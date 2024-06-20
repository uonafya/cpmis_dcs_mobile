class ClosureFollowupModel {
  String? caseId;
  String? caseOutcome;
  String? transferedTo;
  List<InterventionList>? interventionList;
  String? caseClosureNotes;
  String? dateOfCaseClosure;

  ClosureFollowupModel(
      {this.caseId,
      this.caseOutcome,
      this.transferedTo,
      this.interventionList,
      this.caseClosureNotes,
      this.dateOfCaseClosure});

  ClosureFollowupModel.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    caseOutcome = json['case_outcome'];
    transferedTo = json['transfered_to'];
    if (json['intervention_list'] != null) {
      interventionList = <InterventionList>[];
      json['intervention_list'].forEach((v) {
        interventionList!.add(new InterventionList.fromJson(v));
      });
    }
    caseClosureNotes = json['case_closure_notes'];
    dateOfCaseClosure = json['date_of_case_closure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['case_id'] = this.caseId;
    data['case_outcome'] = this.caseOutcome;
    data['transfered_to'] = this.transferedTo;
    if (this.interventionList != null) {
      data['intervention_list'] =
          this.interventionList!.map((v) => v.toJson()).toList();
    }
    data['case_closure_notes'] = this.caseClosureNotes;
    data['date_of_case_closure'] = this.dateOfCaseClosure;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'case_id': caseId,
      'case_outcome': caseOutcome,
      'transfered_to': transferedTo,
      'intervention_list': interventionList?.map((e) => e.toMap()).toList() ?? [],
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intervention'] = this.intervention;
    data['case_category'] = this.caseCategory;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'intervention': intervention,
      'case_category': caseCategory,
    };
  }
}
