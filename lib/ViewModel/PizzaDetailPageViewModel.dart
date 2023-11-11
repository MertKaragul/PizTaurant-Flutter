import 'dart:async';
import 'dart:convert';

import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Model/CartModel/OrderPizzaModel.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/Model/PizzaModels/ChoosePizzaPastry.dart';
import 'package:piztaurantflutter/Model/PizzaModels/PizzaModel.dart';
import 'package:piztaurantflutter/Model/PizzaModels/PizzaSize.dart';
import 'package:piztaurantflutter/Service/Database/CartDatabase/CartDatabase.dart';

class PizzaDetailPageViewModel{
  StreamController<OrderPizzaModel> streamController = StreamController();

  final CartDatabase _cartDatabase = CartDatabase();

  OrderPizzaModel? pizzaModel;
  bool hideButton = true;
  double pizzaPrice = 0.0;

  Future setupPizzaModel(Object? args) async{
    if(args == null) return;
    try{
      var convertPizzaModel = args as OrderPizzaModel;

      if(convertPizzaModel.pizzaModel?.discount != null && convertPizzaModel.pizzaModel?.discount == true){
        convertPizzaModel.price = convertPizzaModel.pizzaModel?.discountPrice ?? 0.0;
        pizzaPrice = convertPizzaModel.pizzaModel?.discountPrice ?? 0.0;
      }else{
        convertPizzaModel.price = convertPizzaModel.pizzaModel?.pizzaPrice ?? 0.0;
        pizzaPrice = convertPizzaModel.pizzaModel?.pizzaPrice ?? 0.0;
      }

      streamController.add(convertPizzaModel);
      hideButton = false;
      pizzaModel = convertPizzaModel;
    }catch(e){
      return;
    }
  }

  void updatePastry(ChoosePizzaPastry? choosePizzaPastry){
    if(pizzaModel == null) return;
    if(choosePizzaPastry == null) return;

    if(pizzaModel?.choosePizzaPastry != choosePizzaPastry){
      var decreasePrice = (pizzaModel?.price ?? 0.0) - (pizzaModel?.choosePizzaPastry?.pastryPrice ?? 0.0);
      pizzaModel?.price = decreasePrice;
      var newPrice = (pizzaModel?.price ?? 0.0) + (choosePizzaPastry.pastryPrice ?? 0.0);

      pizzaModel?.price = newPrice;
      pizzaModel?.choosePizzaPastry = choosePizzaPastry;
    }

    streamController.sink.add(pizzaModel!);
  }

  void updateSize(PizzaSize? pizzaSize){
    if(pizzaModel == null) return;
    if(pizzaSize ==  null) return;

    if(pizzaModel?.pizzaSize != pizzaSize){

      var getDefaultSizeInPizzaModel = pizzaModel?.pizzaModel?.pizzaSize?.firstWhere((element) => element.defaultSize ?? false);
      if(pizzaModel?.pizzaSize != getDefaultSizeInPizzaModel){
        var decreasePrice = (pizzaModel?.price ?? 0.0) - (pizzaModel?.pizzaSize?.price ?? 0.0);
        pizzaModel?.price = decreasePrice;
      }

      var newPrice = (pizzaModel?.price ?? 0.0) + (pizzaSize.price ?? 0.0);
      pizzaModel?.price = newPrice;
      pizzaModel?.pizzaSize = pizzaSize;
    }
    streamController.sink.add(pizzaModel!);
  }


  void orderPizza(Function(InformationModel) information){
    if(pizzaModel == null ) {
      information(InformationModel("Hata", "Sipariş oluşturulurken bir hata meydana geldi \n PizzaModel cannot be empty", EInformation.ERROR));
      return;
    }

    if(pizzaModel!.choosePizzaPastry == null || pizzaModel!.pizzaSize == null || pizzaModel!.price == null || pizzaModel!.price == 0.0 ) {
      information(InformationModel("Hata", "Sipariş oluşturulurken bir hata meydana geldi \n PizzaModel cannot be empty", EInformation.ERROR));
      return;
    }

    try{
      _cartDatabase.insert(pizzaModel!);
      information(InformationModel("Başarılı", "Siparişiniz oluşturuldu", EInformation.SUCCESS));
    }catch(e){
      information(InformationModel("Hata", e.toString(), EInformation.ERROR));
    }

  }


  void close() {
    streamController.close();
  }

}