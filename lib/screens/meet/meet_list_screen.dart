import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_app_button/app_button.dart';
import 'package:meetwebapp/common/widgets/custom_drop_down.dart';
import 'package:meetwebapp/common/widgets/custom_text.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/constants/app_date_format.dart';
import 'package:meetwebapp/model/meet_data_model.dart';
import 'package:meetwebapp/screens/meet/add_meet_screen.dart';
import 'package:meetwebapp/screens/meet/meet_detail_screen.dart';
import 'package:meetwebapp/screens/meet/meet_view_widget.dart';

class MeetListScreen extends StatefulWidget {
  const MeetListScreen({super.key});

  @override
  State<MeetListScreen> createState() => _MeetListScreenState();
}

class _MeetListScreenState extends State<MeetListScreen> {

  String fromDate = DateFormat(AppDateFormat.selectedDateFormat).format(DateTime.now());
  String toDate = DateFormat(AppDateFormat.selectedDateFormat).format(DateTime.now());

  ValueNotifier<String> selectedMeetTypeValue = ValueNotifier('');
  ValueNotifier<String> selectedMeetStatusValue = ValueNotifier('');

  List<MeetDataModel> meetDataList = [
    MeetDataModel(
      bDE: 'Manikanta M (A BDE)',
      l10Name: 'Harsha H P',
      l20Name: 'Rohith Bn',
      l30L25Name: 'Sachin V Anwekar',
      meetCreatedBy: 'Harsha H P',
      meetDate: '01 May 2025',
      meetID: 'SGA760001',
      meetType: 'SGA',
      beat: 'Beat 1',
      dealer: 'AAIJI ELECTRICALS AND HARDWARE(GH)',
      segment: 'Decorative',
      typeofInitiative: 'Demand Generation',
      noOfUser: '25',
      foodBudget: '2000.00',
      giftBudget: '0.00',
      meetStatus: 'Approved',
      city: 'MYSORE',
    ),
    MeetDataModel(
      bDE: 'Ramesh Vijay (SO)',
      l10Name: 'Maahi V L',
      l20Name: 'Robin J',
      l30L25Name: 'Goli C Mubin',
      meetCreatedBy: 'Maahi V L',
      meetDate: '05 May 2025',
      meetID: 'SGA760002',
      meetType: 'SGA',
      beat: 'Beat 1',
      dealer: 'Anand Colour Point',
      segment: 'Decorative',
      typeofInitiative: 'Demand Generation',
      noOfUser: '25',
      foodBudget: '2000.00',
      giftBudget: '0.00',
      meetStatus: 'Approved',
      city: 'MYSORE',
    ),
    MeetDataModel(
      bDE: 'Manikanta M (A BDE)',
      l10Name: 'Harsha H P',
      l20Name: 'Rohith Bn',
      l30L25Name: 'Sachin V Anwekar',
      meetCreatedBy: 'Harsha H P',
      meetDate: '01 May 2025',
      meetID: 'SGA760001',
      meetType: 'SGA',
      beat: 'Beat 1',
      dealer: 'AAIJI ELECTRICALS AND HARDWARE(GH)',
      segment: 'Decorative',
      typeofInitiative: 'Demand Generation',
      noOfUser: '25',
      foodBudget: '2000.00',
      giftBudget: '0.00',
      meetStatus: 'Approved',
      city: 'MYSORE',
    ),
    MeetDataModel(
      bDE: 'Ramesh Vijay (SO)',
      l10Name: 'Maahi V L',
      l20Name: 'Robin J',
      l30L25Name: 'Goli C Mubin',
      meetCreatedBy: 'Maahi V L',
      meetDate: '05 May 2025',
      meetID: 'SGA760002',
      meetType: 'SGA',
      beat: 'Beat 1',
      dealer: 'Anand Colour Point',
      segment: 'Decorative',
      typeofInitiative: 'Demand Generation',
      noOfUser: '25',
      foodBudget: '2000.00',
      giftBudget: '0.00',
      meetStatus: 'Approved',
      city: 'MYSORE',
    ),
    MeetDataModel(
      bDE: 'Manikanta M (A BDE)',
      l10Name: 'Harsha H P',
      l20Name: 'Rohith Bn',
      l30L25Name: 'Sachin V Anwekar',
      meetCreatedBy: 'Harsha H P',
      meetDate: '01 May 2025',
      meetID: 'SGA760001',
      meetType: 'SGA',
      beat: 'Beat 1',
      dealer: 'AAIJI ELECTRICALS AND HARDWARE(GH)',
      segment: 'Decorative',
      typeofInitiative: 'Demand Generation',
      noOfUser: '25',
      foodBudget: '2000.00',
      giftBudget: '0.00',
      meetStatus: 'Approved',
      city: 'MYSORE',
    ),
    MeetDataModel(
      bDE: 'Ramesh Vijay (SO)',
      l10Name: 'Maahi V L',
      l20Name: 'Robin J',
      l30L25Name: 'Goli C Mubin',
      meetCreatedBy: 'Maahi V L',
      meetDate: '05 May 2025',
      meetID: 'SGA760002',
      meetType: 'SGA',
      beat: 'Beat 1',
      dealer: 'Anand Colour Point',
      segment: 'Decorative',
      typeofInitiative: 'Demand Generation',
      noOfUser: '25',
      foodBudget: '2000.00',
      giftBudget: '0.00',
      meetStatus: 'Approved',
      city: 'MYSORE',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBGColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppFontSize.m6))),
        onPressed: () async {
          Get.to(() => const AddMeetScreen());
        },
        child: Icon(
          Icons.add,
          color: AppColor.white,
          size: AppFontSize.m50,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(h16),
        child: Column(
          children: [

            32.verticalSpace,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateFormat(AppDateFormat.selectedDateFormat).parse(fromDate),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now());
                      fromDate = DateFormat(AppDateFormat.selectedDateFormat).format(pickedDate ?? DateTime.now());
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: fromDate,
                            size: 10,
                            fontWeight: FontWeight.w300,
                            color: AppColor.primaryColor,
                          ),
                          30.horizontalSpace,
                          const Icon(
                            Icons.calendar_month,
                            size: 18,
                            color: AppColor.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                15.horizontalSpace,
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateFormat(AppDateFormat.selectedDateFormat).parse(toDate),
                          firstDate: DateFormat(AppDateFormat.selectedDateFormat).parse(fromDate),
                          lastDate: DateTime.now());
                      toDate = DateFormat(AppDateFormat.selectedDateFormat).format(pickedDate ?? DateTime.now());
                      setState(() {});
                    },
                    child: Container(
                      constraints: BoxConstraints(minWidth: 1.sw / 3),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            text: toDate,
                            size: 10,
                            fontWeight: FontWeight.w300,
                            color: AppColor.primaryColor,
                          ),
                          30.horizontalSpace,
                          const Icon(
                            Icons.calendar_month,
                            size: 18,
                            color: AppColor.primaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                10.horizontalSpace,
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: AppColor.primaryColor,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.search,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),

            16.verticalSpace,

            CustomDropDown(
              isRequired: true,
              dropDownHeader: 'Meet Type',
              dropDownData: [],
              selectedValue: selectedMeetTypeValue,
              onItemSelected: (selectedList) {
                List<String> list = [];
                for (var item in selectedList) {
                  list.add(item.name ?? '');
                  selectedMeetTypeValue.value = item.name ?? '';
                }
              },
            ),

            16.verticalSpace,

            CustomDropDown(
              isRequired: true,
              dropDownHeader: 'Meet Status',
              dropDownData: [],
              selectedValue: selectedMeetStatusValue,
              onItemSelected: (selectedList) {
                List<String> list = [];
                for (var item in selectedList) {
                  list.add(item.name ?? '');
                  selectedMeetStatusValue.value = item.name ?? '';
                }
              },
            ),

            8.verticalSpace,

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: meetDataList.length,
                itemBuilder: (context, index) {

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 44,
                      child: FadeInAnimation(
                        child: CustomAppButton(
                          onPressed: () {
                            Get.to(() => MeetDetailScreen(meetData: meetDataList[index]));
                          },
                          child: MeetViewWidget(meetData: meetDataList[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
