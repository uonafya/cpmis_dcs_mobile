// ignore_for_file: avoid_print

import 'package:cpims_dcs_mobile/controller/closure_upstream.dart';
import 'package:cpims_dcs_mobile/controller/loadLocationFromUpstream.dart';
import 'package:cpims_dcs_mobile/controller/referral_upstream.dart';
import 'package:cpims_dcs_mobile/controller/services_upstream.dart';
import 'package:cpims_dcs_mobile/controller/session_upstream.dart';
import 'package:cpims_dcs_mobile/controller/social_upstream.dart';
import 'package:cpims_dcs_mobile/controller/summons_upstream.dart';
import 'package:cpims_dcs_mobile/controller/sync_crs.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
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

    syncCRS(),

    //FROM UPSTREAM
    apiService.fetchAndInsertCaseload(deviceID: deviceID),
    loadLocationFromUpstream(),
    saveOrganizationUnits(),
    saveCountries(),
    saveMetadata(),
  ]);
}
