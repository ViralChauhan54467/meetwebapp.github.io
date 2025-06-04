import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meetwebapp/screens/maintenance/maintenance_screen.dart';
import 'package:meetwebapp/constants/api_constants.dart';
import 'package:meetwebapp/network/logging_client.dart';

final httpClient = LoggingClient(http.Client());

class OptionsApi {
  bool checkStatus;
  bool refreshToken;

  OptionsApi({
    this.checkStatus = true,
    this.refreshToken = false,
  });
}

class Api {
  static Api? _instance;
  static const String _responseErrorKey = 'error';
  static const String _responseMessageKey = 'message';

  factory Api() => _instance ?? Api._internal();

  Api._internal() {
    _instance = this;
  }

  Future<Map<String, dynamic>> get(
    String domain,
    String endpoint, {
    dynamic params,
    OptionsApi? options,
  }) async {
    options ??= OptionsApi();
    return _handleResponse(
        await httpClient.get(
          Uri.parse(ApiConstants().baseURL + endpoint).replace(queryParameters: params),
          headers: _getHeaders(),
        ),
        options);
  }

  Future<Map<String, dynamic>> post(
    String endpoint, {
    dynamic params,
    OptionsApi? options,
  }) async {
    options ??= OptionsApi();
    return _handleResponse(
      await httpClient.post(
        Uri.parse(ApiConstants().baseURL + endpoint),
        headers: _getHeaders(),
        body: jsonEncode(params),
      ),
      options,
    );
  }

  Future<Map<String, dynamic>> patch(
    String domain,
    String endpoint, {
    dynamic params,
    OptionsApi? options,
  }) async {
    options ??= OptionsApi();
    return _handleResponse(
      await httpClient.patch(
        Uri.parse(ApiConstants().baseURL + endpoint),
        headers: _getHeaders(),
        body: jsonEncode(params),
      ),
      options,
    );
  }

  Future<Map<String, dynamic>> _handleResponse(
      http.Response response, OptionsApi options) async {
    switch (response.statusCode) {
      case 200:
      case 401:
      case 400:
      case 404:
        return _parseResponse(response.body, options);
      case 500:
        Get.offAll(() => const MaintenanceScreen());
        return Future.error("");
      default:
        return Future.error(
          'Response code: ${response.statusCode.toString()} | ${response.body}',
        );
    }
  }

  Map<String, String> _getHeaders() {
    return {'accept': '*/*', 'Content-Type': 'application/json'};
  }

  Map<String, dynamic> _parseResponse(String body, OptionsApi? options) {
    final Map<String, dynamic> resJson = jsonDecode(body);
    // check error
    if (options!.checkStatus) {
      if (resJson.containsKey(_responseErrorKey) &&
          resJson[_responseErrorKey]) {
        throw RoundException(resJson[_responseMessageKey]);
      }
    }
    return resJson;
  }
}

class RoundException implements Exception {
  final String message;

  RoundException(this.message);

  @override
  String toString() {
    return message;
  }
}
