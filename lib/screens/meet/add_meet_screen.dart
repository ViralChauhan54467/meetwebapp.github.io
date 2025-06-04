import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/widgets/custom_app_button/app_button.dart';
import 'package:meetwebapp/common/widgets/custom_drop_down.dart';
import 'package:meetwebapp/common/widgets/custom_text.dart';
import 'package:meetwebapp/common/widgets/custom_text_form_field.dart';
import 'package:meetwebapp/common/widgets/drop_down/model/selected_list_item.dart';
import 'package:meetwebapp/common/widgets/drop_down/src/drop_down.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/constants/app_constants.dart';
import 'package:meetwebapp/constants/app_date_format.dart';
import 'package:meetwebapp/utils/toast.dart';
import 'package:meetwebapp/utils/validators.dart';

class AddMeetScreen extends StatefulWidget {
  const AddMeetScreen({super.key});

  @override
  State<AddMeetScreen> createState() => _AddMeetScreenState();
}

class _AddMeetScreenState extends State<AddMeetScreen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController meetIdController = TextEditingController();
  TextEditingController numberOfUserController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController foodBudgetController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  ValueNotifier<String> selectedMeetValue = ValueNotifier('');
  ValueNotifier<String> selectedInitiativeValue = ValueNotifier('');
  ValueNotifier<String> selectedBeatValue = ValueNotifier('');
  ValueNotifier<String> selectedDealerValue = ValueNotifier('');
  ValueNotifier<String> selectedSegmentValue = ValueNotifier('');
  ValueNotifier<List<String>> selectedFocusedItemValue = ValueNotifier([]);

  DateTime? selectedDate;

  List<SelectedListItem> focusedItemData = [
    SelectedListItem(id: '0', name: 'Demo 1', isSelected: false),
    SelectedListItem(id: '1', name: 'Demo 2', isSelected: false),
    SelectedListItem(id: '2', name: 'Demo 3', isSelected: false),
    SelectedListItem(id: '3', name: 'Demo 4', isSelected: false),
    SelectedListItem(id: '4', name: 'Demo 5', isSelected: false),
    SelectedListItem(id: '5', name: 'Demo 6', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBGColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(h16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                16.verticalSpace,

                CustomTextFormField(
                  controller: meetIdController,
                  labelText: AppConstants.sMeetId,
                  readOnly: true,
                  isDense: true,
                  enabled: false,
                  contentPaddingHorizontal: w12,
                  contentPaddingVertical: h16,
                  onChanged: (value) {

                  },
                ),

                16.verticalSpace,

                CustomTextFormField(
                  controller: TextEditingController()
                    ..text = DateFormat(AppDateFormat.selectedDateFormat).format(selectedDate ?? DateTime.now()),
                  labelText: AppConstants.sMeetDate,
                  isRequired: true,
                  readOnly: true,
                  isDense: true,
                  enabled: true,
                  onTap: () async {

                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(3025),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                  contentPaddingHorizontal: w12,
                  contentPaddingVertical: h16,
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w16),
                    child: Icon(Icons.calendar_month,
                      size: AppFontSize.m20,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  validator: [
                    Validators.required(AppConstants.sMeetDateError),
                  ],
                  onChanged: (value) {

                  },
                ),

                16.verticalSpace,

                CustomDropDown(
                  isRequired: true,
                  dropDownHeader: 'Meet Type',
                  dropDownData: [],
                  selectedValue: selectedMeetValue,
                  onItemSelected: (selectedList) {
                    List<String> list = [];
                    for (var item in selectedList) {
                      list.add(item.name ?? '');
                      selectedMeetValue.value = item.name ?? '';
                    }
                  },
                ),

                16.verticalSpace,

                CustomDropDown(
                  isRequired: true,
                  dropDownHeader: 'Type Of initiative',
                  dropDownData: [],
                  selectedValue: selectedInitiativeValue,
                  onItemSelected: (selectedList) {
                    List<String> list = [];
                    for (var item in selectedList) {
                      list.add(item.name ?? '');
                      selectedInitiativeValue.value = item.name ?? '';
                    }
                  },
                ),

                16.verticalSpace,

                CustomDropDown(
                  isRequired: true,
                  dropDownHeader: 'Beat',
                  dropDownData: [],
                  selectedValue: selectedBeatValue,
                  onItemSelected: (selectedList) {
                    List<String> list = [];
                    for (var item in selectedList) {
                      list.add(item.name ?? '');
                      selectedBeatValue.value = item.name ?? '';
                    }
                  },
                ),

                16.verticalSpace,

                CustomDropDown(
                  isRequired: true,
                  dropDownHeader: AppConstants.sDealerName,
                  dropDownData: [],
                  selectedValue: selectedDealerValue,
                  onItemSelected: (selectedList) {
                    List<String> list = [];
                    for (var item in selectedList) {
                      list.add(item.name ?? '');
                      selectedDealerValue.value = item.name ?? '';
                    }
                  },
                ),

                16.verticalSpace,

                CustomTextFormField(
                  controller: numberOfUserController,
                  labelText: AppConstants.sNoUser,
                  isRequired: true,
                  readOnly: false,
                  isDense: true,
                  enabled: true,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  contentPaddingHorizontal: w12,
                  contentPaddingVertical: h16,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: [
                    Validators.required(AppConstants.sNoUserError),
                  ],
                  onChanged: (value) {

                  },
                ),

                16.verticalSpace,

                CustomDropDown(
                  isRequired: true,
                  dropDownHeader: 'Segment',
                  dropDownData: [],
                  selectedValue: selectedSegmentValue,
                  onItemSelected: (selectedList) {
                    List<String> list = [];
                    for (var item in selectedList) {
                      list.add(item.name ?? '');
                      selectedSegmentValue.value = item.name ?? '';
                    }
                  },
                ),

                /*16.verticalSpace,

                CustomDropDown(
                  isRequired: true,
                  dropDownHeader: 'Focused Items',
                  dropDownData: [
                    SelectedListItem(id: '0', name: 'Demo 1', isSelected: false),
                    SelectedListItem(id: '1', name: 'Demo 2', isSelected: false),
                    SelectedListItem(id: '2', name: 'Demo 3', isSelected: false),
                    SelectedListItem(id: '3', name: 'Demo 4', isSelected: false),
                    SelectedListItem(id: '4', name: 'Demo 5', isSelected: false),
                    SelectedListItem(id: '5', name: 'Demo 6', isSelected: false),
                  ],
                  selectedValue: ValueNotifier(''),
                  isMultiSelection: true,
                  onItemSelected: (selectedList) {
                    List<String> list = [];
                    for (var item in selectedList) {
                      list.add(item.name ?? '');
                      selectedFocusedItemValue.value.add(item.name ?? '');
                    }
                  },
                ),*/

                16.verticalSpace,

                ValueListenableBuilder(
                  valueListenable: selectedFocusedItemValue,
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () {
                        DropDownState(
                          DropDown(
                            bottomSheetTitle: Padding(
                              padding: EdgeInsets.all(w8),
                              child: Text(
                                "Select Focused Items",
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
                            data: List<SelectedListItem>.from(focusedItemData.map((x) => SelectedListItem(name: x.name ?? "", isSelected: x.isSelected, id: x.id))),
                            selectedItems: (selectedList) {
                              List<String> list = [];
                              for (var item in selectedList) {
                                list.add(item.name ?? '');
                              }
                              selectedFocusedItemValue.value = list;
                            },
                            enableMultipleSelection: true,
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [

                                value.isEmpty ? Text.rich(
                                  TextSpan(
                                    text: "Select Focused Items",
                                    children: const <InlineSpan>[
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(color: AppColor.red),
                                      ),
                                    ],
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: AppFontSize.m12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ) : CustomText(
                                  text: 'Selected Focused Items(${value.length})',
                                  size: AppFontSize.m12,
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

                            value.isNotEmpty ? Container(
                              constraints: BoxConstraints(
                                maxHeight: h340,
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: value.length,
                                itemBuilder: (context, index) {
                                  return CustomText(
                                    text: value[index],
                                    size: AppFontSize.m12,
                                    color: AppColor.primaryColor,
                                    align: TextAlign.left,
                                    fontWeight: FontWeight.w400,
                                  );
                                },
                              ),
                            ) : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                16.verticalSpace,

                CustomTextFormField(
                  controller:cityNameController,
                  labelText: AppConstants.sCityArea,
                  isRequired: true,
                  readOnly: true,
                  isDense: true,
                  enabled: false,
                  contentPaddingHorizontal: w12,
                  contentPaddingVertical: h16,
                  onChanged: (value) {

                  },
                ),

                16.verticalSpace,

                CustomTextFormField(
                  controller: foodBudgetController,
                  labelText: AppConstants.sFoodBudget,
                  isRequired: true,
                  readOnly: true,
                  isDense: true,
                  enabled: false,
                  contentPaddingHorizontal: w12,
                  contentPaddingVertical: h16,
                  onChanged: (value) {

                  },
                ),

                16.verticalSpace,

                CustomTextFormField(
                  controller: remarkController,
                  labelText: AppConstants.sRemark,
                  isRequired: true,
                  readOnly: false,
                  isDense: true,
                  enabled: true,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  contentPaddingHorizontal: w12,
                  contentPaddingVertical: h16,
                  inputFormatters: const [],
                  validator: [
                    Validators.required(AppConstants.sRemarkError),
                  ],
                  onChanged: (value) {

                  },
                ),

                16.verticalSpace,

                CustomAppButton(
                  text: 'Add Meet Entry',
                  onPressed: () {

                    if (_formKey.currentState?.validate() == true) {
                      successToast('Meet Added');
                      _formKey.currentState?.save();
                    }
                  },
                ),

                16.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
