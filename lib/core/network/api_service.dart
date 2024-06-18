import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/core/network/preferences.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';

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
    return List<Map<String, dynamic>>.generate(
      10,
      (index) => {
        "id": index + 1,
        "first_name": "John",
        "surname": "Doee",
        "sex": "male",
        "org_unit": "Kisumu",
        "residence": "Kisumu",
        "previous_cases": 1,
      },
    );
  }

  Future<List<CaseLoadModel>> fetchCaseLoad(String deviceID) async {
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

    return caseLoadData;
  }
}

final apiService = ApiService();
