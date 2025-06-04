import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_text.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/constants/app_constants.dart';
import 'dart:html' as html;

class AddUserDemoScreen extends StatefulWidget {
  const AddUserDemoScreen({super.key});

  @override
  State<AddUserDemoScreen> createState() => _AddUserDemoScreenState();
}

class _AddUserDemoScreenState extends State<AddUserDemoScreen> {

  // void pickImageFromCamera() {
  //   final input = html.FileUploadInputElement();
  //
  //   input.accept = 'image/*';
  //
  //   // Manually set the "capture" attribute via JS interop
  //   js.context.callMethod('eval', [
  //     'document.querySelector("input[type=file]").setAttribute("capture", "environment");'
  //   ]);
  //
  //   input.click();
  //
  //   input.onChange.listen((e) {
  //     final file = input.files?.first;
  //     if (file != null) {
  //       // You now have access to the file from camera
  //       print('Image picked: ${file.name}');
  //     }
  //   });
  //
  //   // Add it to the DOM temporarily (optional)
  //   html.document.body?.append(input);
  // }

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
          ],
        ),
      ),
    );
  }
}
