import 'package:flutter/material.dart';
import 'package:oms/model/accountProvider.dart';
import 'package:provider/provider.dart';

import 'router.dart';
import 'screen/loginscreen.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => accountPro(),
        )
      ],
      child: MaterialApp(
        title: 'OMS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const loginscreen(),
        initialRoute: "/",
        onGenerateRoute: createRoute,
      ),
    );
  }
}
