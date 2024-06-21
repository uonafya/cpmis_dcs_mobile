class CourtSummonsModel {
  String? honoured;
  String? honouredDate;
  String? summonDate;
  String? summonNote;
  String? caseId;

  CourtSummonsModel({
    this.honoured,
    this.honouredDate,
    this.summonDate,
    this.summonNote,
    this.caseId,
  });

  CourtSummonsModel.fromJson(Map<String, dynamic> json) {
    honoured = json['honoured'];
    honouredDate = json['honoured_date'];
    summonDate = json['summon_date'];
    summonNote = json['summon_note'];
    caseId = json['case_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['honoured'] = honoured;
    data['honoured_date'] = honouredDate;
    data['summon_date'] = summonDate;
    data['summon_note'] = summonNote;
    data['case_id'] = caseId;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'honoured': honoured,
      'honoured_date': honouredDate,
      'summon_date': summonDate,
      'summon_note': summonNote,
      'case_id': caseId,
    };
  }
}
