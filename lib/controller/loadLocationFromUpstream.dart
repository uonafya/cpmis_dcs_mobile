import 'dart:convert';

import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/locations.dart';
import 'package:cpims_dcs_mobile/models/locationFromUpstream.dart';
import 'package:dio/dio.dart';

Future<void> loadLocationFromUpstream() async {
  var dio = Dio();
  try {
    var results = await dio.get("${cpimsApiUrl}v1/geo");

    if (results.statusCode != 200) {
      throw "Error Sending request";
    }
    var locations =
        results.data.map((e) => LocationFromUpstream.fromJSON(e)).toList();

    // Store in DB
    var db = await localdb.database;
    saveLocation(db, locations);
  } catch (err) {
    print(err.toString());
    throw "Could Not Load Locations";
  }
}
