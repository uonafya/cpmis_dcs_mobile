import 'package:cpims_dcs_mobile/core/network/metadata.dart';
import 'package:cpims_dcs_mobile/models/organization_unit.dart';
import 'package:get/get.dart';

import '../core/network/mobile_settings.dart';
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
  final Map<String, String> _childClass = {};
  final Map<String, String> _orgUnit = {};
  final Map<String, String> _ovcProgram = {};
  final Map<String, String> _personType = {};
  final Map<String, String> _relationshipType = {};

  Map<String, String> get sex => _sex;
  Map<String, String> get category => _category;
  Map<String, String> get reporter => _reporter;
  Map<String, String> get areaType => _areaType;
  Map<String, String> get religion => _religion;
  Map<String, String> get tribe => _tribe;
  Map<String, String> get childClass => _childClass;
  Map<String, String> get orgUnit => _orgUnit;
  Map<String, String> get ovcProgram => _ovcProgram;
  Map<String, String> get personType => _personType;
  Map<String, String> get relationshipType => _relationshipType;

  List<String> get sexNames => _sex.keys.toList();
  List<String> get categoryNames => _category.keys.toList();
  List<String> get reporterNames => _reporter.keys.toList();
  List<String> get areaTypeNames => _areaType.keys.toList();
  List<String> get religionNames => _religion.keys.toList();
  List<String> get tribeNames => _tribe.keys.toList();
  List<String> get childClassNames => _childClass.keys.toList();
  List<String> get orgUnitNames => _orgUnit.keys.toList();
  List<String> get ovcProgramNames => _ovcProgram.keys.toList();
  List<String> get personTypeNames => _personType.keys.toList();
  List<String> get relationshipTypeNames => _relationshipType.keys.toList();


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
    _loadChildClassMetaData();
    _loadOrgUnitMetaData();
    _loadOvcProgramMetaData();
    _loadPersonTypeMetaData();
    _loadRelationshipTypeMetaData();
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

  Future<void> _loadChildClassMetaData() async {
    List<NameID> childClassMetadata = await getMetadata(MetadataTypes.childClass);
    _childClass.clear();
    _childClass.addAll({for (var e in childClassMetadata) e.name : e.id});
  }

  Future<void> _loadOvcProgramMetaData() async {
    List<NameID> ovcProgramMetadata = await getMetadata(MetadataTypes.ovcProgram);
    _ovcProgram.clear();
    _ovcProgram.addAll({for (var e in ovcProgramMetadata) e.name : e.id});
  }

  Future<void> _loadPersonTypeMetaData() async {
    List<NameID> personTypeMetadata = await getMetadata(MetadataTypes.personType);
    _personType.clear();
    _personType.addAll({for (var e in personTypeMetadata) e.name : e.id});
  }


  Future<void> _loadRelationshipTypeMetaData() async {
    List<NameID> relationshipTypeMetadata = await getMetadata(MetadataTypes.relationshipType);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in relationshipTypeMetadata) e.name : e.id});
  }

  Future<void> _loadOrgUnitMetaData() async {
    List<OrganizationUnit> orgUnitMetadata = await getOrganizationalUnits(null);
    _orgUnit.clear();
    _orgUnit.addAll({for (var e in orgUnitMetadata) e.name ?? "Unknown" : e.id.toString()});
  }

  String getSexMetaValue(String key) {
    return _sex[key] ?? key;
  }

  String getCategoryMetaValue(String key) {
    return _category[key] ?? key;
  }

  String getReporterMetaValue(String key) {
    return _reporter[key] ?? key;
  }

  String getAreaTypeMetaValue(String key) {
    return _areaType[key] ?? key;
  }

  String getReligionMetaValue(String key) {
    return _religion[key] ?? key;
  }

  String getTribeMetaValue(String key) {
    return _tribe[key] ?? key;
  }

  String getChildClassMetaValue(String key) {
    return _childClass[key] ?? key;
  }

  String getOrgUnitValue(String key) {
    return _orgUnit[key] ?? key;
  }

  String getOvcProgramValue(String key) {
    return _ovcProgram[key] ?? key;
  }

  String getPersonTypeValue(String key) {
    return _personType[key] ?? key;
  }
}