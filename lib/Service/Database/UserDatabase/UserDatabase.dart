import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:piztaurantflutter/Model/UserModel/UserModel.dart';
import 'package:piztaurantflutter/Service/Database/GenericDatabase/DatabaseStrings.dart';
import 'package:piztaurantflutter/Service/Database/GenericDatabase/IDatabase.dart';

class UserDatabase extends IDatabase<UserModel> {
  Box<UserModel>? _userDatabase;

  @override
  Future open() async {
    var box = await Hive.openBox<UserModel>(DatabaseStrings.USER_DATABASE);
    _userDatabase = box;
  }

  @override
  Future close() async{
    await _userDatabase?.close();
  }


  @override
  void delete(UserModel t) {
    _userDatabase?.delete(t);
  }

  @override
  Stream<List<UserModel>> getAllStream() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  void insert(UserModel t) async{
    if(_userDatabase == null) throw Exception("Database cannot initialize");
    _userDatabase?.add(t);
  }

  @override
  void update(UserModel t) {

  }

  @override
  Future<List<UserModel>?> getAll() async {
    return _userDatabase?.values.toList();
  }

}