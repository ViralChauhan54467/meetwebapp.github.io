import 'package:flutter/material.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/custom_text.dart';
import 'package:meetwebapp/common/widgets/drop_down/model/selected_list_item.dart';
import 'package:meetwebapp/common/widgets/drop_down/src/drop_down.dart';
import 'package:meetwebapp/constants/app_colors.dart';

class CustomDropDown extends StatelessWidget {

  final List<SelectedListItem>? dropDownData;
  final String dropDownHeader;
  final ValueNotifier<String> selectedValue;
  final bool? isRequired;
  final bool? isMultiSelection;
  final Function(List<SelectedListItem>) onItemSelected;

  const CustomDropDown({
    super.key,
    required this.selectedValue,
    this.dropDownData,
    required this.dropDownHeader,
    this.isRequired,
    this.isMultiSelection,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedValue,
      builder: (context, value, child) {
        return InkWell(
          onTap: () {
            DropDownState(
              DropDown(
                bottomSheetTitle: Padding(
                  padding: EdgeInsets.all(w8),
                  child: Text(
                    "Select $dropDownHeader",
                    style: TextStyle(color: AppColor.black, fontSize: AppFontSize.m14),
                  ),
                ),
                submitButtonChild: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: AppFontSize.m16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                data: List<SelectedListItem>.from(dropDownData?.map((x) => SelectedListItem(name: x.name ?? "", isSelected: false, id: x.id)) ?? []),
                selectedItems: onItemSelected,
                enableMultipleSelection: isMultiSelection ?? false,
              ),
            ).showModal(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: w12,
              vertical: h12,
            ),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(AppFontSize.m4),
            ),
            child: Row(
              children: [

                value.isEmpty ? Text.rich(
                  TextSpan(
                    text: "Select $dropDownHeader",
                    children: <InlineSpan>[
                      TextSpan(
                        text: (isRequired == true) ? '*' : '',
                        style: const TextStyle(color: AppColor.red),
                      ),
                    ],
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: AppFontSize.m12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ) : CustomText(
                  text: value,
                  size: AppFontSize.m14,
                  color: AppColor.primaryColor,
                  align: TextAlign.left,
                  fontWeight: FontWeight.w400,
                ),

                const Spacer(),
                Icon(
                  Icons.expand_more,
                  color: AppColor.primaryColor,
                  size: AppFontSize.m20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
