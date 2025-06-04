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
    id: json["id"] ?? "0",
    name: json["name"] ?? "",
    isSelected: json["isSelected"] ?? false,
    showCheckBox: json["showCheckBox"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "isSelected": isSelected,
    "showCheckBox": showCheckBox,
  };
}
