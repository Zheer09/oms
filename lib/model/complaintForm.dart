// ignore: file_names
import 'account.dart';

class complaintForm {
  int? _userID;
  int? _formID;
  String? _fromTitle;
  String? _department;
  String? _issueType;
  String? _location;
  String? _issueDecription;
  List<dynamic>? _formImages;
  account? _user;
  String? _status;

  String? _msg;

  complaintForm({
    int? userID,
    int? formID,
    String? fromTitle,
    String? department,
    String? issueType,
    String? issueDecription,
    List<String>? formImages,
    account? user,
    String? status,
    String? location,
  }) {
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
    if (user != null) {
      _user = user;
    }
  }

  get userID => _userID;
  set userID(value) => _userID = userID;

  get location => _location;
  set location(value) => _location = location;

  get formID => _formID;
  set formID(value) => _formID = formID;

  get user => _user;
  set user(value) => _user = user;

  get msg => _msg;
  set msg(value) => _msg = msg;

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
    _formID = json['formId'];
    _fromTitle = json['title'];
    _department = json['department'];
    _issueType = json['issueType'];
    _status = json['status'];
    _location = json['location'];
    _issueDecription = json['issueDecription'];
    _formImages = json['formImages'].cast<String>();
  }

  complaintForm.fromJsonMT(Map<String, dynamic> json) {
    _user = account.fromJsonMT(json['account']);
    _formID = json['formId'];
    _fromTitle = json['title'];
    _department = json['department'];
    _issueType = json['issueType'];
    _status = json['status'];
    _location = json['location'];
    _issueDecription = json['issueDecription'];
    _formImages = json['formImages'].cast<String>();
  }

  complaintForm.fromJsonupdate(Map<String, dynamic> json) {
    _userID = json['userID'];
    _formID = json['formId'];
    _fromTitle = json['title'];
    _department = json['department'];
    _issueType = json['issueType'];
    _status = json['status'];
    _location = json['location'];
    _issueDecription = json['issueDecription'];
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

  complaintForm.deleteJson(Map<String, dynamic> json) {
    _msg = json['msg'];
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
