import 'package:flutter/material.dart';

import 'package:oms/screen/dashboardScreen.dart';
import 'package:oms/screen/loginscreen.dart';
import 'package:oms/screen/registerScreen.dart';
import 'package:oms/screen/complaintScreen.dart';
import 'package:oms/screen/viewStatusScreen.dart';

Route<dynamic>? createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/mainCT':
      return dashboard.route();

    case '/login':
      return loginscreen.route();

    case '/register':
      return register.route();

    case '/complaintCT':
      return complaint.route();
    case '/viewStausCT':
      return viewStatus.route();
  }
  return null;
}
