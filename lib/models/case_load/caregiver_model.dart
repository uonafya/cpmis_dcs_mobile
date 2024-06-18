class CaregiverModel {
  final String? caregiverCpimsId;
  final String? relationshipType;
  final String? guardianPerson;
  final String? dateLinked;

  CaregiverModel({
    required this.caregiverCpimsId,
    required this.relationshipType,
    required this.guardianPerson,
    required this.dateLinked,
  });

  Map<String, dynamic> toMap() {
    return {
      "caregiver_cpims_id": caregiverCpimsId ?? '',
      "relationship_type": relationshipType ?? '',
      "guardian_person": guardianPerson ?? '',
      "date_linked": dateLinked ?? '',
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['caregiver_cpims_id'] = caregiverCpimsId ?? '';
    data['relationship_type'] = relationshipType ?? '';
    data['guardian_person'] = guardianPerson ?? '';
    data['date_linked'] = dateLinked ?? '';
    return data;
  }

  factory CaregiverModel.fromJson(Map<String, dynamic> map) {
    return CaregiverModel(
      caregiverCpimsId: map['caregiver_cpims_id'].toString(),
      relationshipType: map['relationship_type'] ?? '',
      guardianPerson: map['guardian_person'].toString(),
      dateLinked: map['date_linked'] ?? '',
    );
  }

  CaregiverModel copyWith({
    String? caregiverCpimsId,
    String? relationshipType,
    String? guardianPerson,
    String? dateLinked,
  }) {
    return CaregiverModel(
      caregiverCpimsId: caregiverCpimsId ?? '',
      relationshipType: relationshipType ?? '',
      guardianPerson: guardianPerson ?? '',
      dateLinked: relationshipType ?? '',
    );
  }
}
