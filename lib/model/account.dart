// ignore: camel_case_types
class account {
  String? _emailaddress;
  String? _password;

  get emailaddress => _emailaddress;
  set emailaddress(value) => _emailaddress = emailaddress;

  get password => _password;
  set password(value) => _password = password;

  account({String? emailaddress, String? password}) {
    if (emailaddress != null) {
      _emailaddress = emailaddress;
    }
    if (password != null) {
      _password = password;
    }
  }

  account.fromJson(Map<String, dynamic> json) {
    _emailaddress = json['emailaddress'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailaddress'] = _emailaddress;
    data['password'] = _password;
    return data;
  }
}
