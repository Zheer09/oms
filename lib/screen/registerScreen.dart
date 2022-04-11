// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../model/Textheme.dart';

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
  XFile? imageFront;
  XFile? imageBack;

  Future pickImageFront() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        imageFront = imageTemp as XFile?;
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
      final imageTemp = File(image.path);
      setState(() {
        imageBack = imageTemp as XFile?;
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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
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
                        child: TextField(
                            keyboardType: TextInputType.name,
                            decoration: ThemeHelper().textInputDecoration(
                                lableText: "First Name", hintText: "Shalaw"))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: TextField(
                            keyboardType: TextInputType.name,
                            decoration: ThemeHelper().textInputDecoration(
                                lableText: "last Name", hintText: "Ahmed"))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: ThemeHelper().textInputDecoration(
                            suffixIcon: const Icon(
                              Icons.email,
                              color: Color(0xFFC2A26A),
                            ),
                            lableText: "Enter your email address",
                            hintText: "Example@example.com"))),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black54),
                        decoration: ThemeHelper().textInputDecoration(
                            suffixIcon: const Icon(
                              Icons.phone_iphone_rounded,
                              color: Color(0xFFC2A26A),
                            ),
                            lableText: "Enter your phone number",
                            phone: true))),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: ThemeHelper().textInputDecoration(
                          suffixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xFFC2A26A),
                          ),
                          lableText: "Enter your Password",
                        ))),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: ThemeHelper().textInputDecoration(
                          lableText: "Re-enter your Password",
                        ))),
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
                                        color: Colors.black26,
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
                      onPressed: () {},
                      child: const Text("Submit")),
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
}
