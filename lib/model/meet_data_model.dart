class MeetDataModel {

  String? bDE;
  String? l10Name;
  String? l20Name;
  String? l30L25Name;
  String? meetCreatedBy;
  String? meetDate;
  String? meetID;
  String? meetType;
  String? beat;
  String? dealer;
  String? segment;
  String? typeofInitiative;
  String? noOfUser;
  String? foodBudget;
  String? giftBudget;
  String? meetStatus;
  String? city;

  MeetDataModel({
    this.bDE,
    this.l10Name,
    this.l20Name,
    this.l30L25Name,
    this.meetCreatedBy,
    this.meetDate,
    this.meetID,
    this.meetType,
    this.beat,
    this.dealer,
    this.segment,
    this.typeofInitiative,
    this.noOfUser,
    this.foodBudget,
    this.giftBudget,
    this.meetStatus,
    this.city,
  });

  factory MeetDataModel.fromJson(Map<String, dynamic> json) {
    return MeetDataModel(
      bDE: json['BDE'],
      l10Name: json['L10Name'],
      l20Name: json['L20Name'],
      l30L25Name: json['L30_L25_Name'],
      meetCreatedBy: json['MeetCreatedBy'],
      meetDate: json['Meet_Date'],
      meetID: json['MeetID'],
      meetType: json['MeetType'],
      beat: json['Beat'],
      dealer: json['Dealer'],
      segment: json['Segment'],
      typeofInitiative: json['TypeofInitiative'],
      noOfUser: json['NoOfUser'],
      foodBudget: json['FoodBudget'],
      giftBudget: json['GiftBudget'],
      meetStatus: json['MeetStatus'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() => {
    'BDE': bDE,
    'L10Name': l10Name,
    'L20Name': l20Name,
    'L30_L25_Name': l30L25Name,
    'MeetCreatedBy': meetCreatedBy,
    'Meet_Date': meetDate,
    'MeetID': meetID,
    'MeetType': meetType,
    'Beat': beat,
    'Dealer': dealer,
    'Segment': segment,
    'TypeofInitiative': typeofInitiative,
    'NoOfUser': noOfUser,
    'FoodBudget': foodBudget,
    'GiftBudget': giftBudget,
    'MeetStatus': meetStatus,
    'city': city,
  };
}