import 'dart:convert';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/services_followup_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class ServiceDatabaseHelper {
  Future<void> insertServiceFollowup(ServiceFollowupModel serviceData) async {
    final db = await LocalDB.instance.database;
    try {
      await db.insert(
        serviceFollowupTable,
        {
          ServiceFollowupTable.caseID: serviceData.caseId,
          ServiceFollowupTable.formId: serviceData.formId,
          ServiceFollowupTable.encounterNotes: serviceData.encounterNotes,
          ServiceFollowupTable.caseCategoryId: serviceData.caseCategoryId,
          ServiceFollowupTable.serviceProvidedList:
              jsonEncode(serviceData.serviceProvidedList),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<ServiceFollowupModel?> getServiceFollowup(String caseId) async {
    final db = await LocalDB.instance.database;

    try {
      var queryResults = await db.query(
        serviceFollowupTable,
        where: '${ServiceFollowupTable.caseID} = ?',
        whereArgs: [caseId],
      );

      if (queryResults.isNotEmpty) {
        var serviceProvidedList =
            queryResults.first[ServiceFollowupTable.serviceProvidedList];

        if (serviceProvidedList is String) {
          final updatedResult = {
            ...queryResults.first,
            ServiceFollowupTable.serviceProvidedList:
                jsonDecode(serviceProvidedList),
          };

          return ServiceFollowupModel.fromJson(updatedResult);
        } else {
          return ServiceFollowupModel.fromJson(queryResults.first);
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

  Future<void> deleteServiceFollowup(String caseId) async {
    final db = await LocalDB.instance.database;

    try {
      await db.delete(
        serviceFollowupTable,
        where: '${ServiceFollowupTable.caseID} = ?',
        whereArgs: [caseId],
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

class ServiceFollowupTable {
  static final List<String> values = [
    caseID,
    formId,
    encounterNotes,
    caseCategoryId,
    serviceProvidedList,
  ];

  static const String caseID = 'case_id';
  static const String formId = 'form_id';
  static const String encounterNotes = 'encounter_notes';
  static const String caseCategoryId = 'case_category_id';
  static const String serviceProvidedList = 'service_provided_list';
}
