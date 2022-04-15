import 'package:flutter/material.dart';

import '../model/Textheme.dart';

class complaint extends StatefulWidget {
  const complaint({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (context) => complaint());

  @override
  State<complaint> createState() => _complaintState();
}

class _complaintState extends State<complaint> {
  String? dropdownvalue;

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
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
                    child: TextField(
                        keyboardType: TextInputType.name,
                        decoration: ThemeHelper().textInputDecoration(
                            lableText: "Title of the issue",
                            hintText: "ex: poteholes"))),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButtonFormField(
                    decoration: ThemeHelper().textInputDecoration(
                        lableText: "Title of the issue",
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
                      });
                    },
                  ),
                ),
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
                  height: 20,
                ),
                const Text(
                  "Upload Your ID",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
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
                          child: InkWell(
                            onTap: () {},
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
                          )),
                    ),
                    Card(
                      color: Colors.black12,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                          height: 100,
                          child: InkWell(
                            onTap: () {},
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
                          )),
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
                      child: const Text("Submit form")),
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
