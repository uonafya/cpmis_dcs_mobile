import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/core/network/preferences.dart';

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
}

final apiService = ApiService();
