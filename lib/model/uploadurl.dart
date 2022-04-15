import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';

class UploadFile {
  bool? success;
  String? message;

  bool? isUploaded;

  String? uploadUrl;
  String? downloadUrl;

  int? userID;
  String? fileName;
  String? fileType;

  UploadFile({int? userid, String? filename, String? filetype}) {
    userID = userid;
    fileName = filename;
    fileType = filetype;
  }

  Future<void> call(String? url, XFile? image) async {
    try {
      Uint8List? bytes = await image?.readAsBytes();
      var response = await http.put(Uri.parse(url!), body: bytes);

      if (response.statusCode == 200) {
        isUploaded = true;
      } else {
        print("Not uploading");
      }
    } catch (e) {
      print(e);
      throw ('Error uploading photo');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = userID;
    data['fileType'] = fileType;
    data['fileName'] = fileName;
    return data;
  }

  UploadFile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    uploadUrl = json['uploadUrl'];
    downloadUrl = json['downloadUrl'];
  }
}
