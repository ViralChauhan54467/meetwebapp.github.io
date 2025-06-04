import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/constants/app_colors.dart';

successToast(String toastMessage) {
  return Fluttertoast.showToast(
      msg: toastMessage,
      backgroundColor:
          toastMessage == "" ? AppColor.transparent : Color(0xFF6BE070),
      fontSize: AppFontSize.m16,
      textColor: AppColor.white,
      gravity: ToastGravity.BOTTOM);
}

errorToast(String toastMessage) {
  return Fluttertoast.showToast(
      msg: toastMessage,
      backgroundColor:
          toastMessage == "" ? AppColor.transparent : Color(0xFFDE837C),
      fontSize: AppFontSize.m16,
      textColor: AppColor.white,
      gravity: ToastGravity.BOTTOM);
}

warningToast(String toastMessage) {
  return Fluttertoast.showToast(
      msg: toastMessage,
      backgroundColor:
          toastMessage == "" ? AppColor.transparent : AppColor.primaryColor,
      fontSize: AppFontSize.m16,
      textColor: AppColor.white,
      gravity: ToastGravity.BOTTOM);
}
