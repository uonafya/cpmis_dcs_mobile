import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/models/organization_unit.dart';
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
  } catch(err) {
    print(err.toString());
    throw "Could Not Save Mobile Settings";
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