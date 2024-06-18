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
  Map<String, dynamic> toJson() {
    return {
      'county': county,
      'subCounty': subCounty,
      'ward': ward,
    };
  }

  // Creates a RegistryLocationModel instance from a map (e.g. decoded JSON)
  factory RegistryLocationModel.fromJson(Map<String, String> json) {
    return RegistryLocationModel(
      county: json['county'].toString(),
      subCounty: json['subCounty'].toString(),
      ward: json['ward'].toString(),
    );
  }
}
