import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/models/organization_unit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

Future<void> saveOrganizationUnits() async{
  try {
    var db = await localdb.database;
    
    // Get settings from upstream
    var results = await httpClient.request("${cpimsApiUrl}mobile/settings/", "GET", null);

    // Get organizational units
    var organizationalUnits = results.data['org_units'].map((e) => OrganizationUnit.fromJSON(e)).toList();

    // Store
    await saveOrganizationalUnitsToDB(db, organizationalUnits);
    
    // Store rest in preferences
    var rest = results.data.removeWhere((key, value) => key == "org_units");
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("mobile_settigns", rest.toString());
  } catch(err) {
    print(err.toString());
    throw "Could Not Save Mobile Settings";
  }
}

Future<List<OrganizationUnit>> getOrganizationalUnits(String? type) async{
  try {
    var db = await localdb.database;
    List<Map<String, dynamic>> results;

    if (type == null) {
      results = await db.query(
        organizationUnitsTable,
        distinct: true,
        columns: ['id', 'type', 'name', 'primaryUnit'],
      );
    } else {
      results = await db.query(
        organizationUnitsTable,
        distinct: true,
        columns: ['id', 'type', 'name', 'primaryUnit'],
        where: "type = ?",
        whereArgs: [type]
      );
    }

    return results.map((e) => OrganizationUnit(id: e['id'], name: e['name'].toString(), primaryUnit: e['primaryUnit'] == 1, type: e['type'].toString())).toList();
  } catch(err) {
    throw "Could Not Get Organzational Units";
  }
}

Future<void> saveOrganizationalUnitsToDB(Database db, List<dynamic> units) async{
  try {
    var batch = db.batch();

    for (var i = 0; i < units.length; i++) {
      var unit = units[i];
      batch.insert(
        organizationUnitsTable,
        {
          "id": unit.id,
          "type": unit.type,
          "name": unit.name,
          "primaryUnit": unit.primaryUnit == true ? 1: 0
        },
        conflictAlgorithm: ConflictAlgorithm.replace,);
    }

    await batch.commit();
  } catch(err) {
    throw "Could Not Save Organization Units in DB";
  }
}