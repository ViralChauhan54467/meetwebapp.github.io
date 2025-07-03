import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_app_button/app_button.dart';
import 'package:meetwebapp/common/widgets/custom_drop_down.dart';
import 'package:meetwebapp/constants/app_constants.dart';

class AttendanceDialog extends StatefulWidget {

  const AttendanceDialog({super.key});

  @override
  State<AttendanceDialog> createState() => _AttendanceDialogState();
}

class _AttendanceDialogState extends State<AttendanceDialog> {

  ValueNotifier<String> selectedGiftValue = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppFontSize.m18),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(w16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            CustomDropDown(
              isRequired: true,
              dropDownHeader: 'Gift',
              dropDownData: [],
              selectedValue: selectedGiftValue,
              onItemSelected: (selectedList) {
                List<String> list = [];
                for (var item in selectedList) {
                  list.add(item.name ?? '');
                  selectedGiftValue.value = item.name ?? '';
                }
              },
            ),

            16.verticalSpace,

            CustomAppButton(
              text: AppConstants.sSubmit,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
