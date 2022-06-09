import 'package:flutter/material.dart';

import 'package:oms/screen/dashboardScreen.dart';
import 'package:oms/screen/loginscreen.dart';
import 'package:oms/screen/registerScreen.dart';
import 'package:oms/screen/complaintScreen.dart';
import 'package:oms/screen/viewStatusScreen.dart';
import 'package:oms/screen/archiveForm.dart';
import 'package:oms/screen/viewProfile.dart';
import 'package:oms/screen/mtdashboard.dart';
import 'package:oms/screen/viewStatusScreenMT.dart';

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
    case '/mainMT':
      return mtdashboard.route();
    case '/viewStausCT':
      return viewStatus.route();
    case '/viewStatusMT':
      return viewStatusMT.route();
    case '/archiveFormCT':
      return archiveForm.route();
    case '/viewFormCT':
      return viewProfile.route();
  }
  return null;
}
