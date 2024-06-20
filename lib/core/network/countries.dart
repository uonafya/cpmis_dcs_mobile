import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/constants/location_types.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/models/countries_from_upstreams.dart';
import 'package:sqflite/sqflite.dart';

Future<void> saveCountries() async{
  try {
    var db = await localdb.database;
    
    var results = await httpClient.request("${cpimsApiUrl}v1/country", "GET", null);
    var countries = results.data.map((e) => CountriesFromUpstreams.fromJSON(e)).toList();
    
    // Save in database
    await saveCountryinDB(db, countries);
  } catch(err) {
    throw "Could Not Save Countries";
  }
}

Future<void> saveCountryinDB(Database db, List<dynamic> countries) async{
  try {
    var batch = db.batch();
    var getLastStoredlocation = await db.rawQuery("SELECT MAX(id) AS max FROM $geolocationTable");
    var maxID = getLastStoredlocation[0]['max'] ?? 100;
    int max;
    if (maxID.runtimeType == int) {
      max = maxID as int;
    } else {
      max = 1000;
    }

    for (var i = 0; i < countries.length; i++) {
      var country = countries[i];
      batch.insert(
        geolocationTable, {
          "id": country.id! + max,
          "code": country.code,
          "name": country.name,
          "type": LocationTypes.country.value,
          "parent": null
      }, conflictAlgorithm: ConflictAlgorithm.replace
      );
    }

    await batch.commit();
  } catch(err) {
    throw "Could Not Save Country in DB";
  }
}