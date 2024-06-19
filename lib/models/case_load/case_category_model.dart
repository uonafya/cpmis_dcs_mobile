class CaseCategoryModel {
  final String caseCategory;
  final String dateOfEvent;
  final String placeOfEvent;
  final String caseNature;

  CaseCategoryModel({
    required this.caseCategory,
    required this.dateOfEvent,
    required this.placeOfEvent,
    required this.caseNature,
  });

  Map<String, dynamic> toMap() {
    return {
      "case_category": caseCategory,
      "date_of_event": dateOfEvent,
      "place_of_event": placeOfEvent,
      "case_nature": caseNature,
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['case_category'] = caseCategory;
    data['date_of_event'] = dateOfEvent;
    data['place_of_event'] = placeOfEvent;
    data['case_nature'] = caseNature;
    return data;
  }

  factory CaseCategoryModel.fromJson(Map<String, dynamic> map) {
    return CaseCategoryModel(
      caseCategory: map['case_category'],
      dateOfEvent: map['date_of_event'],
      placeOfEvent: map['place_of_event'],
      caseNature: map['case_nature'],
    );
  }

  CaseCategoryModel copyWith({
    String? caseCategory,
    String? dateOfEvent,
    String? placeOfEvent,
    String? caseNature,
  }) {
    return CaseCategoryModel(
      caseCategory: caseCategory ?? '',
      dateOfEvent: dateOfEvent ?? '',
      placeOfEvent: placeOfEvent ?? '',
      caseNature: caseNature ?? '',
    );
  }
}
