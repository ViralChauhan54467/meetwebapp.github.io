import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:meetwebapp/common/size/app_font_size.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/common/widgets/drop_down/model/selected_list_item.dart';
import 'package:meetwebapp/common/widgets/drop_down/src/app_text_field.dart';
import 'package:meetwebapp/constants/app_colors.dart';

class DropDown {
  /// This will give the list of data.
  final List<SelectedListItem> data;

  /// This will give the call back to the selected items from list.
  final Function(List<SelectedListItem>)? selectedItems;

  /// [listBuilder] will gives [index] as a function parameter and you can return your own widget based on [index].
  final Widget Function(int index)? listBuilder;

  /// This will give selection choice for single or multiple for list.
  final bool enableMultipleSelection;

  /// This gives the bottom sheet title.
  final Widget? bottomSheetTitle;

  /// You can set your custom submit button when the multiple selection is enabled.
  final Widget? submitButtonChild;

  /// [searchWidget] is use to show the text box for the searching.
  /// If you are passing your own widget then you must have to add [TextEditingController] for the [TextFormField].
  final TextFormField? searchWidget;

  /// [isSearchVisible] flag use to manage the search widget visibility
  /// by default it is [True] so widget will be visible.
  final bool isSearchVisible;

  /// This will set the background color to the dropdown.
  final Color dropDownBackgroundColor;

  DropDown({
    Key? key,
    required this.data,
    this.selectedItems,
    this.listBuilder,
    this.enableMultipleSelection = false,
    this.bottomSheetTitle,
    this.submitButtonChild,
    this.searchWidget,
    this.isSearchVisible = true,
    this.dropDownBackgroundColor = AppColor.transparent,
  });
}

class DropDownState {
  DropDown dropDown;

  DropDownState(this.dropDown);

  /// This gives the bottom sheet widget.
  void showModal(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(AppFontSize.m15)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MainBody(dropDown: dropDown);
          },
        );
      },
    );
  }
}

/// This is main class to display the bottom sheet body.
class MainBody extends StatefulWidget {
  final DropDown dropDown;

  const MainBody({required this.dropDown, super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  /// This list will set when the list of data is not available.
  List<SelectedListItem> mainList = [];

  @override
  void initState() {
    super.initState();
    mainList = widget.dropDown.data;
    _setSearchWidgetListener();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.15,
      maxChildSize: 0.8,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: w15, right: w15, top: h10),
                child: Center(
                  child: widget.dropDown.bottomSheetTitle ?? Container(),
                ),
              ),

              /// A [TextField] that displays a list of suggestions as the user types with clear button.
              Visibility(
                visible: widget.dropDown.isSearchVisible,
                child: widget.dropDown.searchWidget ??
                    AppTextField(
                      dropDown: widget.dropDown,
                      onTextChanged: _buildSearchList,
                      onCancel: () {
                        _buildSearchList('');
                        _onUnFocusKeyboardAndPop();
                      },
                    ),
              ),

              /// Listview (list of data with check box for multiple selection & on tile tap single selection)
              mainList.isNotEmpty
                  ? _buildListing(scrollController)
                  : const Center(child: Text("Data Not Found")),
            ],
          ),
        );
      },
    );
  }

  /// This helps when search enabled & show the filtered data in list.
  _buildSearchList(String userSearchTerm) {
    final results = widget.dropDown.data
        .where((element) => (element.name ?? '').toLowerCase().contains(userSearchTerm.toLowerCase()))
        .toList();
    if (userSearchTerm.isEmpty) {
      mainList = widget.dropDown.data;
    } else {
      mainList = results;
    }
    setState(() {});
  }

  /// This helps to UnFocus the keyboard & pop from the bottom sheet.
  _onUnFocusKeyboardAndPop() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  void _setSearchWidgetListener() {
    TextFormField? searchField = widget.dropDown.searchWidget;
    searchField?.controller?.addListener(() {
      _buildSearchList(searchField.controller?.text ?? '');
    });
  }

  Widget _buildListing(ScrollController scrollController) {
    return AnimationLimiter(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) =>
            AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: const SlideAnimation(
                    verticalOffset: 44,
                    child: FadeInAnimation(child: Divider()))),
        controller: scrollController,
        itemCount: mainList.length,
        itemBuilder: (context, index) {
          bool isSelected = mainList[index].isSelected ?? false;
          bool showCheckBox = mainList[index].showCheckBox ?? false;
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 44,
              child: FadeInAnimation(
                child: InkWell(
                  onTap: !showCheckBox
                      ? widget.dropDown.enableMultipleSelection
                          ? () {
                              setState(() {
                                mainList[index].isSelected = !isSelected;
                              });
                              List<SelectedListItem> selectedList = widget
                                  .dropDown.data
                                  .where(
                                      (element) => element.isSelected == true)
                                  .toList();
                              List<SelectedListItem> selectedNameList = [];

                              for (var element in selectedList) {
                                selectedNameList.add(element);
                              }

                              widget.dropDown.selectedItems?.call(selectedNameList);
                            }
                          : () {
                              setState(() {
                                mainList[index].isSelected = true;
                              });
                              widget.dropDown.selectedItems
                                  ?.call([mainList[index]]);
                              _onUnFocusKeyboardAndPop();
                            }
                      : () {},
                  child: Container(
                      color: widget.dropDown.dropDownBackgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (0 == index) const Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: w20,
                                      right: w10,
                                      bottom: h5,
                                      top: h5),
                                  child: widget.dropDown.listBuilder
                                          ?.call(index) ?? Text(
                                    mainList[index].name.toString(),
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: AppFontSize.m14,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              widget.dropDown.enableMultipleSelection
                                  ? Padding(
                                      padding: EdgeInsets.only(right: w25),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (!showCheckBox) {
                                            setState(() {
                                              mainList[index].isSelected =
                                                  !isSelected;
                                            });
                                            List<SelectedListItem>
                                                selectedList = widget
                                                    .dropDown.data
                                                    .where((element) =>
                                                        element.isSelected ==
                                                        true)
                                                    .toList();
                                            List<SelectedListItem> selectedNameList = [];

                                            for (var element in selectedList) {
                                              selectedNameList.add(element);
                                            }

                                            widget.dropDown.selectedItems?.call(selectedNameList);
                                          }
                                        },
                                        child: isSelected
                                            ? const Icon(Icons.check_box,
                                                color: AppColor.primaryColor)
                                            : const Icon(
                                                Icons.check_box_outline_blank,
                                                color: AppColor.primaryColor,
                                              ),
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 0.0,
                                      width: 0.0,
                                    ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
