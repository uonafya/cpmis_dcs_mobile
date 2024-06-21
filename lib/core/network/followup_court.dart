import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/court_session_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class CourtDatabaseHelper {
  Future<void> insertCourtSession(CourtSessionModel courtData) async {
    final db = await LocalDB.instance.database;
    try {
      await db.insert(
        courtSessionTable,
        courtData.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<CourtSessionModel?> getCourtSession(String caseId) async {
    final db = await LocalDB.instance.database;

    try {
      var queryResults = await db.query(
        courtSessionTable,
        where: '${CourtSessionTable.caseId} = ?',
        whereArgs: [caseId],
      );

      if (queryResults.isNotEmpty) {
        return CourtSessionModel.fromJson(queryResults.first);
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

  Future<void> deleteCourtSession(String caseId) async {
    final db = await LocalDB.instance.database;

    try {
      await db.delete(
        courtSessionTable,
        where: '${CourtSessionTable.caseId} = ?',
        whereArgs: [caseId],
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

class CourtSessionTable {
  static final List<String> values = [
    caseId,
    formId,
    courtSessionCase,
    courtSessionType,
    dateOfCourtEvent,
    courtNotes,
    nextHearingDate,
    nextMentionDate,
    pleaTaken,
    applicationOutcome,
    courtOutcome,
    courtOrder,
  ];

  static const String caseId = 'case_id';
  static const String formId = 'form_id';
  static const String courtSessionCase = 'court_session_case';
  static const String courtSessionType = 'court_session_type';
  static const String dateOfCourtEvent = 'date_of_court_event';
  static const String courtNotes = 'court_notes';
  static const String nextHearingDate = 'next_hearing_date';
  static const String nextMentionDate = 'next_mention_date';
  static const String pleaTaken = 'plea_taken';
  static const String applicationOutcome = 'application_outcome';
  static const String courtOutcome = 'court_outcome';
  static const String courtOrder = 'court_order';
}
