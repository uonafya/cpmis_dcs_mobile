class OrganizationUnit {
  final int? id;
  final String? name;
  final bool? primaryUnit;
  final String? type;

  const OrganizationUnit({
    required this.id,
    required this.name,
    required this.primaryUnit,
    required this.type
  });

  factory OrganizationUnit.fromJSON(Map<String, dynamic> json) {
    var id = json['org_unit_id'];
    var name = json['org_unit_name'];
    var primaryUnit = json['primary_unit'];
    var type = json['org_unit_type'];

    return OrganizationUnit(id: id, name: name, primaryUnit: primaryUnit, type: type);
  }

  @override
  String toString() {
    return "id: $id; name: $name; primaryUnit: $primaryUnit; type: $type";
  }
}