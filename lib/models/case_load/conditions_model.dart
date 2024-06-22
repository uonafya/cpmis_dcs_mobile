class ConditionsModel {
  String? id;
  List<dynamic>? subConditions;

  ConditionsModel({
    this.id,
    this.subConditions,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id ?? '',
      "sub_conditions": subConditions ?? '',
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? '';
    data['sub_conditions'] = subConditions ?? '';
    return data;
  }

  factory ConditionsModel.fromJson(Map<String, dynamic> map) {
    return ConditionsModel(
      id: map['id'].toString(),
      subConditions: map['sub_conditions'],
    );
  }

  ConditionsModel copyWith({
    String? id,
    List<dynamic>? subConditions,
  }) {
    return ConditionsModel(
      id: id ?? '',
      subConditions: subConditions ?? [],
    );
  }
}
