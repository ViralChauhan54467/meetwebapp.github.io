import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/utils/toast.dart';

class CustomTextFormField extends StatefulWidget {
  final String? text;
  final String? labelText;
  final String? errorText;
  final TextEditingController? controller;
  final List<String? Function(String?, String?)> validator;
  final int? maxLength;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final double? labelHeight;
  final bool? readOnly;
  final bool? enabled;
  final double? contentPaddingVertical;
  final double? contentPaddingHorizontal;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final void Function()? onTap;
  final bool? isDense;
  final bool? isRequired;
  final Widget? prefixWidget;

  const CustomTextFormField({
    super.key,
    this.text,
    this.labelText,
    this.errorText,
    this.controller,
    this.validator = const [],
    this.maxLength,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.suffixIcon,
    this.labelHeight,
    this.readOnly,
    this.enabled,
    this.contentPaddingVertical,
    this.contentPaddingHorizontal,
    required this.onChanged,
    this.onSubmit,
    this.onTap,
    this.isDense,
    this.isRequired,
    this.prefixWidget,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    bool required = widget.isRequired ?? false;

    return TextFormField(
      readOnly: widget.readOnly ?? false,
      enabled:  widget.enabled ?? true,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      controller: widget.controller ?? TextEditingController(),
      onFieldSubmitted: widget.onSubmit,
      onChanged: (value) {
        widget.onChanged!(value);
      },
      onTap: widget.onTap,
      style: TextStyle(
        color: AppColor.primaryColor,
        fontSize: AppFontSize.m14,
        fontWeight: FontWeight.w400,
      ),
      validator: (value) {
        String? responseValidator;
        for (int i = 0; i < widget.validator.length; i++) {
          responseValidator = widget.validator[i](value, widget.errorText);
          if (responseValidator != null) {
            if ((widget.errorText ?? '').contains("Email")) {
              warningToast(widget.errorText.toString());
            }
            return responseValidator;
          }
        }
        return null;
      },
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters ?? [],
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppFontSize.m4)),
          borderSide: BorderSide(
            color: (widget.enabled ?? true) ? AppColor.primaryColor : AppColor.grey.withOpacity(1),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppFontSize.m4)),
          borderSide: BorderSide(
            color: (widget.enabled ?? true) ? AppColor.primaryColor : AppColor.grey.withOpacity(1),
            width: 1,
          ),
        ),
        filled: true,
        fillColor: (widget.enabled ?? true) ? AppColor.white : AppColor.grey.withOpacity(0.3),
        label: widget.labelText == null ? null : Text.rich(
          TextSpan(
            text: widget.labelText,
            children: <InlineSpan>[
              TextSpan(
                text: required ? '*' : '',
                style: const TextStyle(color: AppColor.red),
              ),
            ],
            style: TextStyle(
              color: (widget.enabled ?? true) ? AppColor.primaryColor : AppColor.black,
              fontSize: AppFontSize.m12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        labelStyle: TextStyle(
          height: widget.labelHeight ?? h2,
          color: (widget.enabled ?? true) ? AppColor.primaryColor : AppColor.black,
          fontSize: AppFontSize.m12,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: widget.suffixIcon,
        prefix: widget.prefixWidget,
        isDense: widget.isDense,
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.contentPaddingHorizontal ?? 0,
          vertical: widget.contentPaddingVertical ?? 0,
        ),
        hintText: widget.text,
      ),
    );
  }
}