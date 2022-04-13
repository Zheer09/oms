import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oms/model/account.dart';

import '../service/userAcc_service.dart';

class accountPro extends ChangeNotifier {
  void setUser(account? user) {
    User = user;

    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  account? User;

  void login(context, email, password) async {
    account? user;
    user = await UserService.getUser(email: email, password: password);

    setUser(user);

    if (user == null) {
    } else if (user.accountType == "citizen") {
      await Navigator.of(context).pushNamed('/mainCT');
    } else if (user.accountType == "maintainer") {
      await Navigator.of(context).pushNamed('/mainCT');
    }
  }

  void register(context, firstName, lastName, email, phoneNum, password) async {
    account? user;
    user = await UserService.getUser(email: email, password: password);

    setUser(user);

    var upload = await UserService.uploadUserPic();

    if (user == null) {
    } else if (user.accountType == "citizen") {
      await Navigator.of(context).pushNamed('/mainCT');
    } else if (user.accountType == "maintainer") {
      await Navigator.of(context).pushNamed('/mainCT');
    }
  }
}
