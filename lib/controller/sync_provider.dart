import 'dart:convert';
import 'package:cpims_dcs_mobile/controller/loadLocationFromUpstream.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/countries.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/followup_closure.dart';
import 'package:cpims_dcs_mobile/core/network/metadata.dart';
import 'package:cpims_dcs_mobile/core/network/mobile_settings.dart';
import 'package:cpims_dcs_mobile/models/closure_followup_model.dart';
import 'package:cpims_dcs_mobile/models/social_inquiry_form_model.dart';
import 'package:cpims_dcs_mobile/views/widgets/initial_loader.dart';
import 'package:flutter/cupertino.dart';

Future<void> syncData(BuildContext context) async {
  final String deviceID = await getDeviceID(context);

  await Future.wait([
    //TO UPSTREAM
    sendClosureUpstream(),
    sendSocialInquiryUpstream(),
    sendESRUpstream(),
    //FROM UPSTREAM
    apiService.fetchAndInsertCaseload(deviceID: deviceID),
    loadLocationFromUpstream(),
    saveOrganizationUnits(),
    saveCountries(),
    saveMetadata(),
  ]);
}

Future<void> sendClosureUpstream() async {
  final db = await LocalDB.instance.database;

  final closureDatabaseHelper = ClosureDatabaseHelper();

  // Sync closure followups
  final closures = await db.query(caseClosureTable);

  for (var closure in closures) {
    final caseId = closure[CaseClosureTable.caseID];
  }

  for (var closure in closures) {
    try {
      final closureModel = ClosureFollowupModel.fromJson(closure);

      await apiService.sendClosureFollowup(closureModel);

      final caseId = closure[CaseClosureTable.caseID];
      if (caseId != null && caseId is String) {
        await closureDatabaseHelper.deleteClosureFollowup(caseId);
      } else {
        print('Invalid caseId for deletion: $caseId');
      }
    } catch (e, stackTrace) {
      print('Error processing closure followup:');
    }
  }
}

Future<void> sendSocialInquiryUpstream() async {
  final db = await LocalDB.instance.database;

  //Get all social inquiries
  final inquiries = await db.query(socialInquiryTable);
  print("INQUIRIES: $inquiries");
  for (var inquiry in inquiries) {
    final inq = SocialInquiryFormModel.fromJson(inquiry);
    await apiService.sendSocialInquiry(inq);
    final inquiryId = inquiry['id'];

    await db
        .delete(socialInquiryTable, where: 'id = ?', whereArgs: [inquiryId]);
  }
}

Future<void> sendESRUpstream() async {
  final db = LocalDB.instance;

  //Get all ESR forms
  final esrForms = await db.getESRForms();
  print("ESR FORMS: $esrForms");

  for (var esr in esrForms) {
    await apiService.sendESRForm(esr.toJson());
  }
  db.deleteAllESRForms();
}
