class CaregiverModel {
  final String? caregiverCpimsId;
  final String? caregiverFirstName;
  final String? caregiverSurName;
  final String? caregiverOtherNames;
  final String? caregiverSex;
  final String? caregiverDateOfBirth;
  final String? relationshipType;
  final String? dateLinked;

  CaregiverModel({
    required this.caregiverCpimsId,
    required this.caregiverFirstName,
    required this.caregiverSurName,
    required this.caregiverOtherNames,
    required this.caregiverSex,
    required this.caregiverDateOfBirth,
    required this.relationshipType,
    required this.dateLinked,
  });

  Map<String, dynamic> toMap() {
    return {
      "caregiver_cpims_id": caregiverCpimsId ?? '',
      'caregiver_first_name': caregiverFirstName ?? '',
      'caregiver_surname': caregiverSurName ?? '',
      'caregiver_other_names': caregiverOtherNames ?? '',
      'caregiver_sex': caregiverSex ?? '',
      'caregiver_dob': caregiverDateOfBirth ?? '',
      "date_linked": dateLinked ?? '',
      "relationship_type": relationshipType ?? '',
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['caregiver_cpims_id'] = caregiverCpimsId ?? '';
    data['caregiver_first_name'] = caregiverFirstName ?? '';
    data['caregiver_surname'] = caregiverSurName ?? '';
    data['caregiver_other_names'] = caregiverOtherNames ?? '';
    data['caregiver_sex'] = caregiverSex ?? '';
    data['caregiver_dob'] = caregiverDateOfBirth ?? '';
    data['date_linked'] = dateLinked ?? '';
    data['relationship_type'] = relationshipType ?? '';
    return data;
  }

  factory CaregiverModel.fromJson(Map<String, dynamic> map) {
    return CaregiverModel(
      caregiverCpimsId: map['caregiver_cpims_id'].toString(),
      caregiverFirstName: map['caregiver_first_name'] ?? '',
      caregiverSurName: map['caregiver_surname'] ?? '',
      caregiverOtherNames: map['caregiver_other_names'] ?? '',
      caregiverSex: map['caregiver_sex'] ?? '',
      caregiverDateOfBirth: map['caregiver_dob'].toString(),
      dateLinked: map['date_linked'].toString(),
      relationshipType: map['relationship_type'] ?? '',
    );
  }

  CaregiverModel copyWith({
    String? caregiverCpimsId,
    String? caregiverFirstName,
    String? caregiverSurName,
    String? caregiverOtherNames,
    String? caregiverSex,
    String? caregiverDateOfBirth,
    String? dateLinked,
    String? relationshipType,
  }) {
    return CaregiverModel(
      caregiverCpimsId: caregiverCpimsId ?? '',
      caregiverFirstName: caregiverFirstName ?? '',
      caregiverSurName: caregiverSurName ?? '',
      caregiverOtherNames: caregiverOtherNames ?? '',
      caregiverSex: caregiverSex ?? '',
      caregiverDateOfBirth: caregiverDateOfBirth ?? '',
      dateLinked: relationshipType ?? '',
      relationshipType: relationshipType ?? '',
    );
  }
}
