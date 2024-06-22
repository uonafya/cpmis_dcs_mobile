import 'package:cpims_dcs_mobile/core/network/metadata.dart';
import 'package:get/get.dart';

import '../models/nameid.dart';

class MetadataManager {

  MetadataManager._privateConstructor();


  static MetadataManager? _instance;

  final List<NameID> _sex = [];

  List<NameID> get sex => _sex;

  static MetadataManager getInstance() {
    if (_instance != null) {
      return _instance!;
    }

    _instance = MetadataManager._privateConstructor();
    _instance!.loadMetaData();

    return _instance!;
  }


  Future<void> loadMetaData() async {
    _loadSexMetaData();
  }

  Future<void> _loadSexMetaData() async {
    List<NameID> sexMetadata = await getMetadata(MetadataTypes.sex);
    _sex.clear();
    _sex.addAll(sexMetadata);
  }


}