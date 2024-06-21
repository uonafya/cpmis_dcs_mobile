class CourtSessionModel {
  String? caseId;
  String? formId;
  String? courtSessionCase;
  String? courtSessionType;
  String? dateOfCourtEvent;
  String? courtNotes;
  String? nextHearingDate;
  String? nextMentionDate;
  String? pleaTaken;
  String? applicationOutcome;
  String? courtOutcome;
  List<String>? courtOrder;

  CourtSessionModel({
    this.caseId,
    this.formId,
    this.courtSessionCase,
    this.courtSessionType,
    this.dateOfCourtEvent,
    this.courtNotes,
    this.nextHearingDate,
    this.nextMentionDate,
    this.pleaTaken,
    this.applicationOutcome,
    this.courtOutcome,
    this.courtOrder,
  });

  factory CourtSessionModel.fromJson(Map<String, dynamic> json) {
    return CourtSessionModel(
      caseId: json['case_id'],
      formId: json['form_id'],
      courtSessionCase: json['court_session_case'],
      courtSessionType: json['court_session_type'],
      dateOfCourtEvent: json['date_of_court_event'],
      courtNotes: json['court_notes'],
      nextHearingDate: json['next_hearing_date'],
      nextMentionDate: json['next_mention_date'],
      pleaTaken: json['plea_taken'],
      applicationOutcome: json['application_outcome'],
      courtOutcome: json['court_outcome'],
      courtOrder: json['court_order'] is List
          ? List<String>.from(json['court_order'])
          : json['court_order']?.split(','),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['case_id'] = caseId;
    data['form_id'] = formId;
    data['court_session_case'] = courtSessionCase;
    data['court_session_type'] = courtSessionType;
    data['date_of_court_event'] = dateOfCourtEvent;
    data['court_notes'] = courtNotes;
    data['next_hearing_date'] = nextHearingDate;
    data['next_mention_date'] = nextMentionDate;
    data['plea_taken'] = pleaTaken;
    data['application_outcome'] = applicationOutcome;
    data['court_outcome'] = courtOutcome;
    data['court_order'] = courtOrder?.join(',');
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'case_id': caseId,
      'form_id': formId,
      'court_session_case': courtSessionCase,
      'court_session_type': courtSessionType,
      'date_of_court_event': dateOfCourtEvent,
      'court_notes': courtNotes,
      'next_hearing_date': nextHearingDate,
      'next_mention_date': nextMentionDate,
      'plea_taken': pleaTaken,
      'application_outcome': applicationOutcome,
      'court_outcome': courtOutcome,
      'court_order': courtOrder?.join(','),
    };
  }
}
