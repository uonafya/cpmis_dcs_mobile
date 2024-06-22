class Metadata {
  final String? fieldName;
  final String? id;
  final String? description;
  final String? subCategory;
  final int? order;

  const Metadata(
      {required this.fieldName,
      required this.id,
      required this.description,
      required this.subCategory,
      required this.order});

  factory Metadata.fromJSON(Map<String, dynamic> json) {
    var fieldName = json['field_name'];
    var id = json['item_id'];
    var description = json['item_description'];
    var subCategory = json['item_sub_category'];
    var order = json['the_order'];

    return Metadata(
        fieldName: fieldName,
        id: id,
        description: description,
        subCategory: subCategory,
        order: order);
  }
}
