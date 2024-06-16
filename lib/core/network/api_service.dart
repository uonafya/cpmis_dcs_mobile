import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/core/network/preferences.dart';

class ApiService {
  String _queryParams(Map<String, dynamic> params) =>
      '?${params.entries.map((map) => '${map.key}=${map.value}').toList().join('&')}';
  Future<Map<String, dynamic>> refreshToken() async {
    String? refreshToken = preferences.getString('refresh');

    final response = await httpClient.request(
      '${cpimsApiUrl}api/token/refresh/',
      'POST',
      {
        'refresh': refreshToken,
      },
    );
    await preferences.remove('access');
    await preferences.setString('access', response.data['access']);
    return response.data;
  }
}

final apiService = ApiService();
