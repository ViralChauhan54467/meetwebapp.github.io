import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_app_button/app_button.dart';
import 'package:meetwebapp/common/widgets/custom_text.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/constants/app_constants.dart';
import 'package:meetwebapp/screens/meet/meet_list_screen.dart';

class MaintenanceScreen extends StatelessWidget {

  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: AppColor.white,
            height: 1.sh,
            width: 1.sw,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w38p5),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.gear,
                      color: AppColor.primaryColor,
                      size: 32.r,
                    ),
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
          Container(
            alignment: Alignment.bottomCenter,
            width: 1.sw,
            padding: EdgeInsets.only(
              bottom: h10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomAppButton(
                  onPressed: () {
                    Get.offAll(() => const MeetListScreen());
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: w20, vertical: h8),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppFontSize.m15))),
                    height: h40,
                    width: w173,
                    child: Center(
                      child: Text(
                        AppConstants.sRefresh,
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: AppFontSize.m16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700),
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
                        EdgeInsets.symmetric(horizontal: w30, vertical: h8),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppFontSize.m15))),
                    height: h40,
                    width: w173,
                    child: Center(
                      child: Text(
                        AppConstants.sClose,
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: AppFontSize.m16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700),
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
