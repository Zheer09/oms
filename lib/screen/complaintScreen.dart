import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../controller/formController.dart';
import '../model/Textheme.dart';
import '../model/accountProvider.dart';

class complaint extends StatefulWidget {
  const complaint({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (context) => complaint());

  @override
  State<complaint> createState() => _complaintState();
}

class _complaintState extends State<complaint> {
  String? dropdownvalue;

  bool isLoading = false;

  bool _validtitle = false;
  bool _validDepartment = false;
  bool _validissueTyp = false;
  bool _validLocation = false;
  bool _validDescription = false;

  final _texttitle = TextEditingController();
  final _textDepartment = TextEditingController();
  final _textissueType = TextEditingController();
  final _textLocation = TextEditingController();
  final _textDescription = TextEditingController();

  @override
  void dispose() {
    _texttitle.dispose();
    _textDepartment.dispose();
    _textissueType.dispose();
    _textLocation.dispose();
    _textDescription.dispose();
    super.dispose();
  }

  // List of items in our dropdown menu
  var items = [
    'Water & pipeline',
    'Roads & bridges construction',
    'Services in parks & tourist',
    'Treating sewage',
    'Filtering & cleaning construction',
  ];
  late List<String>? imagesEx = [];
  List<XFile>? images = [];

  final formController? form = new formController();

  final GlobalKey<FormState> _for = GlobalKey<FormState>();

  XFile? image;

  Future pickCameraFront() async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      var temp = image;
      String tempEX = p.extension(image.path);

      setState(() {
        imagesEx?.add(tempEX);
        images?.add(temp);
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Faild to pick image: $e");
    }
  }

