import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/constants/location_types.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/nameid.dart';
import 'package:sqflite/sqflite.dart';

// Saving locations
Future<void> saveLocation(Database db, List<dynamic> locations) async {
  try {
    var batch = db.batch();

    for (var i = 0; i < locations.length; i++) {
      var location = locations[i];
      batch.insert(
          geolocationTable,
          {
            "id": location.id,
            "code": location.areaCode,
            "name": location.areaName,
            "type": location.areaType,
            "parent": location.parent
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit();
  } catch (err) {
    throw "Could Not Save Location";
  }
}

// Get countries
Future<List<NameID>> getCountries() async {
  final db = await LocalDB.instance.database;
  try {
    var results = await db.query(geolocationTable,
        distinct: true,
        columns: ['name', 'id'],
        where: "type = ?",
        whereArgs: [LocationTypes.country.value]);

    List<NameID> toReturn = results
        .map((e) => NameID(name: e['name'].toString(), id: e['id'].toString()))
        .toList();
    return toReturn;
  } catch (err) {
    throw "Could Not Get Countries";
  }
}

// Get county
Future<List<NameID>> getCounties() async {
  try {
    final db = await LocalDB.instance.database;

    var results = await db.query(geolocationTable,
        distinct: true,
        columns: ['name', 'id'],
        where: "type = ?",
        whereArgs: [LocationTypes.county.value]);

    List<NameID> toReturn = results
        .map((e) => NameID(name: e['name'].toString(), id: e['id'].toString()))
        .toList();
    return toReturn;
  } catch (err) {
    throw "Could Not Get Counties";
  }
}

// Get subcounty
Future<List<NameID>> getSubCountiesOfCounty(String countyName) async {
  try {
    final db = await LocalDB.instance.database;

    var results = await db.rawQuery(
        "SELECT DISTINCT name, id FROM $geolocationTable WHERE parent = (SELECT id FROM $geolocationTable WHERE name = ? and type = ? LIMIT 1)",
        [countyName, LocationTypes.county.value]);

    List<NameID> toReturn = results
        .map((e) => NameID(name: e['name'].toString(), id: e['id'].toString()))
        .toList();
    return toReturn;
  } catch (err) {
    throw "Could Not Get Sub counties";
  }
}

// Get location
Future<List<NameID>> getLocationsFromSubCounty(String subCountyName) async {
  try {
    final db = await LocalDB.instance.database;

    var results = await db.rawQuery(
        "SELECT DISTINCT name, id FROM $geolocationTable WHERE parent = (SELECT id FROM $geolocationTable WHERE name = ? and type = ? LIMIT 1)",
        [subCountyName, LocationTypes.subcounty.value]);

    List<NameID> toReturn = results
        .map((e) => NameID(name: e['name'].toString(), id: e['id'].toString()))
        .toList();
    return toReturn;
  } catch (err) {
    throw "Could Not Get Locations From sub county";
  }
}

// Get sublocation
Future<List<NameID>> getSubLocationFromLocation(int locationID) async {
  try {
    final db = await LocalDB.instance.database;

    var results = await db.rawQuery(
        "SELECT DISTINCT name, id FROM $geolocationTable WHERE parent = ?",
        [locationID]);

    List<NameID> toReturn = results
        .map((e) => NameID(name: e['name'].toString(), id: e['id'].toString()))
        .toList();
    return toReturn;
  } catch (err) {
    throw "Could Not Get Sub locations From sub county";
  }
}

// Get ward
Future<List<NameID>> getWardsFromSubCounty(String subCountyID) async {
  try {
    final db = await LocalDB.instance.database;

    var results = await db.rawQuery(
        "SELECT DISTINCT name, id FROM $geolocationTable WHERE parent = ?",
        [subCountyID]);

    List<NameID> toReturn = results
        .map((e) => NameID(name: e['name'].toString(), id: e['id'].toString()))
        .toList();
    return toReturn;
  } catch (err) {
    throw "Could Not Wards From sub county";
  }
}

// Get orgunit
Future<List<NameID>> getOrgUnitsFromSubCounty(int subCountyID) async {
  try {
    final db = await LocalDB.instance.database;

    var results = await db.rawQuery(
        "SELECT DISTINCT name, id FROM $geolocationTable WHERE parent = ?",
        [subCountyID]);

    List<NameID> toReturn = results
        .map((e) => NameID(name: e['name'].toString(), id: e['id'].toString()))
        .toList();
    return toReturn;
  } catch (err) {
    throw "Could Not Get Organization units From sub county";
  }
}
