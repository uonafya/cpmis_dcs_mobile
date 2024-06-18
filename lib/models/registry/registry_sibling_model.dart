class RegistrySiblingModel {
  String firstName;
  String surName;
  String? otherNames;
  DateTime? dateOfBirth;
  String sex;
  String currentClass;
  String? remarks;

  RegistrySiblingModel({
    required this.firstName,
    required this.surName,
    required this.otherNames,
    required this.dateOfBirth,
    required this.sex,
    required this.currentClass,
    required this.remarks,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'surName': surName,
      'otherNames': otherNames,
      'dateOfBirth': dateOfBirth,
      'sex': sex,
      'currentClass': currentClass,
      'remarks': remarks,
    };
  }

  factory RegistrySiblingModel.fromJson(Map<String, dynamic> json) {
    return RegistrySiblingModel(
      firstName: json['firstName'],
      surName: json['surName'],
      otherNames: json['otherNames'],
      dateOfBirth: json['dateOfBirth'],
      sex: json['sex'],
      currentClass: json['currentClass'],
      remarks: json['remarks'],
    );
  }
}
