import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/accountProvider.dart';
import '../model/dashboard_card.dart';

class mtdashboard extends StatefulWidget {
  const mtdashboard({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (context) => mtdashboard());

  @override
  State<mtdashboard> createState() => _mtdashboardState();
}

class _mtdashboardState extends State<mtdashboard> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<accountPro>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          },
          child: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/viewFormCT");
                    },
                    child: Row(children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/worker.png"),
                        radius: 25,
                        backgroundColor: Color(0xFFC2A26A),

                        //backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "${user.User?.firstname} ${user.User?.lastname}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ])),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: Color.fromARGB(255, 224, 224, 224),
                    )
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/workerDash.jpg"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(17))),
            ),
            const SizedBox(
              height: 30,
            ),
            dashboardCard(
              title: "Fomrs",
              subTitle: "View the complaint forms status",
              image: "assets/Status.png",
              context: context,
              router: "/viewStatusMT",
            ),
            dashboardCard(
              title: "archive",
              subTitle: "View archived forms",
              image: "assets/Archive.png",
              context: context,
              router: "/archiveFormCT",
            ),
          ]),
        ),
      )),
    );
  }
}
