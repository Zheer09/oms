import 'package:flutter/material.dart';
import 'package:oms/model/account.dart';
import 'package:oms/model/accountProvider.dart';
import 'package:oms/screen/complaintScreen.dart';
import 'package:provider/provider.dart';

import '../model/dashboard_card.dart';

class dashboard extends StatefulWidget {
  dashboard({Key? key, this.user}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (context) => dashboard());

  account? user;

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<accountPro>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: [
            const SizedBox(height: 25),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    "${user.User?.firstname} ${user.User?.lastname}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                  color: Color(0xFFC2A26A),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/Rectangle 6.png"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(17))),
            ),
            const SizedBox(
              height: 30,
            ),
            dashboardCard(
              title: "Complaint",
              subTitle: "Complaint to public services",
              image: "assets/complaint.png",
              context: context,
              router: "/complaintCT",
            ),
            dashboardCard(
              title: "Status",
              subTitle: "View the complaint form status",
              image: "assets/Status.png",
            ),
            dashboardCard(
              title: "archive",
              subTitle: "View archived forms",
              image: "assets/Archive.png",
            ),
          ]),
        ),
      )),
    );
  }
}
