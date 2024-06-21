import 'dart:convert';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/followup_closure.dart';
import 'package:cpims_dcs_mobile/models/closure_followup_model.dart';
import 'package:cpims_dcs_mobile/models/social_inquiry_form_model.dart';

Future<void> syncData() async {
  final db = await LocalDB.instance.database;
  final closureDatabaseHelper = ClosureDatabaseHelper();
  //Get all social inquiries
  final inquiries = await db.query(socialInquiryTable);
  print(inquiries);
  for (var inquiry in inquiries) {
    final inq = SocialInquiryFormModel.fromJson(inquiry);
    await apiService.sendSocialInquiry(inq);
    final inquiryId = inquiry['id'];

    await db
        .delete(socialInquiryTable, where: 'id = ?', whereArgs: [inquiryId]);
  }

  // Sync closure followups
  final closures = await db.query(caseClosureTable);

  print("Case IDs being submitted:");
  for (var closure in closures) {
    final caseId = closure[CaseClosureTable.caseID];
    print(caseId);
  }

  for (var closure in closures) {
    try {
      final closureModel = ClosureFollowupModel.fromJson(closure);

      print("Payload being sent for case ${closureModel.caseId}:");
      print(jsonEncode(closureModel.toJson()));

      await apiService.sendClosureFollowup(closureModel);

      final caseId = closure[CaseClosureTable.caseID];
      if (caseId != null && caseId is String) {
        await closureDatabaseHelper.deleteClosureFollowup(caseId);
        print("Successfully synced and deleted case $caseId");
      } else {
        print('Invalid caseId for deletion: $caseId');
      }
    } catch (e, stackTrace) {
      print('Error processing closure followup:');
      print('Data: ${jsonEncode(closure)}');
      print('Error: $e');
      print('Stack trace: $stackTrace');
    }
  }
}
