import 'package:flutter/material.dart';

import '../model/complaintForm.dart';

class formscreem extends StatefulWidget {
  formscreem({Key? key, this.forms}) : super(key: key);

  complaintForm? forms;

//static Route route() => MaterialPageRoute(builder: (context) => formscreem(this.forms));

  @override
  State<formscreem> createState() => _formscreemState();
}

class _formscreemState extends State<formscreem> {
  @override
  Widget build(BuildContext context) {
    return Text("${widget.forms?.fromTitle}");
  }
}
