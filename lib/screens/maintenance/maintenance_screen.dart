import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_app_button/app_button.dart';
import 'package:meetwebapp/common/widgets/custom_text.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/constants/app_constants.dart';
import 'package:meetwebapp/provider/auth_provider.dart';
import 'package:meetwebapp/screens/meet/meet_list_screen.dart';

class MaintenanceScreen extends StatelessWidget {

  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 1.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      CupertinoIcons.gear,
                      color: AppColor.primaryColor,
                      size: 32.r,
                    ),
                  ),
                  CustomText(
                    text: AppConstants.sMaintenanceMessage,
                    size: AppFontSize.m16,
                    align: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryColor,
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: 1.sw,
            padding: EdgeInsets.only(
              bottom: h16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomAppButton(
                  onPressed: () {
                    AuthProvider().moveToNextScreen();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: w40, vertical: h12),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppFontSize.m15))),
                    child: Center(
                      child: Text(
                        AppConstants.sRefresh,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: AppFontSize.m14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomAppButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: w40, vertical: h12),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppFontSize.m15))),
                    child: Center(
                      child: Text(
                        AppConstants.sClose,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: AppFontSize.m14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
