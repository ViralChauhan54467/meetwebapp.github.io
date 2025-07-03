import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_drop_down.dart';
import 'package:meetwebapp/common/widgets/custom_text.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/constants/app_constants.dart';
import 'package:meetwebapp/model/meet_user_detail_model.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

  ValueNotifier<String> selectedUser = ValueNotifier('');

  List<MeetUserDetailModel> meetUserList = [
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50001',
      userName: 'Ashvin',
      city: 'Ahmedabad',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50002',
      userName: 'Samarth',
      city: 'Surat',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50003',
      userName: 'Gopal',
      city: 'Baroda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50004',
      userName: 'Ronil',
      city: 'Bharuch',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50005',
      userName: 'Mahesh',
      city: 'Kheda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50001',
      userName: 'Ashvin',
      city: 'Ahmedabad',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50002',
      userName: 'Samarth',
      city: 'Surat',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50003',
      userName: 'Gopal',
      city: 'Baroda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50004',
      userName: 'Ronil',
      city: 'Bharuch',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50005',
      userName: 'Mahesh',
      city: 'Kheda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50001',
      userName: 'Ashvin',
      city: 'Ahmedabad',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50002',
      userName: 'Samarth',
      city: 'Surat',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50003',
      userName: 'Gopal',
      city: 'Baroda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50004',
      userName: 'Ronil',
      city: 'Bharuch',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50005',
      userName: 'Mahesh',
      city: 'Kheda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50001',
      userName: 'Ashvin',
      city: 'Ahmedabad',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50002',
      userName: 'Samarth',
      city: 'Surat',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50003',
      userName: 'Gopal',
      city: 'Baroda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50004',
      userName: 'Ronil',
      city: 'Bharuch',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50005',
      userName: 'Mahesh',
      city: 'Kheda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50001',
      userName: 'Ashvin',
      city: 'Ahmedabad',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50002',
      userName: 'Samarth',
      city: 'Surat',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50003',
      userName: 'Gopal',
      city: 'Baroda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50004',
      userName: 'Ronil',
      city: 'Bharuch',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50005',
      userName: 'Mahesh',
      city: 'Kheda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50001',
      userName: 'Ashvin',
      city: 'Ahmedabad',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50002',
      userName: 'Samarth',
      city: 'Surat',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50003',
      userName: 'Gopal',
      city: 'Baroda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50004',
      userName: 'Ronil',
      city: 'Bharuch',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
    MeetUserDetailModel(
      meetID: 'SGA760001',
      userID: '50005',
      userName: 'Mahesh',
      city: 'Kheda',
      mobile: '8585858585',
      segment: 'Decorative',
      giftName: 'Cap',
      isAttend: '0',
    ),
  ];

  Widget createUserListTable(List<MeetUserDetailModel> meetUserDetailList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: h75),
      child: DataTable(
        border: TableBorder(
          horizontalInside: BorderSide(color: AppColor.white, width: w1),
          borderRadius: BorderRadius.circular(AppFontSize.m20),
          bottom: BorderSide(color: AppColor.black, width: w1),
          top: const BorderSide(color: AppColor.white, width: 0),
          left: const BorderSide(color: AppColor.white, width: 0),
          right: const BorderSide(color: AppColor.white, width: 0),
        ),
        dataRowMaxHeight: h70,
        headingRowHeight: h65,
        headingTextStyle: TextStyle(color: AppColor.white, fontSize: AppFontSize.m12),
        headingRowColor: WidgetStateProperty.all<Color>(AppColor.primaryColor),
        dataTextStyle: TextStyle(color: AppColor.black, fontSize: AppFontSize.m11p5, overflow: TextOverflow.ellipsis),
        showCheckboxColumn: false,
        sortColumnIndex: 0,
        columnSpacing: w16,
        horizontalMargin: w16,
        columns: createColumns(),
        rows: createRows(meetUserDetailList),
      ),
    );
  }

  List<DataColumn> createColumns() {
    return [
      DataColumn(
        numeric: false,
        label: Expanded(
          child: CustomText(
            text: AppConstants.sSRNo,
            size: AppFontSize.m12,
            fontWeight: FontWeight.normal,
            align: TextAlign.center,
          ),
        ),
      ),
      DataColumn(
        numeric: false,
        label: Expanded(
          child: CustomText(
            text: AppConstants.sName,
            size: AppFontSize.m12,
            fontWeight: FontWeight.normal,
            align: TextAlign.center,
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: CustomText(
            text: AppConstants.sMobile,
            size: AppFontSize.m12,
            fontWeight: FontWeight.normal,
            align: TextAlign.center,
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: CustomText(
            text: AppConstants.sCity,
            size: AppFontSize.m12,
            fontWeight: FontWeight.normal,
            align: TextAlign.center,
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: CustomText(
            text: AppConstants.sDelete,
            size: AppFontSize.m12,
            fontWeight: FontWeight.normal,
            align: TextAlign.center,
          ),
        ),
      ),
    ];
  }

  List<DataRow> createRows(List<MeetUserDetailModel> meetUserDetailList) {
    return <DataRow>[
      ...List.generate(
          meetUserDetailList.length,
              (index) => DataRow(
              color: WidgetStateProperty.resolveWith((state) => AppColor.white),
              cells: [
                DataCell(
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      text: (index + 1).toString(),
                      size: AppFontSize.m12,
                      fontWeight: FontWeight.normal,
                      color: AppColor.black,
                    ),
                  ),
                ),
                DataCell(
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: meetUserDetailList[index].userName.toString(),
                      size: AppFontSize.m12,
                      fontWeight: FontWeight.normal,
                      color: AppColor.black,
                    ),
                  ),
                ),
                DataCell(
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      text: meetUserDetailList[index].mobile.toString(),
                      size: AppFontSize.m12,
                      fontWeight: FontWeight.normal,
                      color: AppColor.black,
                    ),
                  ),
                ),
                DataCell(
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      text: meetUserDetailList[index].city.toString(),
                      size: AppFontSize.m12,
                      fontWeight: FontWeight.normal,
                      color: AppColor.black,
                    ),
                  ),
                ),
                DataCell(
                  onTap: () {

                  },
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.delete,
                      size: 24.r,
                      color: AppColor.red,
                    ),
                  ),
                )
              ]))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBGColor,
      body: Padding(
        padding: EdgeInsets.all(h16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            16.verticalSpace,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomDropDown(
                    isRequired: true,
                    dropDownHeader: 'User',
                    dropDownData: [],
                    selectedValue: selectedUser,
                    onItemSelected: (selectedList) {
                      List<String> list = [];
                      for (var item in selectedList) {
                        list.add(item.name ?? '');
                        selectedUser.value = item.name ?? '';
                      }
                    },
                  ),
                ),
                10.horizontalSpace,
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      color: AppColor.primaryColor,
                    ),
                    padding: EdgeInsets.all(10.r),
                    child: Row(

                      children: [
                        Icon(
                          Icons.add,
                          color: AppColor.white,
                          size: 20.r,
                        ),

                        CustomText(
                          text: AppConstants.sAdd,
                          size: AppFontSize.m14,
                          fontWeight: FontWeight.w800,
                          color: AppColor.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            16.verticalSpace,

            Expanded(
              child: SingleChildScrollView(
                child: createUserListTable(meetUserList),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
