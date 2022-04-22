import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../model/Textheme.dart';
import '../model/accountProvider.dart';
import '../model/complaintForm.dart';

class viewForm extends StatefulWidget {
  viewForm({Key? key, this.forms}) : super(key: key);

  complaintForm? forms;
  @override
  State<viewForm> createState() => _viewFormState();
}

class _viewFormState extends State<viewForm> {
  final GlobalKey<FormState> _for = GlobalKey<FormState>();

  late String? dropdownvalue = "${widget.forms?.department}";

  bool isLoading = false;

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
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
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
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
            key: _for,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(255, 221, 182, 114),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                    )),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 221, 182, 114),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  height: 280,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      height: 200.0,
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
                            "https://oms-pic.s3.amazonaws.com/User${user.User?.id}/Form${widget.forms?.formID}/${widget.forms?.formImages![itemIndex]}",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.forms?.fromTitle}",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.forms?.issueType}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.forms?.location}",
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Color(0xFFC2A26A)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.forms?.department}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10)),
                        ),
                        width: 32,
                        height: 3.5,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${widget.forms?.issueDecription}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 90,
                            height: 50,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 15,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              widget.forms?.status,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )),
                          ))
                    ],
                  ),
                ),
              ],
            )),
      )),
    );
  }
}
