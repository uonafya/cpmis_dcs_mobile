class PerpetratorModel {
  final String? firstName;
  final String? surName;
  final String? ovcOtherNames;
  final String? relationshipType;

  PerpetratorModel({
    required this.firstName,
    required this.surName,
    required this.ovcOtherNames,
    required this.relationshipType,
  });

  Map<String, dynamic> toMap() {
    return {
      "first_name": firstName ?? '',
      "surname": surName ?? '',
      "ovc_other_names": ovcOtherNames ?? '',
      "relationship_type": relationshipType ?? '',
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['surname'] = surName;
    data['ovc_other_names'] = ovcOtherNames;
    data['relationship_type'] = relationshipType;
    return data;
  }

  factory PerpetratorModel.fromJson(Map<String, dynamic> map) {
    return PerpetratorModel(
      firstName: map['first_name'] ?? '',
      surName: map['surname'] ?? '',
      ovcOtherNames: map['ovc_other_names'] ?? '',
      relationshipType: map['relationship_type'] ?? '',
    );
  }

  PerpetratorModel copyWith({
    String? firstName,
    String? surName,
    String? ovcOtherNames,
    String? relationshipType,
  }) {
    return PerpetratorModel(
      firstName: firstName ?? '',
      surName: surName ?? '',
      ovcOtherNames: ovcOtherNames ?? '',
      relationshipType: relationshipType ?? '',
    );
  }
}
