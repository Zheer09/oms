import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:oms/screen/editFormsMT.dart';
import 'package:oms/screen/viewForm.dart';
import 'package:provider/provider.dart';

import '../model/accountProvider.dart';
import '../model/complaintForm.dart';
import '../model/uploadurl.dart';
import '../service/userAcc_service.dart';
import 'editForms.dart';
import 'formScreen.dart';
import 'viewFormMT.dart';

class viewStatusMT extends StatefulWidget {
  const viewStatusMT({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (context) => viewStatusMT());

  @override
  State<viewStatusMT> createState() => _viewStatusState();
}

class _viewStatusState extends State<viewStatusMT> {
  complaintForm? deleted;
  List<complaintForm>? forms;
  UploadFile? images;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<accountPro>(context);

    Future<List<complaintForm>?> getform() async {
      forms = await UserService.allGetForms();

      return forms;
    }

    late List<complaintForm?> form = [];

    if (form.isEmpty) {
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
                    future: getform(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        form = snapshot.data!;

                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            itemCount: form.length,
                            itemBuilder: (context, index) =>
                                form[index]?.status != "Done" ||
                                        form[index]?.status != "Cancled"
                                    ? Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Slidable(
                                            key: ValueKey(index),
                                            endActionPane: ActionPane(
                                                dismissible: form[index]
                                                            ?.status ==
                                                        "pending"
                                                    ? DismissiblePane(
                                                        onDismissed: () async {
                                                        await deleteForm(
                                                            formID: form[index]
                                                                ?.formID,
                                                            userID:
                                                                user.User?.id,
                                                            formimages: form[
                                                                    index]
                                                                ?.formImages);

                                                        setState(() {
                                                          getform();
                                                        });
                                                      })
                                                    : null,
                                                motion: const DrawerMotion(),
                                                children: [
                                                  SlidableAction(
                                                    onPressed:
                                                        (BuildContext context) {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    editFormMT(
                                                                      forms: form[
                                                                          index],
                                                                    )),
                                                      );
                                                    },
                                                    icon: Icons.edit,
                                                    foregroundColor:
                                                        Colors.white,
                                                    label: "Edit",
                                                    backgroundColor:
                                                        Colors.blueAccent,
                                                  ),
                                                ]),
                                            child: Card(
                                              elevation: 5,
                                              shadowColor: Colors.black45,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  12))),
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              viewFormMT(
                                                                forms:
                                                                    form[index],
                                                              )),
                                                    );
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.18,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Image(
                                                                    image: AssetImage(
                                                                        "assets/complaint.png")),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
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
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: 20),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        "${form[index]?.issueType}",
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                11,
                                                                            color:
                                                                                Colors.grey),
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
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Icon(Icons
                                                                    .arrow_forward_ios),
                                                                Text(
                                                                  "${form[index]?.status}",
                                                                  style: TextStyle(
                                                                      fontSize: 13,
                                                                      color: form[index]?.status == "In Progress"
                                                                          ? Colors.orangeAccent
                                                                          : form[index]?.status == "approved"
                                                                              ? Colors.greenAccent
                                                                              : form[index]?.status == "Cancled"
                                                                                  ? Colors.redAccent
                                                                                  : Colors.grey,
                                                                      fontWeight: FontWeight.w500),
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
                                      ])
                                    : Column(),
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              ]),
            ),
          ));
    } else {
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
        body: const Center(
          child: Text(
            "No form has been submitted",
          ),
        ),
      );
    }
  }

  Future<void> deleteForm(
      {int? formID, int? userID, List<dynamic>? formimages}) async {
    deleted = await UserService.deletForm(formID: formID);

    for (int i = 0; i < formimages!.length; i++) {
      Map<String, dynamic> json() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['images'] = formimages[i];
        return data;
      }

      images = await UserService.deleteFormImages(
          formID: formID, userID: userID, body: json());
    }
  }
}
