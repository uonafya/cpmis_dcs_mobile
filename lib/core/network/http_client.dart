// ignore_for_file: avoid_print

import 'package:cpims_dcs_mobile/core/network/dio_request_logger.dart';
import 'package:cpims_dcs_mobile/core/network/preferences.dart';
import 'package:dio/dio.dart';

class HttpClient {
  Dio? _dio;

  Future<void> initialize() async {
    _dio = Dio(BaseOptions(
      baseUrl: "https://dev.cpims.net/mobile/",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'user-agent': 'Dio/4.0.6',
      },
    ))
      ..interceptors.add(DioRequestLogger(level: Level.BASIC))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: _onEveryRequest,
        onError: _onEveryRequestError,
      ));
  }

  Future<Response> request(String url, String method, data) async {
    Response response = await _dio!.request(
      url,
      data: data,
      options: Options(method: method),
    );

    return response;
  }

  Future<void> _onEveryRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = preferences.getString("token");

    if (accessToken != null) {
      // printSuccess("ACCESS TOKEN : $accessToken");
      options.headers['Authorization'] = "Bearer $accessToken";
    }
    handler.next(options);
  }

  Future<void> _onEveryRequestError(
      DioError error, ErrorInterceptorHandler handler) async {
    print(error.response?.data);
    print(error.response?.realUri);
    if (error.response?.statusCode == 401) {
      //Sign out
      await preferences.clear();

      return;
    }
    if (error.type == DioErrorType.badResponse) {
      return handler.next(DioError(
        requestOptions: error.requestOptions,
        response: error.response,
        error: error.response?.data ?? error.message,
        type: error.type,
      ));
    }

    if (error.message != null && error.message!.contains("SocketException")) {
      return handler.next(DioError(
        requestOptions: error.requestOptions,
        response: error.response,
        error: "It appears you don't have internet. Please try again later.",
        type: error.type,
      ));
    }

    return handler.next(error);
  }

  Future _refreshAccessToken() async {
    final refreshToken = preferences.getString("token");
    if (refreshToken != null) {
      // final response = await request(
      //   '${IDENTITY_SERVICE_URL}token_renew',
      //   'GET',
      //   {'data': refreshToken},
      // );

      // //Save new token
      // await preferences.setString("token", response.data['data']['token']);
    }
  }
}

final httpClient = HttpClient();
