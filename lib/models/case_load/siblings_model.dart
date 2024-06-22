class SiblingsModel {
  final String? siblingCpimsId;
  final String? siblingFirstName;
  final String? siblingSurName;
  final String? siblingOtherName;
  final String? siblingSex;
  final String? siblingDoB;
  final String? siblingDateLinked;

  SiblingsModel({
    required this.siblingCpimsId,
    required this.siblingFirstName,
    required this.siblingSurName,
    required this.siblingOtherName,
    required this.siblingSex,
    required this.siblingDoB,
    required this.siblingDateLinked,
  });

  Map<String, dynamic> toMap() {
    return {
      "sibling_cpims_id": siblingCpimsId ?? '',
      "sibling_first_name": siblingFirstName ?? '',
      "sibling_surname": siblingSurName ?? '',
      "sibling_other_names": siblingOtherName ?? '',
      "sibling_sex": siblingSex ?? '',
      "sibling_dob": siblingDoB.toString(),
      "date_linked": siblingDateLinked ?? '',
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sibling_cpims_id'] = siblingCpimsId ?? '';
    data['sibling_first_name'] = siblingFirstName ?? '';
    data['sibling_surname'] = siblingSurName ?? '';
    data['sibling_other_names'] = siblingOtherName ?? '';
    data['sibling_sex'] = siblingSex ?? '';
    data['sibling_dob'] = siblingDoB.toString();
    data['date_linked'] = siblingDateLinked ?? '';
    return data;
  }

  factory SiblingsModel.fromJson(Map<String, dynamic> map) {
    return SiblingsModel(
      siblingCpimsId: map['sibling_cpims_id'].toString(),
      siblingFirstName: map['sibling_first_name'].toString(),
      siblingSurName: map['sibling_surname'] ?? '',
      siblingOtherName: map['sibling_other_names'] ?? '',
      siblingSex: map['sibling_sex'] ?? '',
      siblingDoB: map['sibling_dob'].toString(),
      siblingDateLinked: map['date_linked'].toString(),
    );
  }

  SiblingsModel copyWith({
    String? siblingCpimsId,
    String? siblingFirstName,
    String? siblingSurName,
    String? siblingOtherName,
    String? siblingSex,
    String? siblingDoB,
    String? siblingDateLinked,
  }) {
    return SiblingsModel(
      siblingCpimsId: siblingCpimsId ?? '',
      siblingFirstName: siblingFirstName ?? '',
      siblingSurName: siblingSurName ?? '',
      siblingOtherName: siblingOtherName ?? '',
      siblingSex: siblingSex ?? '',
      siblingDoB: siblingDoB ?? '',
      siblingDateLinked: siblingDateLinked ?? '',
    );
  }
}
