import 'package:flutter/material.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_text.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/model/meet_data_model.dart';

class MeetViewWidget extends StatelessWidget {

  final MeetDataModel meetData;

  const MeetViewWidget({super.key, required this.meetData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: h8),
      padding: EdgeInsets.symmetric(horizontal: w12, vertical: h12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(Radius.circular(AppFontSize.m4),),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomText(
            text: meetData.meetID ?? '',
            color: AppColor.primaryColor,
            size: AppFontSize.m15,
            fontWeight: FontWeight.w800,
          ),

          CustomText(
            text: meetData.dealer ?? '',
            color: AppColor.black,
            size: AppFontSize.m15,
            fontWeight: FontWeight.w800,
          ),

          CustomText(
            text: meetData.meetType ?? '',
            color: AppColor.black,
            size: AppFontSize.m15,
            fontWeight: FontWeight.normal,
          ),

          CustomText(
            text: meetData.meetStatus ?? '',
            color: AppColor.black,
            size: AppFontSize.m15,
            fontWeight: FontWeight.normal,
          ),

          CustomText(
            text: meetData.noOfUser ?? '',
            color: AppColor.black,
            size: AppFontSize.m15,
            fontWeight: FontWeight.normal,
          ),

          CustomText(
            text: meetData.meetCreatedBy ?? '',
            color: AppColor.black,
            size: AppFontSize.m15,
            fontWeight: FontWeight.w800,
          ),

          CustomText(
            text: meetData.meetDate ?? '',
            color: AppColor.black,
            size: AppFontSize.m15,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
