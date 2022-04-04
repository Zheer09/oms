import 'package:flutter/material.dart';

import '../model/dashboard_card.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
            onPressed: (() {}),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: [
            const SizedBox(height: 25),
            Row(
              children: const [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "Ahmed Kamaran",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            const dashboardCard(),
            const dashboardCard(),
            const dashboardCard(),
          ]),
        ),
      )),
    );
  }
}
