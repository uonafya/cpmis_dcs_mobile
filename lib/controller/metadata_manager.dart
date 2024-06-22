import 'package:cpims_dcs_mobile/core/network/metadata.dart';
import 'package:get/get.dart';

import '../models/nameid.dart';

class MetadataManager {

  MetadataManager._privateConstructor();


  static MetadataManager? _instance;

  final Map<String, String> _sex = {};
  final Map<String, String> _category = {};
  final Map<String, String> _reporter = {};
  final Map<String, String> _areaType = {};
  final Map<String, String> _religion = {};
  final Map<String, String> _tribe = {};

  Map<String, String> get sex => _sex;
  Map<String, String> get category => _category;
  Map<String, String> get reporter => _reporter;
  Map<String, String> get areaType => _areaType;
  Map<String, String> get religion => _religion;
  Map<String, String> get tribe => _tribe;

  List<String> get sexNames => _sex.keys.toList();
  List<String> get categoryNames => _category.keys.toList();
  List<String> get reporterNames => _reporter.keys.toList();
  List<String> get areaTypeNames => _areaType.keys.toList();
  List<String> get religionNames => _religion.keys.toList();
  List<String> get tribeNames => _tribe.keys.toList();


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
    _loadCategoryMetaData();
    _loadReporterMetaData();
    _loadAreaTypeMetaData();
    _loadReligionMetaData();
    _loadTribeMetaData();
  }

  Future<void> _loadSexMetaData() async {
    List<NameID> sexMetadata = await getMetadata(MetadataTypes.sex);
    _sex.clear();
    _sex.addAll({for (var e in sexMetadata) e.name : e.id});
  }

  Future<void> _loadCategoryMetaData() async {
    List<NameID> categoryMetadata = await getMetadata(MetadataTypes.category);
    _category.clear();
    _category.addAll({for (var e in categoryMetadata) e.name : e.id});
  }

  Future<void> _loadReporterMetaData() async {
    List<NameID> reporterMetadata = await getMetadata(MetadataTypes.reporter);
    _reporter.clear();
    _reporter.addAll({for (var e in reporterMetadata) e.name : e.id});
  }

  Future<void> _loadAreaTypeMetaData() async {
    List<NameID> areaTypeMetadata = await getMetadata(MetadataTypes.areaType);
    _areaType.clear();
    _areaType.addAll({for (var e in areaTypeMetadata) e.name : e.id});
  }

  Future<void> _loadReligionMetaData() async {
    List<NameID> religionMetadata = await getMetadata(MetadataTypes.religion);
    _religion.clear();
    _religion.addAll({for (var e in religionMetadata) e.name : e.id});
  }

  Future<void> _loadTribeMetaData() async {
    List<NameID> tribeMetadata = await getMetadata(MetadataTypes.tribe);
    _tribe.clear();
    _tribe.addAll({for (var e in tribeMetadata) e.name : e.id});
  }


}