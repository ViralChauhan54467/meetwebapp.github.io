import 'package:flutter/material.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/drop_down/src/drop_down.dart';
import 'package:meetwebapp/constants/app_colors.dart';

/// This is search text field class.
class AppTextField extends StatefulWidget {
  final DropDown dropDown;
  final Function(String) onTextChanged;
  final Function onCancel;

  const AppTextField({
    required this.dropDown,
    required this.onTextChanged,
    required this.onCancel,
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(w12),
      child: TextFormField(
        controller: _editingController,
        cursorColor: AppColor.black,
        onChanged: (value) {
          widget.onTextChanged(value);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12,
          contentPadding:
              EdgeInsets.only(left: 0, bottom: 0, top: 0, right: w15),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: AppFontSize.m15,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(AppFontSize.m8),
            ),
          ),
          prefixIcon: const IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          ),
          suffixIcon: GestureDetector(
            onTap: onClearTap,
            child: const Icon(
              Icons.cancel,
              color: AppColor.grey,
            ),
          ),
        ),
      ),
    );
  }

  void onClearTap() {
    _editingController.clear();
    widget.onCancel();
  }
}
