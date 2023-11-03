import 'dart:ffi';

import 'package:piztaurantflutter/Model/UserModel/UserModel.dart';
import 'package:piztaurantflutter/Service/Database/UserDatabase/UserDatabase.dart';

class HomePageViewModel{
  final UserDatabase _userDatabase = UserDatabase();

  void open() async {
    await _userDatabase.open();
  }

  Future<List<UserModel>?> checkUser() async {
    return await _userDatabase.getAll();
  }

  void close(){
    _userDatabase.close();
  }
}