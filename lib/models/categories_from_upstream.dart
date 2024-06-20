class CategoriesFromUpstream {
  final String? id;
  final String? description;
  final String? subCategory;
  final int? order;

  const CategoriesFromUpstream({
    required this.id,
    required this.description,
    required this.subCategory,
    required this.order,
  });

  factory CategoriesFromUpstream.fromJSON(Map<String, dynamic> json) {
    var id = json['item_id'];
    var description = json['item_description'];
    var subCategory = json['item_sub_category'];
    var order = json['the_order'];

    return CategoriesFromUpstream(
      id: id,
      description: description,
      subCategory: subCategory,
      order: order);
  }

  @override
  String toString() {
    return "id: $id ; description: $description, subcategory: $subCategory, order: $order";
  }
}
