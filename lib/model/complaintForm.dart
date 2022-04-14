class complaintForm {
  int? _userID;
  String? _formID;
  String? _fromTitle;
  String? _department;
  String? _issueType;
  String? _issueDecription;
  List<String>? _formImages;
  Null? _jobTitle;

  complaintForm(
      {int? userID,
      String? formID,
      String? fromTitle,
      String? department,
      String? issueType,
      String? issueDecription,
      List<String>? formImages,
      Null? jobTitle}) {
    if (userID != null) {
      this._userID = userID;
    }
    if (formID != null) {
      this._formID = formID;
    }
    if (fromTitle != null) {
      this._fromTitle = fromTitle;
    }
    if (department != null) {
      this._department = department;
    }
    if (issueType != null) {
      this._issueType = issueType;
    }
    if (issueDecription != null) {
      this._issueDecription = issueDecription;
    }
    if (formImages != null) {
      this._formImages = formImages;
    }
    if (jobTitle != null) {
      this._jobTitle = jobTitle;
    }
  }

  int? get userID => _userID;
  set userID(int? userID) => _userID = userID;
  String? get formID => _formID;
  set formID(String? formID) => _formID = formID;
  String? get fromTitle => _fromTitle;
  set fromTitle(String? fromTitle) => _fromTitle = fromTitle;
  String? get department => _department;
  set department(String? department) => _department = department;
  String? get issueType => _issueType;
  set issueType(String? issueType) => _issueType = issueType;
  String? get issueDecription => _issueDecription;
  set issueDecription(String? issueDecription) =>
      _issueDecription = issueDecription;
  List<String>? get formImages => _formImages;
  set formImages(List<String>? formImages) => _formImages = formImages;
  Null? get jobTitle => _jobTitle;
  set jobTitle(Null? jobTitle) => _jobTitle = jobTitle;

  complaintForm.fromJson(Map<String, dynamic> json) {
    _userID = json['userID'];
    _formID = json['formID'];
    _fromTitle = json['fromTitle'];
    _department = json['department'];
    _issueType = json['issueType'];
    _issueDecription = json['issueDecription'];
    _formImages = json['formImages'].cast<String>();
    _jobTitle = json['jobTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this._userID;
    data['formID'] = this._formID;
    data['fromTitle'] = this._fromTitle;
    data['department'] = this._department;
    data['issueType'] = this._issueType;
    data['issueDecription'] = this._issueDecription;
    data['formImages'] = this._formImages;
    data['jobTitle'] = this._jobTitle;
    return data;
  }
}
