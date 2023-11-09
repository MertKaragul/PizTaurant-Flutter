import 'dart:async';
import 'dart:convert';

import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Model/CartModel/OrderPizzaModel.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/Service/Database/CartDatabase/CartDatabase.dart';

class MainCartViewModel {
  final CartDatabase _cartDatabase = CartDatabase();
  StreamController<List<OrderPizzaModel>> streamController = StreamController();


  Future getCart() async{
    try{
      var data = await _cartDatabase.getAll();
      if(data == null) streamController.addError(InformationModel("Sepet boş", "Sepetiniz boş gözüküyor, hadi sipariş oluşturalım", EInformation.SUCCESS));
      streamController.add(data!);
    }catch(e){
      streamController.addError(InformationModel("Hata", "Siparişlerinizi getirirken bir hata meydana geldi, $e", EInformation.ERROR));
    }
  }


  void close(){
    streamController.close();
  }
}