import 'package:flutter/material.dart';

class Validators {
  static BuildContext? context;

  static String? Function(String?, String?) required(String? personalErrorText) {
    return (String? value, String? errorText) {
      if (value == null || value == '') {
        return errorText ?? personalErrorText ?? "Enter Data";
      }
      return null;
    };
  }

  static String? Function(String?, String?) minLength(int minLength) {
    return (String? value, String? personalErrorText) {
      if (value != null && value.length < minLength) {
        return personalErrorText ?? "Please Enter Minimum $minLength Number";
      }
      return null;
    };
  }

  static String? Function(String?, String?) maxLength(int maxLength) {
    return (String? value, String? personalErrorText) {
      if (value != null && value.length > maxLength) {
        return personalErrorText ?? "Please Enter Maximum $maxLength Number";
      }
      return null;
    };
  }

  String? email(String? value, String? personalErrorText) {
    if (value != null && !isEmailValid(value)) {
      return personalErrorText ?? "Please Enter Valid Email Id";
    }
    return null;
  }

  // This method will check email id is valid or not
  bool isEmailValid(String? email) {
    if (email != null) {
      return RegExp(
        //    r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email);
    } else {
      return false;
    }
  }

  static String? nameValidation(String? value, String? personalErrorText) {
    if (value == null || value == '') {
      return personalErrorText ?? "Please Enter Name";
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return personalErrorText ?? "Please Enter Valid Name (Only character allowed";
    }
    return null;
  }
}
