class CourtSessionModel {
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

  CourtSessionModel(
      {this.courtSessionCase,
      this.courtSessionType,
      this.dateOfCourtEvent,
      this.courtNotes,
      this.nextHearingDate,
      this.nextMentionDate,
      this.pleaTaken,
      this.applicationOutcome,
      this.courtOutcome,
      this.courtOrder});

  CourtSessionModel.fromJson(Map<String, dynamic> json) {
    courtSessionCase = json['court_session_case'];
    courtSessionType = json['court_session_type'];
    dateOfCourtEvent = json['date_of_court_event'];
    courtNotes = json['court_notes'];
    nextHearingDate = json['next_hearing_date'];
    nextMentionDate = json['next_mention_date'];
    pleaTaken = json['plea_taken'];
    applicationOutcome = json['application_outcome'];
    courtOutcome = json['court_outcome'];
    courtOrder = json['court_order'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['court_session_case'] = courtSessionCase;
    data['court_session_type'] = courtSessionType;
    data['date_of_court_event'] = dateOfCourtEvent;
    data['court_notes'] = courtNotes;
    data['next_hearing_date'] = nextHearingDate;
    data['next_mention_date'] = nextMentionDate;
    data['plea_taken'] = pleaTaken;
    data['application_outcome'] = applicationOutcome;
    data['court_outcome'] = courtOutcome;
    data['court_order'] = courtOrder;
    return data;
  }
}
