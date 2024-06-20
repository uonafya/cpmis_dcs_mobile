import 'dart:convert';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/closure_followup_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class ClosureDatabaseHelper {
  // Insert closure follow-up data along with interventions as a JSON string
  Future<void> insertClosureFollowup(ClosureFollowupModel closureData) async {
    final db = await LocalDB.instance.database;
    try {
      await db.insert(
        caseClosureTable,
        {
          'case_id': closureData.caseId,
          'case_outcome': closureData.caseOutcome,
          'transfered_to': closureData.transferedTo,
          'case_closure_notes': closureData.caseClosureNotes,
          'date_of_case_closure': closureData.dateOfCaseClosure,
          'intervention_list': jsonEncode(closureData.interventionList),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  // Retrieve closure follow-up data by caseId
  Future<ClosureFollowupModel?> getClosureFollowup(String caseId) async {
    final db = await LocalDB.instance.database;

    try {
      var queryResults = await db.query(
        caseClosureTable,
        where: 'case_id = ?',
        whereArgs: [caseId],
      );

      if (queryResults.isNotEmpty) {
        // json decode the interventions list
        var interventionList = queryResults.first['intervention_list'];

        if (interventionList is String) {
          // Create a new map with the updated intervention_list field
          final updatedResult = {
            ...queryResults.first,
            'intervention_list': jsonDecode(interventionList),
          };

          return ClosureFollowupModel.fromJson(updatedResult);
        } else {
          return ClosureFollowupModel.fromJson(queryResults.first);
        }
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

  // Delete closure follow-up data by caseId
  Future<void> deleteClosureFollowup(String caseId) async {
    final db = await LocalDB.instance.database;

    try {
      await db.delete(
        caseClosureTable,
        where: 'case_id = ?',
        whereArgs: [caseId],
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
