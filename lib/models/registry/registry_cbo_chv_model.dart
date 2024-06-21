class RegistryCboChvModel {
  String cboParentUnit;
  String ovcProgramEnrollment;
  String chv;

  RegistryCboChvModel({
    required this.cboParentUnit,
    required this.ovcProgramEnrollment,
    required this.chv,
  });

  // Converts a RegistryContactDetailsModel instance to a map for JSON encoding
  Map<String, String> toJson() {
    return {
      'cboParentUnit': cboParentUnit,
      'ovcProgramEnrollment': ovcProgramEnrollment,
      'chv': chv,
    };
  }

  // Creates a RegistryContactDetailsModel instance from a map (e.g. decoded JSON)
  factory RegistryCboChvModel.fromJson(Map<String, dynamic> json) {
    return RegistryCboChvModel(
      cboParentUnit: json['cboParentUnit'] ?? "",
      ovcProgramEnrollment: json['ovcProgramEnrollment'] ?? "",
      chv: json['chv'] ?? "",
    );
  }

  void clear() {
    cboParentUnit = "";
    ovcProgramEnrollment = "";
    chv = "";
  }
}