  Future pickImageBack() async {
    try {
      final List<XFile>? image = await ImagePicker().pickMultiImage();
      if (image == null) return;

      setState(() {
        for (int i = 0; i < image.length; i++) {
          var tempEX = p.extension(image[i].path);
          imagesEx?.add(tempEX);
          images?.add(image[i]);
        }
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Faild to pick image: $e");
    }
  }

  Future changeImage(int chang) async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      var temp = image;
      var tempEX = p.extension(image.path);

      setState(() {
        imagesEx?[chang] = tempEX;
        images?[chang] = temp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Faild to pick image: $e");
    }
  }

  Future changeImageGall(int chang) async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var temp = image;
      var tempEX = p.extension(image.path);
      setState(() {
        imagesEx?[chang] = tempEX;
        images?[chang] = temp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Faild to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<accountPro>(context);
    if (user.User?.status == "approved") {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _for,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Submit complaint form",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      child: TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            setState(() {
                              if (value!.isEmpty) {
                                _validtitle = true;
                              }
                            });
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              if (_texttitle.text.isEmpty) {
                                _validtitle = true;
                              } else if (_texttitle.text.isNotEmpty) {
                                _validtitle = false;
                              } else {}
                            });
                          },
                          controller: _texttitle,
                          decoration: ThemeHelper().textInputDecoration(
                              lableText: "Title of the issue",
                              valid: _validtitle,
                              hintText: "ex: poteholes"))),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonFormField(
                      validator: (value) {
                        setState(() {
                          if (dropdownvalue == null) {
                            _validDepartment = true;
                          }
                        });
                        return null;
                      },
                      decoration: ThemeHelper().textInputDecoration(
                          lableText: "Department of the issue",
                          valid: _validDepartment,
                          hintText: "ex: poteholes"),
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;

                          if (dropdownvalue!.isEmpty) {
                            _validDepartment = true;
                          } else if (dropdownvalue!.isNotEmpty) {
                            _validDepartment = false;
                          } else {}
                        });
                      },
                    ),
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
                                _validissueTyp = true;
                              }
                            });
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          controller: _textissueType,
                          onChanged: (value) {
                            setState(() {
                              if (_textissueType.text.isEmpty) {
                                _validissueTyp = true;
                              } else if (_textissueType.text.isNotEmpty) {
                                _validissueTyp = false;
                              } else {}
                            });
                          },
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          decoration: ThemeHelper().textInputDecoration(
                              lableText: "Enter your Issue type",
                              valid: _validissueTyp))),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                          validator: (value) {
                            setState(() {
                              if (value!.isEmpty) {
                                _validLocation = true;
                              }
                            });
                            return null;
                          },
                          keyboardType: TextInputType.streetAddress,
                          controller: _textLocation,
                          onChanged: (value) {
                            setState(() {
                              if (_textLocation.text.isEmpty) {
                                _validLocation = true;
                              } else if (_textLocation.text.isNotEmpty) {
                                _validLocation = false;
                              } else {}
                            });
                          },
                          decoration: ThemeHelper().textInputDecoration(
                              suffix: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.location_on_rounded),
                                color: Color(0xFFC2A26A),
                              ),
                              lableText: "Enter your location",
                              valid: _validLocation))),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                          controller: _textDescription,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            setState(() {
                              if (value!.isEmpty) {
                                _validDescription = true;
                              }
                            });
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              if (_textDescription.text.isEmpty) {
                                _validDescription = true;
                              } else if (_textDescription.text.isNotEmpty) {
                                _validDescription = false;
                              } else {}
                            });
                          },
                          decoration: ThemeHelper().textInputDecoration(
                              lableText: "Description of the issue",
                              valid: _validDescription))),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Upload Your Images",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        FloatingActionButton.small(
                          heroTag: "AddingImage",
                          onPressed: () {
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
                                        padding: const EdgeInsets.symmetric(
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
                                                  setState(() {
                                                    pickCameraFront();
                                                  });
                                                },
                                                child: Row(children: const [
                                                  Icon(
                                                    Icons.camera_alt_rounded,
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
                                                  setState(() {
                                                    pickImageBack();
                                                  });
                                                },
                                                child: Row(children: const [
                                                  Icon(
                                                    Icons.photo_album_rounded,
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
                          backgroundColor: const Color(0xFFC2A26A),
                          child: const Icon(
                            Icons.add,
                            size: 25,
                          ),
                        )
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  if (images == null)
                    Container()
                  else
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: 160.0,
                      ),
                      itemCount: images?.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: const BoxDecoration(
                            color: Color(0xFFC2A26A),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.file(
                                  File(images![itemIndex].path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Transform.scale(
                                  scale: 0.6,
                                  child: FloatingActionButton(
                                    heroTag: "deleteImage",
                                    backgroundColor: Colors.redAccent,
                                    onPressed: () {
                                      setState(() {
                                        images?.remove(images?[itemIndex]);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      size: 26,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                left: 90,
                                bottom: 0,
                                child: Transform.scale(
                                  scale: 0.6,
                                  child: FloatingActionButton(
                                    heroTag: "changeImage",
                                    backgroundColor: const Color(0xFFC2A26A),
                                    onPressed: () {
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
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {
                                                              changeImage(
                                                                  itemIndex);
                                                            });
                                                          },
                                                          child: Row(
                                                              children: const [
                                                                Icon(
                                                                  Icons
                                                                      .camera_alt_rounded,
                                                                  color: Colors
                                                                      .grey,
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
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {
                                                              changeImageGall(
                                                                  itemIndex);
                                                            });
                                                          },
                                                          child: Row(
                                                              children: const [
                                                                Icon(
                                                                  Icons
                                                                      .photo_album_rounded,
                                                                  color: Colors
                                                                      .grey,
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
                                    child: const Icon(
                                      Icons.change_circle,
                                      size: 26,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
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
                          if (_for.currentState!.validate() == true) {
                            setState(() {
                              isLoading = true;
                            });
                            form?.createForm(
                                context,
                                _texttitle.text,
                                dropdownvalue,
                                _textissueType.text,
                                _textLocation.text,
                                _textDescription.text,
                                images!,
                                user.User?.id,
                                imagesEx);
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
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const Center(
          child: Text(
            "Your account hasn't been approved yet",
          ),
        ),
      );
    }
  }
}
