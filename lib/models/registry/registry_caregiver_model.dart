class RegistryCaregiverModel {
  String? id;
  String firstName;
  String surName;
  String? otherNames;
  String? dateOfBirth;
  String sex;
  String relationshipToChild;
  String nationalIdNumber;
  String? phoneNumber;

  RegistryCaregiverModel({

    this.id,
    required this.firstName,
    required this.surName,
    this.otherNames,
    required this.dateOfBirth,
    required this.sex,
    required this.relationshipToChild,
    required this.nationalIdNumber,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'surName': surName,
      'otherNames': otherNames,
      'dateOfBirth': dateOfBirth,
      'sex': sex,
      'relationshipToChild': mapRelationshipToChild(relationshipToChild),
      'nationalIdNumber': nationalIdNumber,
      'phoneNumber': phoneNumber,
    };
  }

  factory RegistryCaregiverModel.fromJson(Map<String, dynamic> json) {
    return RegistryCaregiverModel(
      firstName: json['firstName'],
      surName: json['surName'],
      otherNames: json['otherNames'],
      dateOfBirth: json['dateOfBirth'],
      sex: json['sex'],
      relationshipToChild: json['relationshipToChild'],
      nationalIdNumber: json['nationalIdNumber'],
      phoneNumber: json['phoneNumber'],
    );
  }

  void clear() {
    firstName = "";
    surName = "";
    otherNames = null;
    dateOfBirth = null;
    sex = "";
    relationshipToChild = "";
    nationalIdNumber = "";
    phoneNumber = null;
  }

  String mapRelationshipToChild(String outcome) {
    final Map<String, String> relationshipOutcome = {
      "None": "CGNN",
      "Adoptive father": "CGAF",
      "Adoptive mother": "CGAM",
      "Foster father": "CGFF",
      "Foster mother": "CGFM",
      "Other relative": "CGOR",
      "Parent (Father)": "CGPF",
      "Parent (Mother)": "CGPM",
      "Guardian": "CGGU",
      "Next of Kin": "CGNK",
      "Other": "CGOT"
    };

    return relationshipOutcome[outcome] ?? "CGNN";
  }
}
