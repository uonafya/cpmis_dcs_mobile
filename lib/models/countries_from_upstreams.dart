import 'package:cpims_dcs_mobile/models/categories_from_upstream.dart';

class CountriesFromUpstreams {
  final int? id;
  final String? code;
  final String? name;

  const CountriesFromUpstreams({
    required this.id,
    required this.code,
    required this.name
  });

  factory CountriesFromUpstreams.fromJSON(Map<String, dynamic> json) {
    var id = json['id'];
    var code = json['code'];
    var name = json['name'];

    return CountriesFromUpstreams(id: id, code: code, name: name);
  }
}