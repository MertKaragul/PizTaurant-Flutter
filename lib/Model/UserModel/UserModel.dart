import 'package:hive/hive.dart';
part 'UserModel.g.dart';

@HiveType(typeId: 0)
class UserModel{
  @HiveField(0)
  late String username;
  @HiveField(1)
  late String email;
  @HiveField(2)
  late String password;
  UserModel(this.username, this.password , this.email);


  Map<String,dynamic> toMap(){
    return <String, dynamic>{
      "username" : username,
      "email" : email,
      "password" : password
    };
  }
}