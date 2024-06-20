class NameID {
  final String name;
  final String id;

  const NameID({
    required this.name,
    required this.id
  });

  @override
  String toString() {
    return "name: $name; id: $id";
  }
}