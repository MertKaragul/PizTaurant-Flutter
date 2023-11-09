import 'package:hive/hive.dart';
import 'package:piztaurantflutter/Model/UserModel/UserModel.dart';
import 'package:piztaurantflutter/Service/Database/GenericDatabase/DatabaseStrings.dart';
import 'package:piztaurantflutter/Service/Database/GenericDatabase/IDatabase.dart';

class UserDatabase extends IDatabase<UserModel> {
  static Box<UserModel>? _userDatabase;

  @override
  Future open() async {
    _userDatabase = await Hive.openBox<UserModel>(DatabaseStrings.USER_DATABASE);
  }

  @override
  Future close() async{
    if(_userDatabase == null) throw Exception("Database cannot initialize");
    await _userDatabase?.close();
  }


  @override
  void delete(UserModel t) {
    if(_userDatabase == null) throw Exception("Database cannot initialize");
    _userDatabase?.delete(t);
  }

  @override
  Stream<List<UserModel>> getAllStream() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future insert(UserModel t) async{
    if(_userDatabase == null) throw Exception("Database cannot initialize");
    await _userDatabase!.add(t);
  }

  @override
  void update(UserModel t) {

  }

  @override
  Future<List<UserModel>?> getAll() async {
    if(_userDatabase == null) throw Exception("Database cannot initialize");
    return _userDatabase?.values.toList();
  }

}