// ignore: file_names
class complaintForm {
  int? _userID;
  int? _formID;
  String? _fromTitle;
  String? _department;
  String? _issueType;
  String? _location;
  String? _issueDecription;
  List<dynamic>? _formImages;
  String? _status;

  complaintForm(
      {int? userID,
      int? formID,
      String? fromTitle,
      String? department,
      String? issueType,
      String? issueDecription,
      List<String>? formImages,
      String? status,
      String? location}) {
    if (userID != null) {
      _userID = userID;
    }
    if (location != null) {
      _location = location;
    }
    if (formID != null) {
      _formID = formID;
    }
    if (fromTitle != null) {
      _fromTitle = fromTitle;
    }
    if (department != null) {
      _department = department;
    }
    if (issueType != null) {
      _issueType = issueType;
    }
    if (issueDecription != null) {
      _issueDecription = issueDecription;
    }
    if (formImages != null) {
      _formImages = formImages;
    }
    if (status != null) {
      _status = status;
    }
  }

  get userID => _userID;
  set userID(value) => _userID = userID;

  get location => _location;
  set location(value) => _location = location;

  get formID => _formID;
  set formID(value) => _formID = formID;

  get fromTitle => _fromTitle;
  set fromTitle(value) => _fromTitle = fromTitle;

  get department => _department;
  set department(value) => _department = department;

  get issueType => _issueType;
  set issueType(value) => _issueType = issueType;

  get status => _status;
  set status(value) => _status = status;

  get issueDecription => _issueDecription;
  set issueDecription(value) => _issueDecription = issueDecription;

  List<dynamic>? get formImages => _formImages;
  set formImages(value) => _formImages = formImages;

  complaintForm.fromJson(Map<String, dynamic> json) {
    _userID = json['userID'];
    _formID = json['formID'];
    _fromTitle = json['fromTitle'];
    _department = json['department'];
    _issueType = json['issueType'];
    _status = json['status'];
    _location = json['location'];
    _issueDecription = json['issueDecription'];
    _formImages = json['formImages'].cast<String>();
  }

  complaintForm.fromJsonReg(Map<String, dynamic> json) {
    _formID = json['formId'];
    _fromTitle = json['title'];
    _department = json['department'];
    _issueType = json['issueType'];
    _status = json['status'];
    _location = json['location'];
    _issueDecription = json['issueDecription'];
    _formImages = json['formImages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = _status;
    data['title'] = _fromTitle;
    data['department'] = _department;
    data['issueType'] = _issueType;
    data['description'] = _issueDecription;
    data['location'] = _location;
    data['images'] = _formImages;
    return data;
  }
}
