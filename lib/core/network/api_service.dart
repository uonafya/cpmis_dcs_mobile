import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/core/network/preferences.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/closure_followup_model.dart';
import 'package:cpims_dcs_mobile/models/notification_model.dart';
import 'package:cpims_dcs_mobile/models/social_inquiry_form_model.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/utils/constants_crs.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  String _queryParams(Map<String, dynamic> params) =>
      '?${params.entries.map((map) => '${map.key}=${map.value}').toList().join('&')}';
  Future<Map<String, dynamic>> refreshToken() async {
    String? refreshToken = preferences.getString('refresh');

    final response = await httpClient.request(
      'token/refresh/',
      'POST',
      {
        'refresh': refreshToken,
      },
    );
    await preferences.remove('access');
    await preferences.setString('access', response.data['access']);
    return response.data;
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await httpClient.request(
      'token/',
      'POST',
      {
        'username': username,
        'password': password,
      },
    );

    return response.data;
  }

  static List<Map<String, dynamic>> fetchCrsData() {
    return caseLoadDummy;
  }

  Future<void> fetchAndInsertCaseload({
    required String deviceID,
  }) async {
    try {
      final response = await httpClient.request(
        'mobile/caseload/',
        'GET',
        {
          'deviceID': deviceID,
        },
      );

      List<CaseLoadModel> caseLoadData = [];

      for (var caseLoad in response.data) {
        caseLoadData.add(CaseLoadModel.fromJson(caseLoad));
      }

      await LocalDB.instance.insertMultipleCaseLoad(caseLoadData);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while inserting caseload data $e');
      }
    }
  }

  Future<List<NotificationModel>> getNotifications() async {
    final response = await httpClient.request(
      'mobile/notifications/',
      'GET',
      {},
    );

    return response.data
        .map<NotificationModel>(
            (notification) => NotificationModel.fromJson(notification))
        .toList();
  }

  Future<void> sendSocialInquiry(SocialInquiryFormModel inquiry) async {
    try {
      final response = await httpClient.request(
        'mobile/forms/',
        'POST',
        inquiry.toJson(),
      );
      print(response.data);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while sending social inquiry $e');
      }
    }
  }

  Future<void> sendClosureFollowup(Map<String, dynamic> closure) async {
    try {
      final response = await httpClient.request(
        'mobile/follow_up/',
        'POST',
        closure,
      );
      print(response.data);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while sending closure followup $e');
      }
      throw e;
    }
  }

  Future<void> sendServiceFollowup(Map<String, dynamic> service) async {
    try {
      final response = await httpClient.request(
        'mobile/follow_up/', // Make sure this endpoint is correct for service followups
        'POST',
        service,
      );
      print(response.data);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while sending service followup $e');
      }
      throw e;
    }
  }

  Future<void> sendESRForm(Map<String, dynamic> esr) async {
    try {
      final response = await httpClient.request(
        'mobile/forms/',
        'POST',
        esr,
      );
      print(response.data);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while sending social inquiry $e');
      }
    }
  }
}

final apiService = ApiService();
