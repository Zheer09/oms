// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:oms/model/account.dart';
import 'package:oms/model/accountProvider.dart';
import 'package:oms/screen/registerScreen.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (context) => const loginscreen());

  @override
  State<loginscreen> createState() => _loginscreenState();
}

// ignore: camel_case_types
class _loginscreenState extends State<loginscreen> {
  bool? checkedValue = false;

  String? email;
  String? password;
  final _text = TextEditingController();
  final _textpass = TextEditingController();

  @override
  void dispose() {
    _text.dispose();
    _textpass.dispose();
    super.dispose();
  }

  bool _validate = false;
  bool _validatepass = false;
  @override
  Widget build(BuildContext context) {
    var User = Provider.of<accountPro>(context);
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
                  controller: _text,
                  decoration: InputDecoration(
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFC2A26A), width: 3.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      errorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.redAccent, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.black),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      hintText: 'Enter Your Email',
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xFFC2A26A),
                      )),
                  onChanged: (value) {
                    email = value;
                    setState(() {
                      if (_text.text.isEmpty) {
                        _validate = true;
                      } else if (_text.text.isNotEmpty) {
                        _validate = false;
                      }
                    });
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
                  controller: _textpass,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      errorText: _validatepass ? 'Value Can\'t Be Empty' : null,
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFC2A26A), width: 3.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      hintText: 'Enter Your Password',
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFFC2A26A),
                      )),
                  onChanged: (value) {
                    password = value;
                    setState(() {
                      if (_textpass.text.isEmpty) {
                        _validatepass = true;
                      } else if (_textpass.text.isNotEmpty) {
                        _validatepass = false;
                      } else {}
                    });
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
                  User.login(context, _text.text, _textpass.text);
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

  void showSnackBar(BuildContext context) {
    const snackbar = SnackBar(
      content: Text(
        "Email or password invalid",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
      shape: StadiumBorder(),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
