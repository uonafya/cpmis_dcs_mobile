class RegisterNewChildModel {
  String personType;
  bool isCaregiver;
  bool childOVCProgram;
  String firstName;
  String surname;
  String? otherNames;
  String sex;
  String dateOfBirth;
  String workforceIdName;
  String datePaperFormFilled;

  RegisterNewChildModel({
    required this.personType,
    required this.isCaregiver,
    required this.childOVCProgram,
    required this.firstName,
    required this.surname,
    this.otherNames,
    required this.sex,
    required this.dateOfBirth,
    required this.workforceIdName,
    required this.datePaperFormFilled,
  });

  // Converts a RegisterNewChildModel instance to a map for JSON encoding
  Map<String, dynamic> toJson() {
    return {
      'personType': personType,
      'isCaregiver': isCaregiver,
      'providesServicesToChildren': childOVCProgram,
      'firstName': firstName,
      'surname': surname,
      'otherNames': otherNames,
      'sex': sex,
      'dateOfBirth': dateOfBirth,
      'workforceIdName': workforceIdName,
      'datePaperFormFilled': datePaperFormFilled,
    };
  }

  // Creates a RegisterNewChildModel instance from a map (e.g., decoded JSON)
  factory RegisterNewChildModel.fromJson(Map<String, dynamic> json) {
    return RegisterNewChildModel(
      personType: json['personType'],
      isCaregiver: json['isCaregiver'],
      childOVCProgram: json['providesServicesToChildren'],
      firstName: json['firstName'],
      surname: json['surname'],
      otherNames: json['otherNames'],
      sex: json['sex'],
      dateOfBirth: json['dateOfBirth'],
      workforceIdName: json['workforceIdName'],
      datePaperFormFilled: json['datePaperFormFilled'],
    );
  }
}
