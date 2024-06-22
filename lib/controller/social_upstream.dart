import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/social_inquiry_form_model.dart';

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
