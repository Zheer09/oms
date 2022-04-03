import 'package:flutter/material.dart';

class dashboardCard extends StatefulWidget {
  const dashboardCard({Key? key, String? title, String? subTitle, Image? image})
      : super(key: key);

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
            onTap: () {},
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.18,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(image: AssetImage("assets/complaint.png")),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Complaint",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Complaint to public services")
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
