class SelectedListItem {

  String? id;
  String? name;
  bool? isSelected;
  bool? showCheckBox;

  SelectedListItem({
    required this.id,
    required this.name,
    this.isSelected,
    this.showCheckBox
  });

  factory SelectedListItem.fromJson(Map<dynamic, dynamic> json) => SelectedListItem(
    id: json["Id"] ?? "0",
    name: json["Name"] ?? "",
    isSelected: json["isSelected"] ?? false,
    showCheckBox: json["showCheckBox"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "isSelected": isSelected,
    "showCheckBox": showCheckBox,
  };
}
