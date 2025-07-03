import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_app_button/app_button.dart';
import 'package:meetwebapp/common/widgets/custom_divider_painter.dart';
import 'package:meetwebapp/common/widgets/custom_text.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/constants/app_constants.dart';
import 'package:meetwebapp/model/meet_data_model.dart';
import 'package:meetwebapp/screens/add_user_demo/add_user_demo_screen.dart';
import 'package:meetwebapp/screens/meet/add_user_screen.dart';
import 'package:meetwebapp/screens/meet/attendance_screen.dart';

class MeetDetailScreen extends StatefulWidget {

  final MeetDataModel meetData;

  const MeetDetailScreen({super.key, required this.meetData});

  @override
  State<MeetDetailScreen> createState() => _MeetDetailScreenState();
}

class _MeetDetailScreenState extends State<MeetDetailScreen> {

  List<Map<String, dynamic>> meetActivityInfo = [
    {"meetDetailActivity": AppConstants.sAttendance, 'id': 0},
    {"meetDetailActivity": AppConstants.sAddUser, 'id': 1},
  ];

  Widget meetDetailText({required String title, required String text,}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          size: AppFontSize.m12,
          fontWeight: FontWeight.normal,
          color: AppColor.black,
        ),
        CustomText(
          text: text,
          size: AppFontSize.m14,
          fontWeight: FontWeight.w600,
          color: AppColor.black,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBGColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(h16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              16.verticalSpace,

              Padding(
                padding: EdgeInsets.only(left: w16, top: h10),
                child: CustomText(
                  text: AppConstants.sActivity,
                  size: AppFontSize.m16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
              ),

              5.verticalSpace,

              GridView.builder(
                itemCount: meetActivityInfo.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: h20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 0.74, crossAxisCount: 3, crossAxisSpacing: 1 / 2, mainAxisSpacing: 1 / 6),
                itemBuilder: (context, index) {
                  return CustomAppButton(
                    onPressed: () {

                      final id = meetActivityInfo[index]['id'];

                      if (id == 0) {
                        Get.to(() => const AttendanceScreen());
                      } else if (id == 1) {
                        //Get.to(() => const AddUserScreen());
                        Get.to(() => const AddUserDemoScreen());
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(w16),
                          margin: EdgeInsets.symmetric(horizontal: w20),
                          decoration: BoxDecoration(
                            color: const Color(0xffEEF1FA),
                            borderRadius: BorderRadius.all(Radius.circular(AppFontSize.m16)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.primaryColor.withOpacity(0.19),
                                spreadRadius: AppFontSize.m2,
                                blurRadius: AppFontSize.m5,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.add_shopping_cart,
                            size: h22,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: h6,
                        ),
                        CustomText(
                          text: meetActivityInfo[index]['meetDetailActivity'],
                          size: AppFontSize.m12,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  );
                },
              ),

              5.verticalSpace,

              Container(
                alignment: Alignment.centerLeft,
                width: 1.sw,
                height: 0,
                child: CustomPaint(
                  painter: CustomDividerPainter(1.sw),
                ),
              ),

              16.verticalSpace,

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    meetDetailText(
                      title: AppConstants.sMeetId,
                      text: widget.meetData.meetID ?? '',
                    ),

                    12.verticalSpace,

                    meetDetailText(
                      title: AppConstants.sMeetType,
                      text: widget.meetData.meetType ?? '',
                    ),

                    12.verticalSpace,

                    meetDetailText(
                      title: AppConstants.sMeetPlanDate,
                      text: widget.meetData.meetDate ?? '',
                    ),

                    12.verticalSpace,

                    meetDetailText(
                      title: AppConstants.sMeetEmpName,
                      text: widget.meetData.meetCreatedBy ?? '',
                    ),

                    12.verticalSpace,

                    meetDetailText(
                      title: AppConstants.sDealerName,
                      text: widget.meetData.dealer ?? '',
                    ),

                    12.verticalSpace,

                    meetDetailText(
                      title: AppConstants.sMeetSegment,
                      text: widget.meetData.segment ?? '',
                    ),

                    12.verticalSpace,

                    meetDetailText(
                      title: AppConstants.sNoUser,
                      text: widget.meetData.noOfUser ?? '',
                    ),

                    12.verticalSpace,

                    meetDetailText(
                      title: AppConstants.sFoodBudget,
                      text: widget.meetData.foodBudget ?? '',
                    ),

                    12.verticalSpace,

                    meetDetailText(
                      title: AppConstants.sMeetGiftBudget,
                      text: widget.meetData.giftBudget ?? '',
                    ),

                    12.verticalSpace,

                    meetDetailText(
                      title: AppConstants.sMeetStatus,
                      text: widget.meetData.meetStatus ?? '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
