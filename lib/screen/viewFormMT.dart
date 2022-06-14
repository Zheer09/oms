import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/accountProvider.dart';
import '../model/complaintForm.dart';
import '../service/userAcc_service.dart';

class viewFormMT extends StatefulWidget {
  viewFormMT({Key? key, this.forms}) : super(key: key);

  complaintForm? forms;
  @override
  State<viewFormMT> createState() => _viewFormState();
}

class _viewFormState extends State<viewFormMT> {
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

  final List<String> itemsStatus = [
    'In Progress',
    'Finishing',
    'Done',
    'Cancled',
  ];
  String? selectedValue;

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
                            "https://oms-pic.s3.amazonaws.com/User${widget.forms?.user.id}/Form${widget.forms?.formID}/${widget.forms?.formImages![itemIndex]}",
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
                        "${widget.forms?.location}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.forms?.issueType}",
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 5,
                                          blurRadius: 15,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    widget.forms?.status,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                                )),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CustomDropdownButton2(
                                hint: 'Select Item',
                                dropdownItems: itemsStatus,
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                              ),
                            ),
                          ]),
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
                                  title: widget.forms?.fromTitle,
                                  department: widget.forms?.department,
                                  description: widget.forms?.issueDecription,
                                  location: widget.forms?.location,
                                  status: selectedValue,
                                  type: widget.forms?.issueType,
                                  userID: widget.forms?.user.id);
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  )),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      )),
    );
  }

  Future<void> updateForm(
      {title,
      department,
      type,
      location,
      description,
      status,
      int? userID}) async {
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
