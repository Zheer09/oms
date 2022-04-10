import 'package:flutter/material.dart';
import 'package:oms/screen/complaintScreen.dart';

class dashboardCard extends StatefulWidget {
  dashboardCard({Key? key, this.title, this.subTitle, this.image})
      : super(key: key);

  String? title;
  String? subTitle;
  String? image;

  @override
  State<dashboardCard> createState() => _dashboardCardState();
}

class _dashboardCardState extends State<dashboardCard> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        elevation: 5,
        shadowColor: Colors.black45,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: InkWell(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => widget.callback()));
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.18,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("${widget.image}")),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.title}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("${widget.subTitle}")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }
}
