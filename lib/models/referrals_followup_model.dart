class ReferralModel {
  String? caseId;
  String? formId;
  String? caseCategory;
  String? referralActor;
  String? specifiedReferral;
  String? referralFor;

  ReferralModel({
    this.caseId,
    this.formId,
    this.caseCategory,
    this.referralActor,
    this.specifiedReferral,
    this.referralFor,
  });

  ReferralModel.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    formId = json['form_id'];
    caseCategory = json['case_category'];
    referralActor = json['referral_actor'];
    specifiedReferral = json['specified_referral'];
    referralFor = json['referral_for'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['case_id'] = caseId;
    data['form_id'] = formId;
    data['case_category'] = caseCategory;
    data['referral_actor'] = referralActor;
    data['specified_referral'] = specifiedReferral;
    data['referral_for'] = referralFor;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'case_id': caseId,
      'form_id': formId,
      'case_category': caseCategory,
      'referral_actor': referralActor,
      'specified_referral': specifiedReferral,
      'referral_for': referralFor,
    };
  }
}