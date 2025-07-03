import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meetwebapp/constants/api_constants.dart';
import 'package:meetwebapp/main.dart';
import 'package:meetwebapp/model/user_model.dart';
import 'package:meetwebapp/network/api.dart';
import 'package:meetwebapp/screens/maintenance/maintenance_screen.dart';
import 'package:meetwebapp/screens/meet/meet_list_screen.dart';
import 'package:meetwebapp/utils/toast.dart';
import 'package:meetwebapp/utils/utils.dart';

class AuthProvider with ChangeNotifier {

  final ValueNotifier isLoading = ValueNotifier(false);

  UserModel? userModel;

  Future<void> getAuthData() async {

    isLoading.value = true;
    notifyListeners();

    bool isNetworkConnected = await Utils().isNetworkConnected();

    try {

      if (isNetworkConnected) {

        Map<String, dynamic> params = {
          'mobile': mobile,
          'token': token,
        };

        var response = await Api().post(ApiConstants.getUserAuthData, params: params);
        if (response["data"] != null &&
            response["statusCode"].toString() == "200") {

          printLog(response["data"][0]);
          userModel = UserModel.fromJson(response["data"][0]);
          notifyListeners();
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

  void moveToNextScreen() async {

    Future.delayed(const Duration(seconds: 3), () async {

      if ((mobile ?? '').isNotEmpty && (token ?? '').isNotEmpty) {
        bool isNetworkConnected = await Utils().isNetworkConnected();

        try {

          if (isNetworkConnected) {

            Map<String, dynamic> params = {
              'mobile': mobile,
              'token': token,
            };

            var response = await Api().post(ApiConstants.getUserAuthData, params: params);
            if (response["data"] != null &&
                response["statusCode"].toString() == "200") {

              printLog(response["data"][0]);
              userModel = UserModel.fromJson(response["data"][0]);
              notifyListeners();
              isLoading.value = false;
              notifyListeners();

              Get.off(() => const MeetListScreen());

            } else {
              isLoading.value = false;
              notifyListeners();
              errorToast(response["responseMessage"].toString());
            }
          }
        } catch (e) {
          errorToast(e.toString());
          Get.off(() => const MaintenanceScreen());
        } finally {
          isLoading.value = false;
          notifyListeners();
        }
      } else {
        Get.off(() => const MaintenanceScreen());
      }
    });
  }
}