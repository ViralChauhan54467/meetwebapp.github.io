class MeetUserDetailModel {
  String? meetID;
  String? userID;
  String? userName;
  String? mobile;
  String? city;
  String? isAttend;
  String? segment;
  String? giftName;

  MeetUserDetailModel({
    this.meetID,
    this.userID,
    this.userName,
    this.mobile,
    this.city,
    this.isAttend,
    this.segment,
    this.giftName,
  });

  factory MeetUserDetailModel.fromJson(Map<String, dynamic> json) {
    return MeetUserDetailModel(
      meetID: json['MeetID'],
      userID: json['UserID'],
      userName: json['UserName'],
      mobile: json['Mobile'],
      city: json['City'],
      isAttend: json['IsAttend'],
      segment: json['Segment'],
      giftName: json['GiftName'],
    );
  }

  Map<String, dynamic> toJson() => {
    'MeetID': meetID,
    'UserID': userID,
    'UserName': userName,
    'Mobile': mobile,
    'City': city,
    'IsAttend': isAttend,
    'Segment': segment,
    'GiftName': giftName,
  };
}