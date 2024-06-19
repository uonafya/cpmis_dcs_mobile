class RegistryLocationModel {
  String county;
  String subCounty;
  String ward;

  RegistryLocationModel({
    required this.county,
    required this.subCounty,
    required this.ward,
  });

  // Converts a RegistryLocationModel instance to a map for JSON encoding
  Map<String, String> toJson() {
    return {
      'county': county,
      'subCounty': subCounty,
      'ward': ward,
    };
  }

  // Creates a RegistryLocationModel instance from a map (e.g. decoded JSON)
  factory RegistryLocationModel.fromJson(Map<String, dynamic> json) {
    return RegistryLocationModel(
      county: json['county'],
      subCounty: json['subCounty'],
      ward: json['ward'],
    );
  }
}
