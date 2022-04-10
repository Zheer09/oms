import 'package:flutter/material.dart';

import 'router.dart';
import 'screen/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginscreen(),
      initialRoute: "/",
      onGenerateRoute: createRoute,
    );
  }
}
