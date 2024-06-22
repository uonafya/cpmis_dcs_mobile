import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/models/metadata.dart';
import 'package:cpims_dcs_mobile/models/nameid.dart';
import 'package:sqflite/sqflite.dart';

Future<void> saveMetadata() async {
  try {
    var db = await localdb.database;

    var results =
        await httpClient.request("${cpimsApiUrl}mobile/metadata/", "GET", null);

    var metadata = results.data.map((e) => Metadata.fromJSON(e)).toList();

    await saveMetadataInDB(db, metadata);
  } catch (err) {
    throw "Could Not Get Metadata";
  }
}

Future<List<NameID>> getMetadata(MetadataTypes type) async {
  try {
    var db = await localdb.database;
    var results = await db.query(metadataTable,
        distinct: true,
        where: "fieldName = ?",
        columns: ['description', 'id'],
        whereArgs: [type.value]);
    return results
        .map((e) =>
            NameID(name: e['description'].toString(), id: e['id'].toString()))
        .toList();
  } catch (err) {
    throw "Could Not Get Metadata";
  }
}

Future<void> saveMetadataInDB(Database db, List<dynamic> metadata) async {
  try {
    var batch = db.batch();

    for (var i = 0; i < metadata.length; i++) {
      var meta = metadata[i];
      batch.insert(
          metadataTable,
          {
            "id": meta.id,
            "fieldName": meta.fieldName,
            "description": meta.description,
            "subCategory": meta.subCategory,
            "orderNo": meta.order,
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit();
  } catch (err) {
    throw "Could Not Save Metadata in DB";
  }
}

enum MetadataTypes {
  category,
  reporter,
  areaType,
  sex,
  religion,
  tribe,
  childClass,
  ovcProgram,
  personType,
  familyStatus,
  relationshipType,
  referralDestinationClassification,
  referralType,
  longTermSupport,
  mentalSubCondition,
  physicalSubCondition,
  courtOrder,
  householdEconomics,
  immediateNeed,
  otherSubcondition,
  mentalCondition,
  caseNature,
  perpetratorID,
  perpetratorStatus,
  placeOfEvent,
  physicalConditionType,
  referralDestinationID,
  riskLevel,
  coreItem,
  intervention,
}

extension MetadataValues on MetadataTypes {
  String get value {
    switch (this) {
      case MetadataTypes.category:
        return "case_category_id";
      case MetadataTypes.reporter:
        return "case_reporter_id";
      case MetadataTypes.areaType:
        return "area_type_id";
      case MetadataTypes.sex:
        return "sex_id";
      case MetadataTypes.religion:
        return "religion_type_id";
      case MetadataTypes.tribe:
        return "tribe_category_id";
      case MetadataTypes.childClass:
        return "class_level_id";
      case MetadataTypes.ovcProgram:
        return "ovc_program_id";
      case MetadataTypes.personType:
        return "person_type_id";
      case MetadataTypes.familyStatus:
        return "family_status_id";
      case MetadataTypes.relationshipType:
        return "relationship_type_id";
      case MetadataTypes.referralDestinationClassification:
        return "referral_destination_classification";
      case MetadataTypes.referralType:
        return "referral_type_id";
      case MetadataTypes.longTermSupport:
        return "long_term_support_id";
      case MetadataTypes.mentalSubCondition:
        return "mental_subcondition_id";
      case MetadataTypes.physicalSubCondition:
        return "physical_subcondition_id";
      case MetadataTypes.courtOrder:
        return "court_order_id";
      case MetadataTypes.householdEconomics:
        return "household_economics";
      case MetadataTypes.immediateNeed:
        return "immediate_need_id";
      case MetadataTypes.otherSubcondition:
        return "otherSubcondition";
      case MetadataTypes.mentalCondition:
        return "mental_condition_id";
      case MetadataTypes.caseNature:
        return "case_nature_id";
      case MetadataTypes.perpetratorID:
        return "perpetrator_id";
      case MetadataTypes.perpetratorStatus:
        return "perpetrator_status_id";
      case MetadataTypes.placeOfEvent:
        return "event_place_id";
      case MetadataTypes.physicalConditionType:
        return "physical_condition_id";
      case MetadataTypes.referralDestinationID:
        return "referral_destination_id";
      case MetadataTypes.riskLevel:
        return "risk_level_id";
      case MetadataTypes.coreItem:
        return "core_item_id";
      case MetadataTypes.intervention:
        return "intervention_id";
      default:
        throw "Unsupported Type";
    }
  }
}
