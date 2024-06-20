class SocialInquiryFormModel {
  String? caseRecommendation;
  String? caseHistory;
  String? caseObservation;
  String? subCountyChildrenOffice;
  String? officerName;
  String? officerPhone;
  String? dateOfSocialInquiry;
  String? formId;
  String? caseId;

  SocialInquiryFormModel(
      {this.caseRecommendation,
      this.caseHistory,
      this.caseObservation,
      this.subCountyChildrenOffice,
      this.officerName,
      required this.dateOfSocialInquiry,
      required this.caseId,
      this.formId = "social_inquiry",
      this.officerPhone});

  SocialInquiryFormModel.fromJson(Map<String, dynamic> json) {
    caseRecommendation = json['case_recommendation'];
    caseHistory = json['case_history'];
    caseObservation = json['case_observation'];
    subCountyChildrenOffice = json['sub_county_children_office'];
    officerName = json['officer_name'];
    officerPhone = json['officer_phone'];
    dateOfSocialInquiry = json['date_of_social_inquiry'];
    caseId = json['case_id'];
    formId = json['form_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['case_recommendation'] = caseRecommendation;
    data['case_history'] = caseHistory;
    data['case_observation'] = caseObservation;
    data['sub_county_children_office'] = subCountyChildrenOffice;
    data['officer_name'] = officerName;
    data['officer_phone'] = officerPhone;
    data['date_of_social_inquiry'] = dateOfSocialInquiry;
    data['form_id'] = formId;
    data['case_id'] = caseId;
    return data;
  }
}
