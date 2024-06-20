class RegistryCaregiverModel {
  String id;
  String firstName;
  String surName;
  String? otherNames;
  DateTime? dateOfBirth;
  String sex;
  String relationshipToChild;
  String nationalIdNumber;
  String? phoneNumber;
  bool isRegistered;

  RegistryCaregiverModel({
    required this.id,
    required this.firstName,
    required this.surName,
    this.otherNames,
    required this.dateOfBirth,
    required this.sex,
    required this.relationshipToChild,
    required this.nationalIdNumber,
    this.phoneNumber,
    this.isRegistered = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'surName': surName,
      'otherNames': otherNames,
      'dateOfBirth': dateOfBirth,
      'sex': sex,
      'relationshipToChild': relationshipToChild,
      'nationalIdNumber': nationalIdNumber,
      'phoneNumber': phoneNumber,
      'isRegistered': isRegistered ? true : false,
    };
  }

  factory RegistryCaregiverModel.fromJson(Map<String, dynamic> json) {
    return RegistryCaregiverModel(
      id: json['id'],
      firstName: json['firstName'],
      surName: json['surName'],
      otherNames: json['otherNames'],
      dateOfBirth: json['dateOfBirth'],
      sex: json['sex'],
      relationshipToChild: json['relationshipToChild'],
      nationalIdNumber: json['nationalIdNumber'],
      phoneNumber: json['phoneNumber'],
      isRegistered: json['isRegistered'] == true,
    );
  }

  void clear() {
    id = "";
    firstName = "";
    surName = "";
    otherNames = null;
    dateOfBirth = null;
    sex = "";
    relationshipToChild = "";
    nationalIdNumber = "";
    phoneNumber = null;
    isRegistered = false;
  }
}
