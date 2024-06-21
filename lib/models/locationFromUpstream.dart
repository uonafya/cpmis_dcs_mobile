class LocationFromUpstream {
  final int id;
  final String areaType;
  final String areaCode;
  final String areaName;
  final int? parent;

  const LocationFromUpstream({
    required this.id,
    required this.areaType,
    required this.areaCode,
    required this.areaName,
    required this.parent
  });

  factory LocationFromUpstream.fromJSON(Map<String, dynamic> json) {
    var id = json['area_id'];
    String areaType = json['area_type_id'];
    String areaCode = json['area_code'];
    String areaName = json['area_name'];
    int? parent = json['parent_area_id'];

    return LocationFromUpstream(id: id, areaType: areaType, areaCode: areaCode, areaName: areaName, parent: parent);
  }

  @override
  String toString() {
    return "id: $id ; type: $areaType, code: $areaCode, name: $areaName, parent: $parent";
  }
}