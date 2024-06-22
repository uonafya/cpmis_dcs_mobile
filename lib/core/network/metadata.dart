import 'package:cpims_dcs_mobile/controller/metadata_manager.dart';
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
    MetadataManager.getInstance();
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

    print("getMetadata");

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

enum MetadataTypes { category, reporter, areaType, sex, religion, tribe }

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
      default:
        throw "Unsupported Type";
    }
  }
}
