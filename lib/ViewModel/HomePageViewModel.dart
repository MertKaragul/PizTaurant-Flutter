import 'package:piztaurantflutter/Model/UserModel/UserModel.dart';
import 'package:piztaurantflutter/Service/Database/UserDatabase/UserDatabase.dart';

class HomePageViewModel{
  final UserDatabase _userDatabase = UserDatabase();

  Future<UserModel?> checkUser() async {
    return (await _userDatabase.getAll())?.first;
  }

}