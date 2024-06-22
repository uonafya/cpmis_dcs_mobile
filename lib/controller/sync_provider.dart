import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/social_inquiry_form_model.dart';
import 'package:cpims_dcs_mobile/models/cci_transition.dart';

Future<void> syncData() async {
  final db = await LocalDB.instance.database;
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
}



Future<void> syncCciTransitionData() async {
  print("data for cci Transition");
  final db = await LocalDB.instance.database;
  //Get all social inquiries
  final transitions = await db.query(cciTransitionTable);
  print(transitions);
  for (var transition in transitions) {
    final ccitrans = CciTransitionModel.fromJson(transition);
    await apiService.sendCciTransition(ccitrans);
    final cciTransId = transition['id'];

    await db
        .delete(socialInquiryTable, where: 'id = ?', whereArgs: [cciTransId]);
  }
}