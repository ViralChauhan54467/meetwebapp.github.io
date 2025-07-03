class UserModel {
  UserModel({
    required this.userId,
    required this.userName,
    required this.mobile,
    required this.email,
    required this.dob,
    required this.department,
    required this.designation,
    required this.responsibilityCenter,
    required this.sapCode,
    required this.division,
    required this.city,
    required this.state,
    required this.displayName,
    required this.departmentId,
    required this.designationId,
    required this.responsibilityCenterId,
    required this.divisionId,
    required this.cityId,
    required this.stateId,
    required this.token,
    required this.profile,
    required this.rank,
    required this.profileName,
    required this.otp,
    required this.allowVersion,
    required this.currentVersion,
    this.isAllowFakeLocation,
    this.level,
    this.isNewDashboardEnabled,
  });

  final String userId;
  final String userName;
  final String mobile;
  final String email;
  final String dob;
  final String department;
  final String designation;
  final String responsibilityCenter;
  final String sapCode;
  final String division;
  final String city;
  final String state;
  final String displayName;
  final String departmentId;
  final String designationId;
  final String responsibilityCenterId;
  final String divisionId;
  final String cityId;
  final String stateId;
  final String token;
  final String profile;
  final String rank;
  final String profileName;
  final String otp;
  final String? currentVersion;
  final String? allowVersion;
  final String? isAllowFakeLocation;
  final String? level;
  final String? isNewDashboardEnabled;

  bool get isSO => rank == "1";

  bool get isTSM => rank == "2";

  bool get isASM => rank == "3";

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["UserId"] ?? "",
      userName: json["UserName"] ?? "",
      mobile: json["Mobile"] ?? "",
      email: json["Email"] ?? "",
      dob: json["DOB"] ?? "",
      department: json["Department"] ?? "",
      designation: json["Designation"] ?? "",
      responsibilityCenter: json["ResponsibilityCenter"] ?? "",
      sapCode: json["SapCode"] ?? "",
      division: json["Division"] ?? "",
      city: json["City"] ?? "",
      state: json["State"] ?? "",
      displayName: json["DisplayName"] ?? "",
      departmentId: json["DepartmentId"] ?? "",
      designationId: json["DesignationId"] ?? "",
      responsibilityCenterId: json["ResponsibilityCenterId"] ?? "",
      divisionId: json["DivisionId"] ?? "",
      cityId: json["CityId"] ?? "",
      stateId: json["StateId"] ?? "",
      token: json["Token"] ?? "",
      profile: json["Profile"] ?? "",
      rank: json["Rank"] ?? "",
      profileName: json["ProfileName"] ?? "",
      otp: json["otp"] ?? "",
      currentVersion: json["Current_Version"] ?? "",
      allowVersion: json["Allow_Version"] ?? "",
      isAllowFakeLocation: json["IsAllowFakeLocation"] ?? "false",
      level : json["Level"],
      isNewDashboardEnabled: json["IsNewDashboardEnabled"],
    );
  }

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "UserName": userName,
    "Mobile": mobile,
    "Email": email,
    "DOB": dob,
    "Department": department,
    "Designation": designation,
    "ResponsibilityCenter": responsibilityCenter,
    "SapCode": sapCode,
    "Division": division,
    "City": city,
    "State": state,
    "DisplayName": displayName,
    "DepartmentId": departmentId,
    "DesignationId": designationId,
    "ResponsibilityCenterId": responsibilityCenterId,
    "DivisionId": divisionId,
    "CityId": cityId,
    "StateId": stateId,
    "Token": token,
    "Profile": profile,
    "Rank": rank,
    "ProfileName": profileName,
    "otp": otp,
    "Allow_Version": allowVersion,
    "Current_Version": currentVersion,
    "IsAllowFakeLocation": isAllowFakeLocation,
    "Level": level,
    "IsNewDashboardEnabled" : isNewDashboardEnabled,
  };
}
