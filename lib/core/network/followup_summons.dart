import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/summons_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class CourtSummonsDatabaseHelper {
  Future<void> insertCourtSummons(CourtSummonsModel summonsData) async {
    final db = await LocalDB.instance.database;
    try {
      await db.insert(
        courtSummonsTable,
        summonsData.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<CourtSummonsModel?> getCourtSummons(String caseId) async {
    final db = await LocalDB.instance.database;

    try {
      var queryResults = await db.query(
        courtSummonsTable,
        where: '${CourtSummonsTable.caseId} = ?',
        whereArgs: [caseId],
      );

      if (queryResults.isNotEmpty) {
        return CourtSummonsModel.fromJson(queryResults.first);
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  Future<void> deleteCourtSummons(String caseId) async {
    final db = await LocalDB.instance.database;

    try {
      await db.delete(
        courtSummonsTable,
        where: '${CourtSummonsTable.caseId} = ?',
        whereArgs: [caseId],
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

class CourtSummonsTable {
  static final List<String> values = [
    caseId,
    honoured,
    honouredDate,
    summonDate,
    summonNote,
  ];

  static const String caseId = 'case_id';
  static const String honoured = 'honoured';
  static const String honouredDate = 'honoured_date';
  static const String summonDate = 'summon_date';
  static const String summonNote = 'summon_note';
}
