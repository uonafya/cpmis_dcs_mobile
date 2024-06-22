import 'dart:convert';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/followup_court.dart';
import 'package:intl/intl.dart';
import 'package:cpims_dcs_mobile/models/court_session_model.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';

int mapCaseCategory(String? category) {
  final Map<String, int> categoryMap = {
    "Abandoned": 1,
    // Add more categories as needed
  };
  return categoryMap[category] ?? 0;
}

int mapCourtSessionType(String? type) {
  final Map<String, int> typeMap = {
    "Application": 1,
    "Plea Taking": 2,
    "Hearing": 3,
    "Mention": 4,
  };
  return typeMap[type] ?? 0;
}

int mapPleaTaken(String? plea) {
  final Map<String, int> pleaMap = {
    "Pleaded guilty": 1,
    "Pleaded not guilty": 2,
  };
  return pleaMap[plea] ?? 0;
}

int mapApplicationOutcome(String? outcome) {
  final Map<String, int> outcomeMap = {
    "Application granted": 1,
    "Application not granted": 2,
  };
  return outcomeMap[outcome] ?? 0;
}

int mapCourtOutcome(String? outcome) {
  final Map<String, int> outcomeMap = {
    "Adjournment": 1,
    "Judgment": 2,
    "Ruling": 3,
    "Court Order": 4,
  };
  return outcomeMap[outcome] ?? 0;
}

List<int> mapCourtOrders(List<String>? orders) {
  final Map<String, int> orderMap = {
    "Re-unification and Re-integration": 1,
    "Access order": 2,
    "Adoption order": 3,
    "Child assessment order": 4,
    "Child counselling order": 5,
  };
  return orders?.map((order) => orderMap[order] ?? 0).toList() ?? [];
}

Future<void> sendCourtSessionsUpstream() async {
  final db = await LocalDB.instance.database;
  final courtDatabaseHelper = CourtDatabaseHelper();

  // Sync court sessions
  final courtSessions = await db.query(courtSessionTable);
  print("COURT SESSIONS:$courtSessions");

  for (var session in courtSessions) {
    try {
      final sessionModel = CourtSessionModel.fromJson(session);

      // Transform the data for API submission
      final apiSubmissionData = {
        'case_id': sessionModel.caseId,
        'form_id': sessionModel.formId,
        'court_session_case': sessionModel.courtSessionCase != null
            ? mapCaseCategory(sessionModel.courtSessionCase)
            : null,
        'court_session_type': sessionModel.courtSessionType != null
            ? mapCourtSessionType(sessionModel.courtSessionType)
            : null,
        'date_of_court_event': sessionModel.dateOfCourtEvent != null
            ? DateFormat("yyyy-MM-dd").format(
                DateFormat("dd/MM/yyyy").parse(sessionModel.dateOfCourtEvent!))
            : null,
        'court_notes': sessionModel.courtNotes,
        'next_hearing_date': sessionModel.nextHearingDate != null
            ? DateFormat("yyyy-MM-dd").format(
                DateFormat("dd/MM/yyyy").parse(sessionModel.nextHearingDate!))
            : null,
        'next_mention_date': sessionModel.nextMentionDate != null
            ? DateFormat("yyyy-MM-dd").format(
                DateFormat("dd/MM/yyyy").parse(sessionModel.nextMentionDate!))
            : null,
        'plea_taken': sessionModel.pleaTaken != null
            ? mapPleaTaken(sessionModel.pleaTaken)
            : null,
        'application_outcome': sessionModel.applicationOutcome != null
            ? mapApplicationOutcome(sessionModel.applicationOutcome)
            : null,
        'court_outcome': sessionModel.courtOutcome != null
            ? mapCourtOutcome(sessionModel.courtOutcome)
            : null,
        'court_order': sessionModel.courtOrder != null &&
                sessionModel.courtOrder!.isNotEmpty
            ? mapCourtOrders(sessionModel.courtOrder)
            : null,
      };

      // Remove null values from the submission data
      apiSubmissionData.removeWhere((key, value) => value == null);

      print(
          "Court Session Synced data format for case ${sessionModel.caseId}:");
      print(const JsonEncoder.withIndent('  ').convert(apiSubmissionData));

      await apiService.sendCourtSession(apiSubmissionData);

      final caseId = session[CourtSessionTable.caseId];
      if (caseId != null && caseId is String) {
        await courtDatabaseHelper.deleteCourtSession(caseId);
        print("Successfully synced and deleted court session for case $caseId");
      } else {
        print('Invalid caseId for deletion: $caseId');
      }
    } catch (e, stackTrace) {
      print('Error processing court session:');
      print('Data: ${jsonEncode(session)}');
      print('Error: $e');
      print('Stack trace: $stackTrace');
      continue;
    }
  }
}
