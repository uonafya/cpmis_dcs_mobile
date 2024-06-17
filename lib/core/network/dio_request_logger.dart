// ignore_for_file: constant_identifier_names, avoid_print, deprecated_member_use

import 'package:dio/dio.dart';

enum Level {
  BASIC,
  HEADERS,
  BODY,
}

class DioRequestLogger extends Interceptor {
  final Level level;

  DioRequestLogger({required this.level});

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final request = response.requestOptions;
    if (level == Level.BASIC) {
      print("${request.method} ${request.uri} [${response.statusCode}]\n");
    } else {
      final buffer = StringBuffer();

      buffer.write("-------------------------------------------------------\n");
      buffer.write("${request.method} ${request.uri}\n");

      if (level == Level.HEADERS) {
        buffer.write("${stringifyHeaders(request.headers)}\n\n\n");
      } else {
        buffer.write("${stringifyHeaders(request.headers)}\n\n");
        buffer.write("${request.data}\n\n\n");
      }

      buffer.write("Response Status: ${response.statusCode}\n");

      if (level == Level.HEADERS) {
        buffer.write("${stringifyHeaders(response.headers.map)}\n");
      } else {
        buffer.write("${stringifyHeaders(response.headers.map)}\n\n");
        buffer.write("${response.data}\n");
      }

      buffer.write("-------------------------------------------------------");
    }
    return handler.next(response);
  }

  String stringifyHeaders(Map<String, dynamic> headers) {
    return headers.keys
        .map((key) => key != "Authorization"
            ? "$key: ${headers[key]}"
            : "$key: [Filtered]")
        .join("\n");
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    print(err);
    return handler.next(err);
  }
}
