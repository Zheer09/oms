// ignore: file_names
import '../model/complaintForm.dart';
import '../model/uploadurl.dart';
import 'rest.dart';
import '../model/account.dart';

class UserService {
  static Future<account?> getUser({String? email, String? password}) async {
    final listjson = await Rest.get('api/getAcc/$email/$password');
    return listjson == null ? null : account.fromJson(listjson);
  }

  static Future<List<complaintForm>?> getForms({int? userID}) async {
    final List listjson = await Rest.get('api/getForms/$userID');
    return listjson.map((json) => complaintForm.fromJson(json)).toList();
  }

  static Future<account?> createUser({account? user}) async {
    final listjson = await Rest.post('api/createAcc', data: user?.regtoJson());
    return listjson == null ? null : account.fromJson(listjson);
  }

  static Future<UploadFile?> uploadUserPic({UploadFile? body}) async {
    final listjson = await Rest.post('api/uploadImage', data: body?.toJson());
    return listjson == null ? null : UploadFile.fromJson(listjson);
  }

  static Future<UploadFile?> uploadUserPicForm(
      {UploadFile? body, int? formID}) async {
    final listjson =
        await Rest.post('api/uploadFormImage/$formID', data: body?.toJson());
    return listjson == null ? null : UploadFile.fromJson(listjson);
  }

  static Future<UploadFile?> uploadUpdateForm(
      {List<String?>? body, int? formID, int? userID}) async {
    final listjson =
        await Rest.put('api/updateForm/$userID/$formID', data: body);
    return listjson == null ? null : UploadFile.fromJson(listjson);
  }

  static Future<UploadFile?> deleteFormImages(
      {Map<String, dynamic>? body, int? formID, int? userID}) async {
    final listjson =
        await Rest.put('api/deleteImage/$userID/$formID', data: body);
    return listjson == null ? null : UploadFile.deleteJson(listjson);
  }

  static Future<complaintForm?> createForm(
      {complaintForm? form, int? userID}) async {
    //print(form?.department);
    final listjson =
        await Rest.post('api/createForm/$userID', data: form?.toJson());

    return listjson == null ? null : complaintForm.fromJsonReg(listjson);
  }

  static Future<complaintForm?> deletForm({int? formID}) async {
    final listjson = await Rest.delete('api/deleteForm/$formID');
    return listjson == null ? null : complaintForm.deleteJson(listjson);
  }
}
