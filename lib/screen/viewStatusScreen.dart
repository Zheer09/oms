import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../model/accountProvider.dart';
import '../model/complaintForm.dart';
import '../service/userAcc_service.dart';

class viewStatus extends StatefulWidget {
  const viewStatus({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (context) => viewStatus());

  @override
  State<viewStatus> createState() => _viewStatusState();
}

class _viewStatusState extends State<viewStatus> {
  List<complaintForm>? forms;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<accountPro>(context);

    Future<List<complaintForm>?> forms =
        UserService.getForms(userID: user.User?.id);

    late List<complaintForm?> form;

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
            child: Column(children: [
              Center(
                child: Image.asset("assets/complaint.png", scale: 0.7),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<List<complaintForm>?>(
                  future: forms,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      form = snapshot.data!;
                    }

                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: form.length,
                        itemBuilder: (context, index) => Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Slidable(
                              key: ValueKey(index),
                              endActionPane: ActionPane(
                                  dismissible:
                                      DismissiblePane(onDismissed: () {}),
                                  motion: const DrawerMotion(),
                                  children: const [
                                    SlidableAction(
                                      onPressed: doNothing,
                                      icon: Icons.edit,
                                      foregroundColor: Colors.white,
                                      label: "Edit",
                                      backgroundColor: Colors.blueAccent,
                                    ),
                                    SlidableAction(
                                      onPressed: doNothing,
                                      icon: Icons.delete,
                                      label: "Delete",
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  ]),
                              child: Card(
                                elevation: 5,
                                shadowColor: Colors.black45,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).pushNamed("${widget.router}");
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.18,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Image(
                                                      image: AssetImage(
                                                          "assets/complaint.png")),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${form[index]?.fromTitle}",
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "${form[index]?.issueType}",
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 11,
                                                                  color: Colors
                                                                      .grey),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.arrow_forward_ios),
                                                  Text(
                                                    "${form[index]?.status}",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: form[index]
                                                                    ?.status ==
                                                                "In Progress"
                                                            ? Colors
                                                                .orangeAccent
                                                            : Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              )
                                            ]),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 11,
                          )
                        ]),
                      ),
                    );
                  }),
            ]),
          ),
        ));
  }
}

void doNothing(BuildContext context) {}
