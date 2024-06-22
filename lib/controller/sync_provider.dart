// ignore_for_file: avoid_print

import 'package:cpims_dcs_mobile/controller/closure_upstream.dart';
import 'package:cpims_dcs_mobile/controller/loadLocationFromUpstream.dart';
import 'package:cpims_dcs_mobile/controller/referral_upstream.dart';
import 'package:cpims_dcs_mobile/controller/services_upstream.dart';
import 'package:cpims_dcs_mobile/controller/session_upstream.dart';
import 'package:cpims_dcs_mobile/controller/social_upstream.dart';
import 'package:cpims_dcs_mobile/controller/summons_upstream.dart';
import 'package:cpims_dcs_mobile/controller/sync_crs.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';

import 'package:cpims_dcs_mobile/core/network/database.dart';

import 'package:cpims_dcs_mobile/models/cci_transition.dart';

import 'package:cpims_dcs_mobile/core/network/countries.dart';
import 'package:cpims_dcs_mobile/core/network/metadata.dart';
import 'package:cpims_dcs_mobile/core/network/mobile_settings.dart';

import 'package:cpims_dcs_mobile/views/widgets/initial_loader.dart';
import 'package:flutter/cupertino.dart';

Future<void> syncData(BuildContext context) async {
  final String deviceID = await getDeviceID(context);

  await Future.wait([
    //TO UPSTREAM
    sendServicesUpstream(),
    sendCourtSummonsUpstream(),
    sendClosureUpstream(),
    sendSocialInquiryUpstream(),
    sendESRUpstream(),
    sendCourtSessionsUpstream(),
    sendReferralsUpstream(),
    syncCciTransitionData(),

    syncCRS(),

    //FROM UPSTREAM
    apiService.fetchAndInsertCaseload(deviceID: deviceID),
    loadLocationFromUpstream(),
    saveOrganizationUnits(),
    saveCountries(),
    saveMetadata(),
  ]);
}

Future<void> syncCciTransitionData() async {
  final db = await LocalDB.instance.database;
  //Get all social inquiries
  final transitions = await db.query(cciTransitionTable);
  print("data for cci Transition: -> {$transitions}");
  print(transitions);
  for (var transition in transitions) {
    final ccitrans = CciTransitionModel.fromJson(transition);
    await apiService.sendCciTransition(ccitrans);
    final cciTransId = transition['id'];
    print("Sent cci id: {$cciTransId} --- > {$transition} --->  {$ccitrans}");

    await db
        .delete(cciTransitionTable, where: 'id = ?', whereArgs: [cciTransId]);
  }
}
