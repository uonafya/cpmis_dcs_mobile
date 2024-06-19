class CourtSummonsModel {
  String? honoured;
  String? honouredDate;
  String? summonDate;
  String? summonNote;
  String? caseId;

  CourtSummonsModel(
      {this.honoured,
      this.honouredDate,
      this.summonDate,
      this.summonNote,
      this.caseId});

  CourtSummonsModel.fromJson(Map<String, dynamic> json) {
    honoured = json['honoured'];
    honouredDate = json['honoured_date'];
    summonDate = json['summon_date'];
    summonNote = json['summon_note'];
    caseId = json['case_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['honoured'] = this.honoured;
    data['honoured_date'] = this.honouredDate;
    data['summon_date'] = this.summonDate;
    data['summon_note'] = this.summonNote;
    data['case_id'] = this.caseId;
    return data;
  }
}
