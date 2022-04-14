// ignore: camel_case_types
class account {
  String? _emailaddress;
  String? _password;
  int? _id;
  String? _firstname;
  String? _lastname;
  String? _accountType;
  String? _backID;
  String? _frontID;

  get id => _id;
  set id(value) => _id = id;

  get firstname => _firstname;
  set firstname(value) => _firstname = firstname;

  get accountType => _accountType;
  set accountType(value) => _accountType = accountType;

  get lastname => _lastname;
  set lastname(value) => _lastname = lastname;

  get emailaddress => _emailaddress;
  set emailaddress(value) => _emailaddress = emailaddress;

  get password => _password;
  set password(value) => _password = password;

  account(
      {String? emailaddress,
      String? password,
      int? id,
      String? firstname,
      String? lastname,
      String? accountType}) {
    if (emailaddress != null) {
      _emailaddress = emailaddress;
    }
    if (password != null) {
      _password = password;
    }
    if (id != null) {
      _id = id;
    }
    if (firstname != null) {
      _firstname = firstname;
    }
    if (lastname != null) {
      _lastname = lastname;
    }
    if (accountType != null) {
      _accountType = accountType;
    }
  }

  account.fromJson(Map<String, dynamic> json) {
    _emailaddress = json['emailaddress'];
    _password = json['password'];
    _id = json['id'];
    _firstname = json['firstName'];
    _lastname = json['lastName'];
    _accountType = json['typeacc'];
    _backID = json['backID'];
    _frontID = json['frontID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emailaddress'] = _emailaddress;
    data['password'] = _password;
    data['id'] = _id;
    data['firstName'] = _firstname;
    data['lastName'] = _lastname;
    data['typeacc'] = _accountType;
    data['backID'] = _backID;
    data['frontID'] = _frontID;
    return data;
  }
}
