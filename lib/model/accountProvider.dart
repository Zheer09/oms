import 'package:flutter/material.dart';
import 'package:oms/model/account.dart';

import '../service/userAcc_service.dart';
import 'package:oms/model/uploadurl.dart';

// ignore: camel_case_types
class accountPro extends ChangeNotifier {
  void setUser(account? user) {
    User = user;

    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  account? User;

  Future<account?> login(context, email, password) async {
    account? user;
    user = await UserService.getUser(email: email, password: password);

    print(user?.msg);

    setUser(user);

    if (user == null) {
    } else if (user.accountType == "citizen") {
      await Navigator.of(context).pushNamed('/mainCT');
    } else if (user.accountType == "maintainer") {
      await Navigator.of(context).pushNamed('/mainMT');
    }

    return user;
  }

  Future<void> update(
      context, userID, firstName, lastName, phoneNumber, password) async {
    account? users = account(
        firstname: firstName,
        lastname: lastName,
        password: password,
        phone: phoneNumber);

    account? user;
    user = await UserService.updateUser(user: users, userID: userID);

    setUser(user);

    if (user == null) {
    } else if (user.accountType == "citizen") {
      await Navigator.of(context).pushNamed('/mainCT');
    } else if (user.accountType == "maintainer") {
      await Navigator.of(context).pushNamed('/mainMT');
    }
  }

  Future<void> register(
      context,
      firstName,
      lastName,
      email,
      phoneNum,
      password,
      imageFrontText,
      imageBackText,
      imageFrontEX,
      imageBackEX,
      imageFront,
      imageBack) async {
    account? userSet;
    account? user = account(
        emailaddress: email,
        firstname: firstName,
        lastname: lastName,
        phone: phoneNum,
        password: password,
        accountType: "citizen",
        status: "pending",
        imageBack: imageBackText,
        imageFornt: imageFrontText);

    userSet = await UserService.createUser(user: user);

    if (userSet != null) {
      print("Success");
    } else {
      print("Nothing");
    }

    if (userSet?.msg == "emailExist") {
    } else {
      UploadFile? uploadSet;
      UploadFile? upload = UploadFile(
          userid: userSet?.id,
          filename: imageFrontText,
          filetype: imageFrontEX);

      uploadSet = await UserService.uploadUserPic(body: upload);

      await uploadSet?.call(uploadSet.uploadUrl, imageFront);

      UploadFile? upload1 = UploadFile(
          userid: userSet?.id, filename: imageBackText, filetype: imageBackEX);

      upload1 = await UserService.uploadUserPic(body: upload1);

      await upload1!.call(upload1.uploadUrl, imageBack);

      setUser(userSet);
      if (userSet == null) {
      } else if (user.accountType == "citizen") {
        await Navigator.of(context).pushNamed('/mainCT');
      } else if (user.accountType == "maintainer") {
        await Navigator.of(context).pushNamed('/mainMT');
      }
    }
  }
}
