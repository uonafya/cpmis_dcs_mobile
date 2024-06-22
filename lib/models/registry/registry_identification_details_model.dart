class RegistryIdentificationModel {
  String birthRegistrationNumber;
  String givenName;
  String countryOfOrigin;
  String tribe;
  String religion;

  RegistryIdentificationModel({
    required this.birthRegistrationNumber,
    required this.givenName,
    required this.countryOfOrigin,
    required this.tribe,
    required this.religion,
  });

  // Converts a RegistryIdentificationModel instance to a map for JSON encoding
  Map<String, String> toJson() {
    return {
      'birthRegistrationNumber': birthRegistrationNumber,
      'givenName': givenName,
      'countryOfOrigin': countryOfOrigin,
      'tribe': tribe,
      'religion': mapReligionOutcome(religion),
    };
  }

  // Creates a RegistryIdentificationModel instance from a map (e.g., decoded JSON)
  factory RegistryIdentificationModel.fromJson(Map<String, dynamic> json) {
    return RegistryIdentificationModel(
      birthRegistrationNumber: json['birthRegistrationNumber'] ?? "",
      givenName: json['givenName'] ?? "",
      countryOfOrigin: json['countryOfOrigin'] ?? "",
      tribe: json['tribe'] ?? "",
      religion: json['religion'] ?? "",
    );
  }

  void clear() {
    birthRegistrationNumber = "";
    givenName = "";
    countryOfOrigin = "";
    tribe = "";
    religion = "";
  }

  bool isComplete() {
    return true;
  }

  String mapReligionOutcome(String outcome) {
    final Map<String, String> religionOutcomeMap = {
      "Christian": "RECH",
      "Muslim": "REMU",
      "Buddhist": "REBU",
      "Atheist": "REAT",
      "Other": "REOT"
    };

    return religionOutcomeMap[outcome] ?? "RECH";
  }
}
