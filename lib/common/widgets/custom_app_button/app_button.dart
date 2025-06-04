import 'package:flutter/material.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_app_button/bounce_view.dart';
import 'package:meetwebapp/constants/app_colors.dart';

class CustomAppButton extends StatelessWidget {
  final Function? onPressed;
  final Widget? child;
  final int duration;
  final String? text;
  final bool? isLoading;
  final double? horizontalPadding;
  final double? verticalPadding;

  const CustomAppButton({
    super.key,
    this.child,
    this.onPressed,
    this.duration = 100,
    this.text,
    this.isLoading,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {

    bool loading = isLoading ?? false;

    return BounceView(
      duration: Duration(milliseconds: duration),
      onPressed: onPressed as void Function()?,
      child: child ?? Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? w40,
            vertical: verticalPadding ?? h12),
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(AppFontSize.m15))),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                text ?? '',
                style: TextStyle(
                  color: loading ? AppColor.primaryColor : AppColor.white,
                  fontSize: AppFontSize.m16,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Visibility(
                visible: loading,
                child: SizedBox(
                  height: w20,
                  width: w20,
                  child: const CircularProgressIndicator(
                    color: AppColor.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
