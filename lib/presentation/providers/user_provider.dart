import 'package:flutter/material.dart';
import 'package:hdfc_test/domain/service_locator.dart';
import 'package:hdfc_test/domain/service_locator_getit.dart';
import 'package:hdfc_test/domain/user_service.dart';
import 'package:provider/provider.dart';

import '../../data/data_user.dart';

// final service = ServiceLocator.userService;
final service = getIt<UserService>();
class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  List<User> _user = [];
  List<User> get users => _user;

  Future<void> getAllUsers() async {
    print("getAllUsers called");
    isLoading = true;
    notifyListeners();

    try {
      final response = await service.getAllUsers();
      _user = response;
      isError=false;
    }catch(e,s){
      print("err $e");
      debugPrintStack(stackTrace: s);
      isError=true;
    }

    isLoading = false;
    notifyListeners();
  }
//----------------------------------------
  bool isUpdating = false;
  bool isUpdateError = false;
  bool isUpdateSuccess = false;

  Future<void> updateUser(int id, String name, String email, String phone) async {
    isUpdating = true;
    notifyListeners();

    try {
      final response = await service.updateUser(name, email, phone);
      // _user = response;
      isUpdateError=false;
      int index= _user.indexWhere((element) => element.id == id);
      _user[index].email= email;
      _user[index].name= name;
      _user[index].phone= phone;
      isUpdateSuccess=true;
    }catch(e,s){
      print("err $e");
      debugPrintStack(stackTrace: s);
      isUpdateError=false;
      isUpdateSuccess=true;
      int index= _user.indexWhere((element) => element.id == id);
      _user[index].email= email;
      _user[index].name= name;
      _user[index].phone= phone;
    }

    print("ended updateUser");
    isUpdating = false;
    notifyListeners();
  }
}