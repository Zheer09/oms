import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/complaintForm.dart';
import '../model/uploadurl.dart';
import '../service/userAcc_service.dart';

class formController {
  void createForm(context, title, department, issueType, location, description,
      List<XFile> images, userID, List<String>? imagesEx) async {
    complaintForm? formCreate = complaintForm(
        fromTitle: title,
        department: department,
        issueType: issueType,
        issueDecription: description,
        status: "pending",
        location: location,
        userID: userID);

    complaintForm? formCreateSet;
    List<UploadFile?> formImages = [];

    formCreateSet =
        await UserService.createForm(form: formCreate, userID: userID);

    if (formCreateSet != null) {
      for (int i = 0; i < images.length; i++) {
        UploadFile tempform = UploadFile(
            filename: images[i].name, userid: userID, filetype: imagesEx?[i]);

        var temp = await UserService.uploadUserPicForm(
            body: tempform, formID: formCreateSet.formID);

        formImages.add(temp);
      }
    }

    for (int i = 0; i < formImages.length; i++) {
      await formImages[i]?.call(formImages[i]?.uploadUrl, images[i]);
      await UserService.uploadUpdateForm(
          body: formImages[i], formID: formCreateSet?.formID, userID: userID);
    }

    await Navigator.of(context).pushNamed('/mainCT');
  }
}
