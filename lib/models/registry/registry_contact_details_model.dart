class RegistryContactDetailsModel {
  String designatedPhoneNumber;
  String otherMobileNumber;
  String emailAddress;
  String physicalLocation;

  RegistryContactDetailsModel({
    required this.designatedPhoneNumber,
    required this.otherMobileNumber,
    required this.emailAddress,
    required this.physicalLocation,
  });

  // Converts a RegistryContactDetailsModel instance to a map for JSON encoding
  Map<String, String> toJson() {
    return {
      'designatedPhoneNumber': designatedPhoneNumber,
      'otherMobileNumber': otherMobileNumber,
      'emailAddress': emailAddress,
      'physicalLocation': physicalLocation,
    };
  }

  // Creates a RegistryContactDetailsModel instance from a map (e.g. decoded JSON)
  factory RegistryContactDetailsModel.fromJson(Map<String, String> json) {
    return RegistryContactDetailsModel(
      designatedPhoneNumber: json['designatedPhoneNumber'] ?? "",
      otherMobileNumber: json['otherMobileNumber'] ?? "",
      emailAddress: json['emailAddress'] ?? "",
      physicalLocation: json['physicalLocation'] ?? "",
    );
  }
}
