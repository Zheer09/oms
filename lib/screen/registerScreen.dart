// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oms/model/accountProvider.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';

import '../model/Textheme.dart';
import '../model/account.dart';
import '../service/userAcc_service.dart';

// ignore: camel_case_types
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (context) => const register());

  @override
  State<register> createState() => _registerState();
}

// ignore: camel_case_types
class _registerState extends State<register> {
  //accountPro? user;

  XFile? imageFront;
  XFile? imageBack;

  account? usercheck;

  bool isLoading = false;

  String? imageFrontEX;
  String? imageBackEx;

  bool _validFirstname = false;
  bool _validLastname = false;
  bool _validEmail = false;
  bool _validpassword = false;
  bool _validpasswordre = false;
  bool _validphoneNum = false;

  final _textFirstName = TextEditingController();
  final _textLastName = TextEditingController();
  final _textEmail = TextEditingController();
  final _textpassword = TextEditingController();
  final _textpasswordre = TextEditingController();
  final _textphone = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

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

  Future pickImageFront() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = XFile(image.path);
      imageFrontEX = p.extension(image.path);
      setState(() {
        imageFront = imageTemp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Faild to pick image: $e");
    }
  }

  Future pickCameraFront() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = XFile(image.path);
      imageFrontEX = p.extension(image.path);
      setState(() {
        imageFront = imageTemp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Faild to pick image: $e");
    }
  }

  Future pickImageBack() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = XFile(image.path);
      imageBackEx = p.extension(image.path);
      setState(() {
        imageBack = imageTemp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Faild to pick image: $e");
    }
  }

  Future pickCameraBack() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = XFile(image.path);
      imageBackEx = p.extension(image.path);
      setState(() {
        imageBack = imageTemp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Faild to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<accountPro>(context);
    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create an account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                        validator: (value) {
                          setState(() {
                            if (value!.isEmpty) {
                              _validEmail = true;
                            }
                          });
                          return null;
                        },
                        controller: _textEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: ThemeHelper().textInputDecoration(
                            valid: _validEmail,
                            suffixIcon: const Icon(
                              Icons.email,
                              color: Color(0xFFC2A26A),
                            ),
                            lableText: "Enter your email address",
                            hintText: "Example@example.com"),
                        onChanged: (value) {
                          setState(() {
                            if (_textEmail.text.isEmpty) {
                              _validEmail = true;
                            } else if (_textEmail.text.isNotEmpty) {
                              _validEmail = false;
                            } else {}
                          });
                        })),
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
                      style:
                          const TextStyle(fontSize: 15, color: Colors.black54),
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
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                        validator: (value) {
                          setState(() {
                            if (value!.isEmpty) {
                              _validpassword = true;
                            }
                          });
                          return null;
                        },
                        controller: _textpassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: ThemeHelper().textInputDecoration(
                          valid: _validpassword,
                          suffixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xFFC2A26A),
                          ),
                          lableText: "Enter your Password",
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (_textpassword.text.isEmpty) {
                              _validpassword = true;
                            } else if (_textpassword.text.isNotEmpty) {
                              _validpassword = false;
                            }
                          });
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
                const Text(
                  "Upload Your ID",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      color: Colors.black12,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: 100,
                        child: imageBack == null
                            ? InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10),
                                        ),
                                      ),
                                      builder: (context) => SizedBox(
                                            height: 110,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        pickCameraBack();
                                                      },
                                                      child:
                                                          Row(children: const [
                                                        Icon(
                                                          Icons
                                                              .camera_alt_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text("Camera")
                                                      ]),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        pickImageBack();
                                                      },
                                                      child:
                                                          Row(children: const [
                                                        Icon(
                                                          Icons
                                                              .photo_album_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text("Gallery")
                                                      ]),
                                                    )
                                                  ]),
                                            ),
                                          ));
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Add Back side of the ID",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Icon(
                                        Icons.add_circle_rounded,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ]),
                              )
                            : InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10),
                                        ),
                                      ),
                                      builder: (context) => SizedBox(
                                            height: 110,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        pickCameraFront();
                                                      },
                                                      child:
                                                          Row(children: const [
                                                        Icon(
                                                          Icons
                                                              .camera_alt_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text("Camera")
                                                      ]),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        pickImageFront();
                                                      },
                                                      child:
                                                          Row(children: const [
                                                        Icon(
                                                          Icons
                                                              .photo_album_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text("Gallery")
                                                      ]),
                                                    )
                                                  ]),
                                            ),
                                          ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.file(
                                    File(imageBack!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    Card(
                      color: Colors.black12,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: 100,
                        child: imageFront == null
                            ? InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10),
                                        ),
                                      ),
                                      builder: (context) => SizedBox(
                                            height: 110,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        pickCameraFront();
                                                      },
                                                      child:
                                                          Row(children: const [
                                                        Icon(
                                                          Icons
                                                              .camera_alt_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text("Camera")
                                                      ]),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        pickImageFront();
                                                      },
                                                      child:
                                                          Row(children: const [
                                                        Icon(
                                                          Icons
                                                              .photo_album_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text("Gallery")
                                                      ]),
                                                    )
                                                  ]),
                                            ),
                                          ));
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Add Front side of the ID",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Icon(
                                        Icons.add_circle_rounded,
                                        size: 30,
                                        color: Colors.white70,
                                      ),
                                    ]),
                              )
                            : InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10),
                                        ),
                                      ),
                                      builder: (context) => SizedBox(
                                            height: 110,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        pickCameraFront();
                                                      },
                                                      child:
                                                          Row(children: const [
                                                        Icon(
                                                          Icons
                                                              .camera_alt_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text("Camera")
                                                      ]),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        pickImageFront();
                                                      },
                                                      child:
                                                          Row(children: const [
                                                        Icon(
                                                          Icons
                                                              .photo_album_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Text("Gallery")
                                                      ]),
                                                    )
                                                  ]),
                                            ),
                                          ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.file(
                                    File(imageFront!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                        setState(() {
                          isLoading = true;
                        });
                        if (imageBack == null || imageFront == null) {
                          _form.currentState!.validate();
                        } else {
                          if (_form.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                              user.register(
                                  context,
                                  _textFirstName.text,
                                  _textLastName.text,
                                  _textEmail.text,
                                  _textphone.text,
                                  _textpassword.text,
                                  imageFront!.name.toString(),
                                  imageBack!.name.toString(),
                                  imageFrontEX,
                                  imageBackEx,
                                  imageBack,
                                  imageFront);

                              if (user.User?.msg == "emailExist") {
                                showSnackBar(context);
                              }
                            });
                          }
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
                          : const Text("Submit")),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void showSnackBar(BuildContext context) {
    final snackbar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          Expanded(
            child: Text(
              '  The email has already registred',
            ),
          ),
        ],
      ),
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 1),
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
