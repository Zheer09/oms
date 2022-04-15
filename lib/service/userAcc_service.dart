// ignore: file_names
import '../model/uploadurl.dart';
import 'rest.dart';
import '../model/account.dart';

class UserService {
  static Future<account?> getUser({String? email, String? password}) async {
    final listjson = await Rest.get('api/getAcc/$email/$password');
    return listjson == null ? null : account.fromJson(listjson);
  }

  static Future<account?> createUser({account? user}) async {
    final listjson = await Rest.post('api/createAcc', data: user?.regtoJson());
    return listjson == null ? null : account.fromJson(listjson);
  }

  static Future<UploadFile?> uploadUserPic({UploadFile? body}) async {
    final listjson = await Rest.post('api/uploadImage', data: body?.toJson());
    return listjson == null ? null : UploadFile.fromJson(listjson);
  }
}
