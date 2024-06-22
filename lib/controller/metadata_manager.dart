import 'dart:async';

import 'package:cpims_dcs_mobile/core/network/metadata.dart';
import 'package:cpims_dcs_mobile/models/organization_unit.dart';
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
  final Map<String, String> _familyStatus = {};
  final Map<String, String> _referralDestinationClassification = {};
  final Map<String, String> _referralType = {};
  final Map<String, String> _longTermSupport = {};
  final Map<String, String> _mentalSubCondition = {};
  final Map<String, String> _physicalSubCondition = {};
  final Map<String, String> _courtOrder = {};
  final Map<String, String> _householdEconomics = {};
  final Map<String, String> _immediateNeed = {};
  final Map<String, String> _otherSubcondition = {};
  final Map<String, String> _mentalCondition = {};
  final Map<String, String> _caseNature = {};
  final Map<String, String> _perpetratorID = {};
  final Map<String, String> _perpetratorStatus = {};
  final Map<String, String> _placeOfEvent = {};
  final Map<String, String> _physicalConditioType = {};
  final Map<String, String> _referralDestinationID = {};
  final Map<String, String> _riskLevel = {};
  final Map<String, String> _coreItem = {};
  final Map<String, String> _intervention = {};

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
  Map<String, String> get familyStatus => _familyStatus;
  Map<String, String> get referralDestinationClassification =>
      _referralDestinationClassification;
  Map<String, String> get referralType => _referralType;
  Map<String, String> get longTermSupport => _longTermSupport;
  Map<String, String> get mentalSubCondition => _mentalSubCondition;
  Map<String, String> get physicalSubCondition => _physicalSubCondition;
  Map<String, String> get courtOrder => _courtOrder;
  Map<String, String> get householdEconomics => _householdEconomics;
  Map<String, String> get immediateNeed => _immediateNeed;
  Map<String, String> get otherSubcondition => _otherSubcondition;
  Map<String, String> get mentalCondition => _mentalCondition;
  Map<String, String> get caseNature => _caseNature;
  Map<String, String> get perpetratorID => _perpetratorID;
  Map<String, String> get perpetratorStatus => _perpetratorStatus;
  Map<String, String> get placeOfEvent => _placeOfEvent;
  Map<String, String> get physicalConditioType => _physicalConditioType;
  Map<String, String> get referralDestinationID => _referralDestinationID;
  Map<String, String> get riskLevel => _riskLevel;
  Map<String, String> get coreItem => _coreItem;
  Map<String, String> get intervention => _intervention;

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
    _loadfamilyStatusMetadata();
    _loadreferralDestinationClassificationMetadata();
    _loadreferralType();
    _loadlongTermSupportMetadata();
    _loadmentalConditionMetadata();
    _loadmentalSubConditionMetadata();
    _loadphysicalConditionType();
    _loadphysicalSubConditionMetadata();
    _loadcourtOrderMetadata();
    _loadhouseholdEconomicsMetadata();
    _loadimmediateNeedMetadata();
    _loadotherSubconditionMetadata();
    _loadcaseNatureMetadata();
    _loadperpetratorIDMetadata();
    _loadplaceOfEventMetadata();
    _loadperpetratorStatusMetadata();
    _loadreferralDestinationIDMetadata();
    _loadriskLevelMetadata();
    _loadinterventionMetadata();
    _loadcoreItemMetadata();
  }

  Future<void> _loadSexMetaData() async {
    List<NameID> sexMetadata = await getMetadata(MetadataTypes.sex);
    _sex.clear();
    _sex.addAll({for (var e in sexMetadata) e.name: e.id});
  }

  Future<void> _loadCategoryMetaData() async {
    List<NameID> categoryMetadata = await getMetadata(MetadataTypes.category);
    _category.clear();
    _category.addAll({for (var e in categoryMetadata) e.name: e.id});
  }

  Future<void> _loadReporterMetaData() async {
    List<NameID> reporterMetadata = await getMetadata(MetadataTypes.reporter);
    _reporter.clear();
    _reporter.addAll({for (var e in reporterMetadata) e.name: e.id});
  }

  Future<void> _loadAreaTypeMetaData() async {
    List<NameID> areaTypeMetadata = await getMetadata(MetadataTypes.areaType);
    _areaType.clear();
    _areaType.addAll({for (var e in areaTypeMetadata) e.name: e.id});
  }

  Future<void> _loadReligionMetaData() async {
    List<NameID> religionMetadata = await getMetadata(MetadataTypes.religion);
    _religion.clear();
    _religion.addAll({for (var e in religionMetadata) e.name: e.id});
  }

  Future<void> _loadTribeMetaData() async {
    List<NameID> tribeMetadata = await getMetadata(MetadataTypes.tribe);
    _tribe.clear();
    _tribe.addAll({for (var e in tribeMetadata) e.name: e.id});
  }

  Future<void> _loadChildClassMetaData() async {
    List<NameID> childClassMetadata =
        await getMetadata(MetadataTypes.childClass);
    _childClass.clear();
    _childClass.addAll({for (var e in childClassMetadata) e.name: e.id});
  }

  Future<void> _loadOvcProgramMetaData() async {
    List<NameID> ovcProgramMetadata =
        await getMetadata(MetadataTypes.ovcProgram);
    _ovcProgram.clear();
    _ovcProgram.addAll({for (var e in ovcProgramMetadata) e.name: e.id});
  }

  Future<void> _loadPersonTypeMetaData() async {
    List<NameID> personTypeMetadata =
        await getMetadata(MetadataTypes.personType);
    _personType.clear();
    _personType.addAll({for (var e in personTypeMetadata) e.name: e.id});
  }

  Future<void> _loadRelationshipTypeMetaData() async {
    List<NameID> relationshipTypeMetadata =
        await getMetadata(MetadataTypes.relationshipType);
    _relationshipType.clear();
    _relationshipType
        .addAll({for (var e in relationshipTypeMetadata) e.name: e.id});
  }

  Future<void> _loadOrgUnitMetaData() async {
    List<OrganizationUnit> orgUnitMetadata = await getOrganizationalUnits(null);
    _orgUnit.clear();
    _orgUnit.addAll(
        {for (var e in orgUnitMetadata) e.name ?? "Unknown": e.id.toString()});
  }

  Future<void> _loadfamilyStatusMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.familyStatus);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadreferralDestinationClassificationMetadata() async {
    List<NameID> metadata =
        await getMetadata(MetadataTypes.referralDestinationClassification);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadreferralType() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.referralType);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadlongTermSupportMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.longTermSupport);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadmentalSubConditionMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.mentalSubCondition);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadphysicalSubConditionMetadata() async {
    List<NameID> metadata =
        await getMetadata(MetadataTypes.physicalSubCondition);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadcourtOrderMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.courtOrder);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadhouseholdEconomicsMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.householdEconomics);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadimmediateNeedMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.immediateNeed);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadotherSubconditionMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.otherSubcondition);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadmentalConditionMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.mentalCondition);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadcaseNatureMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.caseNature);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadperpetratorIDMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.perpetratorID);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadperpetratorStatusMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.perpetratorStatus);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadplaceOfEventMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.placeOfEvent);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadphysicalConditionType() async {
    List<NameID> metadata =
        await getMetadata(MetadataTypes.physicalConditionType);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadreferralDestinationIDMetadata() async {
    List<NameID> metadata =
        await getMetadata(MetadataTypes.referralDestinationID);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadriskLevelMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.riskLevel);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadcoreItemMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.coreItem);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  Future<void> _loadinterventionMetadata() async {
    List<NameID> metadata = await getMetadata(MetadataTypes.intervention);
    _relationshipType.clear();
    _relationshipType.addAll({for (var e in metadata) e.name: e.id});
  }

  String getSexValue(String key) {
    return _sex[key] ?? key;
  }

  String getCategoryValue(String key) {
    return _category[key] ?? key;
  }

  String getReporterValue(String key) {
    return _reporter[key] ?? key;
  }

  String getAreaTypeValue(String key) {
    return _areaType[key] ?? key;
  }

  String getReligionValue(String key) {
    return _religion[key] ?? key;
  }

  String getTribeValue(String key) {
    return _tribe[key] ?? key;
  }

  String getChildClassValue(String key) {
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

  String getfamilyStatus(String key) {
    return _familyStatus[key] ?? key;
  }

  String getreferralDestinationClassification(String key) {
    return _referralDestinationClassification[key] ?? key;
  }

  String getreferralType(String key) {
    return _referralType[key] ?? key;
  }

  String getlongTermSupport(String key) {
    return _longTermSupport[key] ?? key;
  }

  String getmentalSubCondition(String key) {
    return _mentalSubCondition[key] ?? key;
  }

  String getphysicalSubCondition(String key) {
    return _physicalSubCondition[key] ?? key;
  }

  String getcourtOrder(String key) {
    return _courtOrder[key] ?? key;
  }

  String gethouseholdEconomics(String key) {
    return _householdEconomics[key] ?? key;
  }

  String getimmediateNeed(String key) {
    return _immediateNeed[key] ?? key;
  }

  String getotherSubcondition(String key) {
    return _otherSubcondition[key] ?? key;
  }

  String getmentalCondition(String key) {
    return _mentalCondition[key] ?? key;
  }

  String getcaseNature(String key) {
    return _caseNature[key] ?? key;
  }

  String getperpetratorID(String key) {
    return _perpetratorID[key] ?? key;
  }

  String getperpetratorStatus(String key) {
    return _perpetratorStatus[key] ?? key;
  }

  String getplaceOfEvent(String key) {
    return _placeOfEvent[key] ?? key;
  }

  String getphysicalConditionType(String key) {
    return _physicalConditioType[key] ?? key;
  }

  String getreferralDestinationID(String key) {
    return _referralDestinationID[key] ?? key;
  }

  String getriskLevel(String key) {
    return _riskLevel[key] ?? key;
  }

  String getcoreItem(String key) {
    return _coreItem[key] ?? key;
  }

  String getintervention(String key) {
    return _intervention[key] ?? key;
  }
}
