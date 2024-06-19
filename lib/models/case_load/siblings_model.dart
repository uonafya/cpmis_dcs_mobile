class SiblingsModel {
  final String? id;
  final String? childPersonId;
  final String? siblingPersonId;
  final String? dateLinked;
  final String? dateDelinked;
  final String? remarks;
  final bool? isVoid;

  SiblingsModel({
    required this.id,
    required this.childPersonId,
    required this.siblingPersonId,
    required this.dateLinked,
    required this.dateDelinked,
    required this.remarks,
    required this.isVoid,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id ?? '',
      "child_person_id": childPersonId ?? '',
      "sibling_person_id": siblingPersonId ?? '',
      "date_linked": dateLinked ?? '',
      "date_delinked": dateDelinked ?? '',
      "remarks": remarks ?? '',
      "is_void": (isVoid ?? false) ? 1 : 0,
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? '';
    data['child_person_id'] = childPersonId ?? '';
    data['sibling_person_id'] = siblingPersonId ?? '';
    data['date_linked'] = dateLinked ?? '';
    data['date_delinked'] = dateDelinked ?? '';
    data['remarks'] = remarks ?? '';
    data['is_void'] = isVoid ?? false;
    return data;
  }

  factory SiblingsModel.fromJson(Map<String, dynamic> map) {
    return SiblingsModel(
      id: map['id'].toString(),
      childPersonId: map['child_person_id'].toString(),
      siblingPersonId: map['sibling_person_id'].toString(),
      dateLinked: map['date_linked'] ?? '',
      dateDelinked: map['date_delinked'] ?? '',
      remarks: map['remarks'] ?? '',
      isVoid: map['is_void'] ?? false,
    );
  }

  SiblingsModel copyWith({
    String? id,
    String? childPersonId,
    String? siblingPersonId,
    String? dateLinked,
    String? dateDelinked,
    String? remarks,
    bool? isVoid,
  }) {
    return SiblingsModel(
      id: id ?? '',
      childPersonId: childPersonId ?? '',
      siblingPersonId: siblingPersonId ?? '',
      dateLinked: dateLinked ?? '',
      dateDelinked: dateDelinked ?? '',
      remarks: remarks ?? '',
      isVoid: isVoid ?? false,
    );
  }
}
