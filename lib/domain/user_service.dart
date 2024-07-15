import 'dart:convert';
import 'dart:developer';

import 'package:devxraju_flutter_provider/data/data_updateuser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../data/data_user.dart';


class UserService {
  static const _base = 'https://jsonplaceholder.typicode.com';
  Client? mockHttp;

  Future<List<User>> getAllUsers() async {
    try {
      final res = mockHttp==null ? (await http.get(Uri.parse('$_base/users')))
          :await mockHttp!.get(Uri.parse('$_base/users'));//EDIT MOCK WRONG URLS
      final rawUsers = json.decode(res.body) as List;
      return rawUsers.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<PostResponse> updateUser(String name, String email, String phone) async {
    try {
      final res = mockHttp==null ? (await http.put(Uri.parse('$_base/posts')))
          :await mockHttp!.put(Uri.parse('$_base/posts'));
      final rawUsers = json.decode(res.body) as Map<String,dynamic>;
      return PostResponse.fromMap(rawUsers);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<User>> getAllUsersWrongAPI() async {
    try {
      final res = mockHttp==null ? (await http.get(Uri.parse('$_base/users_abcd')))
          :await mockHttp!.get(Uri.parse('$_base/users_abcd'));
      final rawUsers = json.decode(res.body) as List;
      return rawUsers.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }


}
