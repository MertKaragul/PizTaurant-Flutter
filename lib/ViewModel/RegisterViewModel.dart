import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/Model/UserModel/UserModel.dart';
import 'package:piztaurantflutter/Service/Database/UserDatabase/UserDatabase.dart';

class RegisterViewModel {
  final _userDatabase = UserDatabase();


  Future registerUser(String? username, String? password, String? email, Function(InformationModel) information) async{
    if(username == null || password == null || email == null) return information(InformationModel("Hata", "Lütfen kulllanıcı adı, şifre, email bilgilerinizi kontrol edin", EInformation.ERROR));
    if(username.isEmpty || password.isEmpty || email.isEmpty) return information(InformationModel("Hata", "Lütfen kulllanıcı adı, şifre, email bilgilerinizi kontrol edin", EInformation.ERROR));
    try{
      await _userDatabase.insert(UserModel(username, password, email));
      return information(InformationModel("Başarılı", "Hesabınız oluşturuldu", EInformation.SUCCESS));
    }catch(e){
      return information(InformationModel("Hata", "Bir şeyler ters gitti, \n$e", EInformation.ERROR));
    }
  }
}