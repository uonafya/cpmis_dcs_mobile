class ReferralModel {
  String? caseId;
  String? caseCategory;
  String? referralActor;
  String? specifiedReferral;
  String? referralFor;

  ReferralModel({
    this.caseId,
    this.caseCategory,
    this.referralActor,
    this.specifiedReferral,
    this.referralFor,
  });

  ReferralModel.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    caseCategory = json['case_category'];
    referralActor = json['referral_actor'];
    specifiedReferral = json['specified_referral'];
    referralFor = json['referral_for'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['case_id'] = this.caseId;
    data['case_category'] = this.caseCategory;
    data['referral_actor'] = this.referralActor;
    data['specified_referral'] = this.specifiedReferral;
    data['referral_for'] = this.referralFor;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'case_id': caseId,
      'case_category': caseCategory,
      'referral_actor': referralActor,
      'specified_referral': specifiedReferral,
      'referral_for': referralFor,
    };
  }
}