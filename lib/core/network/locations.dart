import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/constants/location_types.dart';
import 'package:cpims_dcs_mobile/models/nameid.dart';
import 'package:sqflite/sqflite.dart';

// Get countries
Future<List<NameID>> getCountries(Database db) async {
  try {
    var results = await db.query(
      geolocationTable,
      distinct: true,
      columns: ['name', 'id'],
      where: "type = ?",
      whereArgs: [LocationTypes.country.value]
    );

    List<NameID> toReturn = results.map((e) => NameID(name: e['name'].toString(), id: e['id'].toString())).toList();
    return toReturn;
  } catch(err) {
    throw "Could Not Get Countries";
  }
}

// Get county
Future<List<NameID>> getCounties(Database db) async{
  try {
    var results = await db.query(
        geolocationTable,
        distinct: true,
        columns: ['name', 'id'],
        where: "type = ?",
        whereArgs: [LocationTypes.county.value]
    );

    List<NameID> toReturn = results.map((e) => NameID(name: e['name'].toString(), id: e['id'].toString())).toList();
    return toReturn;
  } catch(err) {
    throw "Could Not Get Counties";
  }
}

// Get subcounty
Future<List<NameID>> getSubCountiesOfCounty(Database db, String countyName) async{
  try {
    var results = await db.rawQuery(
      "SELECT DISTINCT name, id FROM $geolocationTable WHERE parent = (SELECT id FROM $geolocationTable WHERE name = ? and type = ? LIMIT 1)",
      [countyName, LocationTypes.county.value]
    );

    List<NameID> toReturn = results.map((e) => NameID(name: e['name'].toString(), id: e['id'].toString())).toList();
    return toReturn;
  } catch(err) {
    throw "Could Not Get Sub counties";
  }
}

// Get location
Future<List<NameID>> getLocationsFromSubCounty(Database db, String subCountyName) async{
  try {
    var results = await db.rawQuery(
        "SELECT DISTINCT name, id FROM $geolocationTable WHERE parent = (SELECT id FROM $geolocationTable WHERE name = ? and type = ? LIMIT 1)",
        [subCountyName, LocationTypes.subcounty.value]
    );

    List<NameID> toReturn = results.map((e) => NameID(name: e['name'].toString(), id: e['id'].toString())).toList();
    return toReturn;
  } catch(err) {
    throw "Could Not Get Locations From sub county";
  }
}

// Get sublocation
Future<List<NameID>> getSubLocationFromLocation(Database db, int locationID) async{
  try {
    var results = await db.rawQuery(
        "SELECT DISTINCT name, id FROM $geolocationTable WHERE parent = ?",
        [locationID]
    );

    List<NameID> toReturn = results.map((e) => NameID(name: e['name'].toString(), id: e['id'].toString())).toList();
    return toReturn;
  } catch(err) {
    throw "Could Not Get Sub locations From sub county";
  }
}

// Get ward
Future<List<NameID>> getWardsFromSubCounty(Database db, int subCountyID) async{
  try {
    var results = await db.rawQuery(
        "SELECT DISTINCT name, id FROM $geolocationTable WHERE parent = ?",
        [subCountyID]
    );

    List<NameID> toReturn = results.map((e) => NameID(name: e['name'].toString(), id: e['id'].toString())).toList();
    return toReturn;
  } catch(err) {
    throw "Could Not Wards From sub county";
  }
}

// Get orgunit
Future<List<NameID>> getOrgUnitsFromSubCounty(Database db, int subCountyID) async{
  try {
    var results = await db.rawQuery(
        "SELECT DISTINCT name, id FROM $geolocationTable WHERE parent = ?",
        [subCountyID]
    );

    List<NameID> toReturn = results.map((e) => NameID(name: e['name'].toString(), id: e['id'].toString())).toList();
    return toReturn;
  } catch(err) {
    throw "Could Not Get Organization units From sub county";
  }
}