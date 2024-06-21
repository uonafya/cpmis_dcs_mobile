import 'dart:convert';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/closure_followup_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class ClosureDatabaseHelper {
  Future<void> insertClosureFollowup(ClosureFollowupModel closureData) async {
    final db = await LocalDB.instance.database;
    try {
      await db.insert(
        caseClosureTable,
        {
          CaseClosureTable.caseID: closureData.caseId,
          CaseClosureTable.formId: closureData.formId,
          CaseClosureTable.caseOutcome: closureData.caseOutcome,
          CaseClosureTable.transferredTo: closureData.transferedTo,
          CaseClosureTable.caseClosureNotes: closureData.caseClosureNotes,
          CaseClosureTable.dateOfCaseClosure: closureData.dateOfCaseClosure,
          CaseClosureTable.interventionList:
              jsonEncode(closureData.interventionList),
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
            CaseClosureTable.interventionList: jsonDecode(interventionList),
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
}

class CaseClosureTable {
  static final List<String> values = [
    caseID,
    formId,
    caseOutcome,
    transferredTo,
    caseClosureNotes,
    dateOfCaseClosure,
    interventionList
  ];

  static const String caseID = 'case_id';
  static const String formId = 'form_id';
  static const String caseOutcome = 'case_outcome';
  static const String transferredTo = 'transfered_to';
  static const String caseClosureNotes = 'case_closure_notes';
  static const String dateOfCaseClosure = 'date_of_case_closure';
  static const String interventionList = 'intervention_list';
}
