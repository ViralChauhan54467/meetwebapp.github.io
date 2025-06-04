import 'package:flutter/cupertino.dart';
import 'package:meetwebapp/constants/api_constants.dart';
import 'package:meetwebapp/model/meet_data_model.dart';
import 'package:meetwebapp/network/api.dart';
import 'package:meetwebapp/utils/toast.dart';
import 'package:meetwebapp/utils/utils.dart';

class MeetProvider with ChangeNotifier {

  final ValueNotifier isLoading = ValueNotifier(false);

  List<MeetDataModel>? meetDataList;

  Future getMeetDataList() async {
    isLoading.value = true;
    notifyListeners();

    bool isNetworkConnected = await Utils().isNetworkConnected();

    try {

      if (isNetworkConnected) {

        Map<String, dynamic> params = {};

        var response = await Api().post(ApiConstants.getMeetData, params: params);
        if (response["data"] != null &&
            response["statusCode"].toString() == "200") {

          meetDataList = response["data"].isEmpty
              ? []
              : List<MeetDataModel>.from(response["data"].map((x) => MeetDataModel.fromJson(x)));

          isLoading.value = false;
          notifyListeners();
        } else {
          isLoading.value = false;
          notifyListeners();
          errorToast(response["responseMessage"].toString());
        }
      }
    } catch (e) {
      errorToast(e.toString());
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}