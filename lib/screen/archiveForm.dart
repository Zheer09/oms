import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/accountProvider.dart';
import '../model/complaintForm.dart';
import '../model/uploadurl.dart';
import '../service/userAcc_service.dart';

class archiveForm extends StatefulWidget {
  const archiveForm({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (context) => archiveForm());

  @override
  State<archiveForm> createState() => _archiveFormState();
}

class _archiveFormState extends State<archiveForm> {
  complaintForm? deleted;
  List<complaintForm>? forms;
  UploadFile? images;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<accountPro>(context);

    Future<List<complaintForm>?> getform() async {
      forms = await UserService.getForms(userID: user.User?.id);

      return forms;
    }

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
                child: Image.asset("assets/Archive.png", scale: 0.7),
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
                              form[index]?.status == "Done" ||
                                      form[index]?.status == "Cancled"
                                  ? Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Card(
                                          elevation: 5,
                                          shadowColor: Colors.black45,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))),
                                          child: InkWell(
                                              onTap: () {},
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.18,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
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
                                                            const Image(
                                                                image: AssetImage(
                                                                    "assets/Archive.png")),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
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
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    "${form[index]?.issueType}",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .clip,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            11,
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
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            const Icon(Icons
                                                                .arrow_forward_ios),
                                                            Text(
                                                              "${form[index]?.status}",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: form[index]
                                                                              ?.status ==
                                                                          "Cancled"
                                                                      ? Colors
                                                                          .redAccent
                                                                      : Colors
                                                                          .greenAccent,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )
                                                          ],
                                                        )
                                                      ]),
                                                ),
                                              )),
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
