import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoggingClient extends http.BaseClient {
  final http.Client _inner;

  LoggingClient(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    final response = await _inner.send(request);
    return response;
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    var request = Request('POST', url);

    if (headers != null) {
      request.headers.addAll(headers);
    } else if (body is! Map<String, String>) {
      request.headers.addAll({'Content-Type': 'application/json'});
    }

    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }

    final response = await Response.fromStream(await send(request));
    debugPrint(
        '--------------------------------------------------------------');
    if(kDebugMode){
      log('API URL  : $url');
      log('Request  : $body');
      log('Response : ${response.body}');
    }

    debugPrint(
        '--------------------------------------------------------------');
    return response;
  }
}
