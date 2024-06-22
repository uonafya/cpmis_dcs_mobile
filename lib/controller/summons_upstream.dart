// Add this mapping function
import 'dart:convert';

import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/followup_summons.dart';
import 'package:cpims_dcs_mobile/models/summons_model.dart';
import 'package:intl/intl.dart';

int mapHonoured(String? honoured) {
  switch (honoured?.toLowerCase()) {
    case 'yes':
    case 'ayes':
      return 1;
    case 'no':
    case 'ano':
      return 0;
    default:
      return -1;
  }
}

Future<void> sendCourtSummonsUpstream() async {
  final db = await LocalDB.instance.database;
  final courtSummonsDatabaseHelper = CourtSummonsDatabaseHelper();

  // Sync court summons
  final courtSummons = await db.query(courtSummonsTable);
  print("COURT SUMMONS:$courtSummons");

  for (var summons in courtSummons) {
    try {
      final summonsModel = CourtSummonsModel.fromJson(summons);

      // Transform the data for API submission
      final apiSubmissionData = {
        'case_id': summonsModel.caseId,
        'honoured': mapHonoured(summonsModel.honoured),
        'honoured_date': summonsModel.honouredDate != null
            ? DateFormat("yyyy-MM-dd").format(
                DateFormat("dd/MM/yyyy").parse(summonsModel.honouredDate!))
            : null,
        'summon_date': summonsModel.summonDate,
        'summon_note': summonsModel.summonNote,
        'form_id': 'summon_followup', // Add this if required by your API
      };

      print(
          "Court Summons Synced data format for case ${summonsModel.caseId}:");
      print(const JsonEncoder.withIndent('  ').convert(apiSubmissionData));

      await apiService.sendCourtSummons(apiSubmissionData);

      final caseId = summons['case_id'];
      if (caseId != null && caseId is String) {
        await courtSummonsDatabaseHelper.deleteCourtSummons(caseId);
        print("Successfully synced and deleted court summons for case $caseId");
      } else {
        print('Invalid caseId for deletion: $caseId');
      }
    } catch (e, stackTrace) {
      print('Error processing court summons:');
      print('Data: ${jsonEncode(summons)}');
      print('Error: $e');
      print('Stack trace: $stackTrace');
      continue;
    }
  }
}
