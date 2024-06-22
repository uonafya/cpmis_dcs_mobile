// In sync_provider.dart

import 'dart:convert';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/followup_referrals.dart';
import 'package:cpims_dcs_mobile/models/referrals_followup_model.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';

int mapCaseCategory(String? category) {
  final Map<String, int> categoryMap = {
    "Please select": 0,
    "Child Affected by HIV/AIDS": 1,
    "Abandonment": 2,
    "Abuse": 3,
    // Add all other categories...
  };
  return categoryMap[category] ?? 0;
}

int mapReferralActor(String? actor) {
  final Map<String, int> actorMap = {
    "Please select": 0,
    "Non-State Actors": 1,
    "State Agency": 2,
  };
  return actorMap[actor] ?? 0;
}

int mapSpecifiedReferral(String? specified) {
  final Map<String, int> specifiedMap = {
    "Please select": 0,
    "ODPP": 1,
    "Police": 2,
    "Hospital": 3,
    // Add all other specified referrals...
  };
  return specifiedMap[specified] ?? 0;
}

int mapReferralFor(String? referralFor) {
  final Map<String, int> referralForMap = {
    "Please select": 0,
    "Alternative family care placement service": 1,
    "Medical Care/Treatment": 2,
    "Legal Support": 3,
    // Add all other referral for options...
  };
  return referralForMap[referralFor] ?? 0;
}

Future<void> sendReferralsUpstream() async {
  final db = await LocalDB.instance.database;
  final referralDatabaseHelper = ReferralDatabaseHelper();

  // Sync referrals
  final referrals = await db.query(referralTable);
  print("REFERRALS:$referrals");

  for (var referral in referrals) {
    try {
      final referralModel = ReferralModel.fromJson(referral);

      // Transform the data for API submission
      final apiSubmissionData = {
        'case_id': referralModel.caseId,
        'form_id': referralModel.formId,
        'case_category': mapCaseCategory(referralModel.caseCategory),
        'referral_actor': mapReferralActor(referralModel.referralActor),
        'specified_referral':
            mapSpecifiedReferral(referralModel.specifiedReferral),
        'referral_for': mapReferralFor(referralModel.referralFor),
      };

      // Log any unmapped values
      if (apiSubmissionData['case_category'] == 0 &&
          referralModel.caseCategory != "Please select") {
        print("Unmapped case category: ${referralModel.caseCategory}");
      }
      if (apiSubmissionData['referral_actor'] == 0 &&
          referralModel.referralActor != "Please select") {
        print("Unmapped referral actor: ${referralModel.referralActor}");
      }
      if (apiSubmissionData['specified_referral'] == 0 &&
          referralModel.specifiedReferral != "Please select") {
        print(
            "Unmapped specified referral: ${referralModel.specifiedReferral}");
      }
      if (apiSubmissionData['referral_for'] == 0 &&
          referralModel.referralFor != "Please select") {
        print("Unmapped referral for: ${referralModel.referralFor}");
      }

      // Remove null values from the submission data
      apiSubmissionData.removeWhere((key, value) => value == null);

      print("Referral Synced data format for case ${referralModel.caseId}:");
      print(const JsonEncoder.withIndent('  ').convert(apiSubmissionData));

      await apiService.sendReferral(apiSubmissionData);

      final caseId = referral[ReferralTable.caseId];
      if (caseId != null && caseId is String) {
        await referralDatabaseHelper.deleteReferral(caseId);
        print("Successfully synced and deleted referral for case $caseId");
      } else {
        print('Invalid caseId for deletion: $caseId');
      }
    } catch (e, stackTrace) {
      print('Error processing referral:');
      print('Data: ${jsonEncode(referral)}');
      print('Error: $e');
      print('Stack trace: $stackTrace');
      continue;
    }
  }
}
