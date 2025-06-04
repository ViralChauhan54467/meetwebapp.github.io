import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/constants/app_constants.dart';
import 'package:meetwebapp/model/meet_user_detail_model.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {

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
        dataRowHeight: h70,
        headingRowHeight: h40,
        headingTextStyle: TextStyle(color: AppColor.white, fontSize: AppFontSize.m12),
        headingRowColor: MaterialStateProperty.all<Color>(AppColor.primaryColor),
        dataTextStyle: TextStyle(color: AppColor.black, fontSize: AppFontSize.m11p5, overflow: TextOverflow.ellipsis),
        showCheckboxColumn: false,
        sortColumnIndex: 0,
        columnSpacing: w7,
        horizontalMargin: w7,
        columns: createColumns(),
        rows: createRows(meetUserDetailList),
      ),
    );
  }

  List<DataColumn> createColumns() {
    return [
      const DataColumn(
        numeric: false,
        label: Expanded(
          child: Text(
            textAlign: TextAlign.start,
            AppConstants.sSRNo,
          ),
        ),
      ),
      const DataColumn(
        numeric: false,
        label: Expanded(
          child: Text(
            AppConstants.sName,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      const DataColumn(
        label: Expanded(
          child: Text(
            AppConstants.sMobile,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      const DataColumn(
        label: Expanded(
          child: Text(
            AppConstants.sCity,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      const DataColumn(
        label: Expanded(
          child: Text(
            AppConstants.sGift,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      const DataColumn(
        label: Expanded(
          child: Text(
            AppConstants.sAttendance,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      const DataColumn(
        label: Expanded(
          child: Text(
            AppConstants.sDelete,
            textAlign: TextAlign.start,
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
              color: MaterialStateProperty.resolveWith((state) => AppColor.white),
              cells: [
                DataCell(
                  Text(
                    (index + 1).toString(),
                    textAlign: TextAlign.start,
                    maxLines: 5,
                    style: TextStyle(color: AppColor.black, fontSize: AppFontSize.m10, overflow: TextOverflow.ellipsis, fontFamily: "semi_poppins"),
                  ),
                ),
                DataCell(Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    meetUserDetailList[index].userName.toString(),
                    textAlign: TextAlign.end,
                  ),
                )),
                DataCell(Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    meetUserDetailList[index].mobile.toString(),
                    textAlign: TextAlign.end,
                  ),
                )),
                DataCell(Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    meetUserDetailList[index].city.toString(),
                    textAlign: TextAlign.end,
                  ),
                )),
                DataCell(Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    meetUserDetailList[index].giftName.toString(),
                    textAlign: TextAlign.end,
                  ),
                )),
                DataCell(Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    meetUserDetailList[index].isAttend == '1' ? 'Yes' : 'No',
                    textAlign: TextAlign.end,
                  ),
                )),
                DataCell(
                  onTap: () {

                  },
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.delete,
                      size: AppFontSize .m26,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(h16),
          child: Column(
            children: [
              32.verticalSpace,
              createUserListTable(meetUserList),
            ],
          ),
        ),
      ),
    );
  }
}
