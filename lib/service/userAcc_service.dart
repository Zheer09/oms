// ignore: file_names
import 'rest.dart';
import '../model/account.dart';

class UserService {
  static Future<account?> getUser({String? email, String? password}) async {
    final listjson = await Rest.get('api/getAcc/$email/$password');
    return listjson == null ? null : account.fromJson(listjson);
  }
}
