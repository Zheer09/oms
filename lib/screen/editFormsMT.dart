import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/Textheme.dart';
import '../model/accountProvider.dart';
import '../model/complaintForm.dart';
import '../service/userAcc_service.dart';

class editFormMT extends StatefulWidget {
  editFormMT({Key? key, this.forms}) : super(key: key);

  complaintForm? forms;

  @override
  State<editFormMT> createState() => _editFormState();
}

class _editFormState extends State<editFormMT> {
  final GlobalKey<FormState> _for = GlobalKey<FormState>();

  late String? dropdownvalue = "${widget.forms?.department}";

  bool isLoading = false;

  bool _validtitle = false;
  bool _validDepartment = false;
  bool _validissueTyp = false;
  bool _validLocation = false;
  bool _validDescription = false;

  late final _texttitle = TextEditingController(text: widget.forms?.fromTitle);
  late final _textDepartment =
      TextEditingController(text: widget.forms?.department);
  late final _textissueType =
      TextEditingController(text: widget.forms?.issueType);
  late final _textLocation =
      TextEditingController(text: widget.forms?.location);
  late final _textDescription =
      TextEditingController(text: widget.forms?.issueDecription);

  var items = [
    'Water & pipeline',
    'Roads & bridges construction',
    'Services in parks & tourist',
    'Treating sewage',
    'Filtering & cleaning construction',
  ];

  @override
  void dispose() {
    _texttitle.dispose();
    _textDepartment.dispose();
    _textissueType.dispose();
    _textLocation.dispose();
    _textDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<accountPro>(context);
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
                  "Update complaint form",
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
                        enableInteractiveSelection: false,
                        readOnly: true,
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
                        enableInteractiveSelection: false,
                        readOnly: true,
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
                    children: const [
                      Text(
                        "Your Images",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                if (widget.forms?.formImages == null)
                  const CircularProgressIndicator()
                else
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      height: 160.0,
                    ),
                    itemCount: widget.forms?.formImages?.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: const BoxDecoration(
                          color: Color(0xFFC2A26A),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            "https://oms-pic.s3.amazonaws.com/User${widget.forms?.user.id}/Form${widget.forms?.formID}/${widget.forms?.formImages![itemIndex]}",
                            fit: BoxFit.cover,
                          )),
                    ),
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
                        updateForm(
                            _texttitle.text,
                            _textDepartment.text,
                            _textissueType.text,
                            _textLocation.text,
                            _textDescription.text,
                            widget.forms?.status,
                            widget.forms?.user.id);
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
                          : const Text("Update")),
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

  Future<void> updateForm(title, department, type, location, description,
      status, int? userID) async {
    complaintForm send = complaintForm(
        formID: widget.forms?.formID,
        fromTitle: title,
        department: department,
        issueType: type,
        location: location,
        issueDecription: description,
        status: status);

    complaintForm? res = await UserService.updateForm(
        formID: widget.forms?.formID, userID: userID, body: send);

    if (res != null) {
      Navigator.of(context).pushNamed("/mainMT");
    }
  }
}
