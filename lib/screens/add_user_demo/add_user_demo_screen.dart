import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_drop_down.dart';
import 'package:meetwebapp/common/widgets/custom_text.dart';
import 'package:meetwebapp/common/widgets/drop_down/model/selected_list_item.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/constants/app_constants.dart';
import 'dart:html' as html;

class AddUserDemoScreen extends StatefulWidget {
  const AddUserDemoScreen({super.key});

  @override
  State<AddUserDemoScreen> createState() => _AddUserDemoScreenState();
}

class _AddUserDemoScreenState extends State<AddUserDemoScreen> {

  String imageDemo = '';

  ValueNotifier<String> selectedType = ValueNotifier('');

  List<SelectedListItem> dealerTypeModel = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {}

  void pickImageFromCamera() {
    final uploadInput = html.FileUploadInputElement();

    uploadInput.accept = 'image/*';
    uploadInput.attributes['capture'] = 'environment'; // 👈 This sets the camera mode

    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files?.first;
      if (file != null) {
        // Handle file here (e.g., read it using FileReader)
        final reader = html.FileReader();
        reader.readAsDataUrl(file);
        reader.onLoadEnd.listen((event) {
          print("Image loaded: ${reader.result}");
          // Use reader.result for displaying or uploading
          setState(() {
            imageDemo = reader.result.toString().split(',')[1];
          });
        });
      }
    });
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

            32.verticalSpace,

            CustomDropDown(
              isRequired: true,
              dropDownHeader: 'User',
              dropDownData: dealerTypeModel,
              selectedValue: selectedType,
              onItemSelected: (selectedList) {
                List<String> list = [];
                for (var item in selectedList) {
                  list.add(item.name ?? '');
                  selectedType.value = item.name ?? '';
                }
              },
            ),

            32.verticalSpace,

            GestureDetector(
              onTap: () {
                pickImageFromCamera();
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

            32.verticalSpace,

            Visibility(
              visible: imageDemo.isNotEmpty,
              child: Center(
                child: SizedBox(
                  height: 256,
                  width: 256,
                  child: Image.memory(base64.decode(imageDemo)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
