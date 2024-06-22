import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/referrals_followup_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class ReferralDatabaseHelper {
  Future<void> insertReferral(ReferralModel referralData) async {
    final db = await LocalDB.instance.database;
    try {
      await db.insert(
        referralTable,
        referralData.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<ReferralModel?> getReferral(String caseId) async {
    final db = await LocalDB.instance.database;

    try {
      var queryResults = await db.query(
        referralTable,
        where: '${ReferralTable.caseId} = ?',
        whereArgs: [caseId],
      );

      if (queryResults.isNotEmpty) {
        return ReferralModel.fromJson(queryResults.first);
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

  Future<void> deleteReferral(String caseId) async {
    final db = await LocalDB.instance.database;

    try {
      await db.delete(
        referralTable,
        where: '${ReferralTable.caseId} = ?',
        whereArgs: [caseId],
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

class ReferralTable {
  static final List<String> values = [
    caseId,
    formId,
    caseCategory,
    referralActor,
    specifiedReferral,
    referralFor,
  ];

  static const String caseId = 'case_id';
  static const String formId = 'form_id';
  static const String caseCategory = 'case_category';
  static const String referralActor = 'referral_actor';
  static const String specifiedReferral = 'specified_referral';
  static const String referralFor = 'referral_for';
}