class ApiConstants {

  static bool isLocal = true;

  static const liveBaseUrl = "https://sfaapipaint.astralPaints.com/";
  static const uatBaseUrl = "https://sfauat.astralpaints.com/";

  final String _baseURL = isLocal ? uatBaseUrl : liveBaseUrl;

  String get baseURL => _baseURL;

  static const String getMeetData = 'api/common/Meet/GetMeetData';
}