// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:oms/model/account.dart';
import 'package:oms/screen/dashboardScreen.dart';
import 'package:oms/screen/registerScreen.dart';

import '../service/userAcc_service.dart';

// ignore: camel_case_types
class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

// ignore: camel_case_types
class _loginscreenState extends State<loginscreen> {
  bool? checkedValue = false;

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(children: [
                Image.asset(
                  "assets/krg-logo-300.png",
                  scale: 1.6,
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    "OMS is online muncipality solution mobile application gravince system for submiting complaint form for public sectors",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: Form(
                child: TextFormField(
                  //inputFormatters: [FilteringTextInputFormatter.deny()],
                  keyboardType: TextInputType.name,

                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFC2A26A), width: 3.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.black),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      hintText: 'Enter Your Email',
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFC2A26A),
                      )),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: Form(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFC2A26A), width: 3.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      hintText: 'Enter Your Password',
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFFC2A26A),
                      )),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.width * 0.1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: checkedValue,
                            onChanged: (bool? value) {
                              setState(() {
                                checkedValue = value;
                              });
                            }),
                        InkWell(
                          onTap: () {
                            setState(() {
                              checkedValue = !checkedValue!;
                            });
                          },
                          child: const Text(
                            "Remember me",
                            style: TextStyle(
                              color: Color(0xFFC2A26A),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        // ignore: avoid_print
                        onTap: () => {print("object")},
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Color(0xFFC2A26A),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: const Color(0xFFC2A26A),
                ),
                onPressed: () {
                  login(context);
                },
                child: const Text("Login into your acount")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 13),
                  primary: const Color(0xFFC2A26A),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const register()));
                },
                child: const Text("Register an account")),
            Container(
              color: Colors.amber,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    ));
  }

  void login(context) async {
    final account? user =
        await UserService.getUser(email: email, password: password);

    if (user == null) {
      print("nooo");
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const dashboard()));
    }
  }
}
