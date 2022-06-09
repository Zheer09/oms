import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/Textheme.dart';
import '../model/account.dart';
import '../model/accountProvider.dart';

class viewProfile extends StatefulWidget {
  const viewProfile({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (context) => const viewProfile());

  @override
  State<viewProfile> createState() => _viewProfileState();
}

class _viewProfileState extends State<viewProfile> {
  account? usercheck;

  bool isLoading = false;

  String? imageFrontEX;
  String? imageBackEx;

  bool _validFirstname = false;
  bool _validLastname = false;
  bool _validEmail = false;
  bool _validType = false;
  bool _validpassword = false;
  bool _validpasswordre = false;
  bool _validphoneNum = false;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  var user;
  void some() {
    user = Provider.of<accountPro>(context);
  }

  late final _textFirstName = TextEditingController(text: user.User?.firstname);
  late final _textType = TextEditingController(text: user.User?.accountType);
  late final _textLastName = TextEditingController(text: user.User?.lastname);
  late final _textEmail = TextEditingController(text: user.User?.emailaddress);
  late final _textpassword = TextEditingController();
  late final _textpasswordre = TextEditingController();
  late final _textphone = TextEditingController(text: user.User?.phoneNum);

  @override
  void dispose() {
    _textFirstName.dispose();
    _textLastName.dispose();
    _textEmail.dispose();
    _textpassword.dispose();
    _textphone.dispose();
    _textpasswordre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    some();
    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFC2A26A),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                ClipPath(
                  clipper: CustomeShape(),
                  child: Container(
                    height: 150,
                    color: const Color(0xFFC2A26A),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 5),
                            image: DecorationImage(
                                image: user.User?.accountType == "citizen"
                                    ? const AssetImage("assets/profile.jpg")
                                    : const AssetImage("assets/worker.png"),
                                fit: BoxFit.cover)),
                      ),
                      Text(
                        "${user.User?.firstname} ${user.User?.lastname}",
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Status: ${user.User?.status}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: TextFormField(
                              validator: (value) {
                                setState(() {
                                  if (value!.isEmpty) {
                                    _validFirstname = true;
                                  }
                                });
                                return null;
                              },
                              controller: _textFirstName,
                              keyboardType: TextInputType.name,
                              decoration: ThemeHelper().textInputDecoration(
                                  valid: _validFirstname,
                                  lableText: "First Name",
                                  hintText: "Shalaw"),
                              onChanged: (value) {
                                setState(() {
                                  if (_textFirstName.text.isEmpty) {
                                    _validFirstname = true;
                                  } else if (_textFirstName.text.isNotEmpty) {
                                    _validFirstname = false;
                                  } else {}
                                });
                              })),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: TextFormField(
                              validator: (value) {
                                setState(() {
                                  if (value!.isEmpty) {
                                    _validLastname = true;
                                  }
                                });
                                return null;
                              },
                              controller: _textLastName,
                              keyboardType: TextInputType.name,
                              decoration: ThemeHelper().textInputDecoration(
                                  valid: _validLastname,
                                  lableText: "last Name",
                                  hintText: "Ahmed"),
                              onChanged: (value) {
                                setState(() {
                                  if (_textLastName.text.isEmpty) {
                                    _validLastname = true;
                                  } else if (_textLastName.text.isNotEmpty) {
                                    _validLastname = false;
                                  } else {}
                                });
                              })),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        controller: _textEmail,
                        readOnly: true,
                        decoration: ThemeHelper().textInputDecoration(
                          valid: _validEmail,
                          suffixIcon: const Icon(
                            Icons.email,
                            color: Color(0xFFC2A26A),
                          ),
                          lableText: "Your email address",
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        controller: _textType,
                        readOnly: true,
                        decoration: ThemeHelper().textInputDecoration(
                          valid: _validType,
                          suffixIcon: const Icon(
                            Icons.account_circle,
                            color: Color(0xFFC2A26A),
                          ),
                          lableText: "Your Account Type",
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        validator: (value) {
                          setState(() {
                            if (value!.isEmpty) {
                              _validphoneNum = true;
                            }
                          });
                          return null;
                        },
                        controller: _textphone,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black54),
                        decoration: ThemeHelper().textInputDecoration(
                            valid: _validphoneNum,
                            suffixIcon: const Icon(
                              Icons.phone_iphone_rounded,
                              color: Color(0xFFC2A26A),
                            ),
                            lableText: "Enter your phone number",
                            phone: true),
                        onChanged: (value) {
                          setState(() {
                            if (_textphone.text.isEmpty) {
                              _validphoneNum = true;
                            } else if (_textphone.text.isNotEmpty) {
                              _validphoneNum = false;
                            } else {}
                          });
                        },
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Change your password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                          controller: _textpassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: ThemeHelper().textInputDecoration(
                            suffixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFFC2A26A),
                            ),
                            lableText: "Enter your Password",
                          ),
                          onChanged: (value) {
                            setState(() {});
                          })),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                          validator: (value) {
                            if (value != _textpassword.text) {
                              _validpasswordre = true;
                              return "Not Matching";
                            }
                            return null;
                          },
                          controller: _textpasswordre,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: ThemeHelper().textInputDecoration(
                            valid: _validpasswordre,
                            lableText: "Re-enter your Password",
                          ),
                          onChanged: (value) {
                            setState(() {
                              if (_textpasswordre.text.isEmpty) {
                                _validpasswordre = true;
                              } else if (_textpasswordre.text.isNotEmpty) {
                                _validpasswordre = false;
                              }
                            });
                          })),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 13),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          primary: const Color(0xFFC2A26A),
                        ),
                        onPressed: () {
                          if (_form.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                              user.update(
                                context,
                                user.User?.id,
                                _textFirstName.text,
                                _textLastName.text,
                                _textphone.text,
                                _textpassword.text,
                              );
                            });
                          }
                        },
                        child: isLoading == true
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : const Text(
                                "Update",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ]),
      )),
    );
  }
}

class CustomeShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
