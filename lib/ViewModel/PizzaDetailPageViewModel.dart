import 'dart:async';

import 'package:piztaurantflutter/Model/PizzaModel/OrderPizzaModel.dart';
import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';

class PizzaDetailPageViewModel{
  StreamController<OrderPizzaModel> streamController = StreamController();

  OrderPizzaModel? _pizzaModel;
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

      _pizzaModel = convertPizzaModel;
      streamController.add(convertPizzaModel);
      hideButton = false;
    }catch(e){
      return;
    }
  }

  void updatePastry(ChoosePizzaPastry? choosePizzaPastry){
    if(_pizzaModel == null) return;
    if(choosePizzaPastry == null) return;

    if(_pizzaModel?.choosePizzaPastry != choosePizzaPastry){
      var decreasePrice = (_pizzaModel?.price ?? 0.0) - (_pizzaModel?.choosePizzaPastry?.pastryPrice ?? 0.0);
      _pizzaModel?.price = decreasePrice;
      var newPrice = (_pizzaModel?.price ?? 0.0) + (choosePizzaPastry.pastryPrice ?? 0.0);

      _pizzaModel?.price = newPrice;
      _pizzaModel?.choosePizzaPastry = choosePizzaPastry;
    }

    streamController.sink.add(_pizzaModel!);
  }

  void updateSize(PizzaSize? pizzaSize){
    if(_pizzaModel == null) return;
    if(pizzaSize ==  null) return;

    if(_pizzaModel?.pizzaSize != pizzaSize){

      var getDefaultSizeInPizzaModel = _pizzaModel?.pizzaModel?.pizzaSize?.firstWhere((element) => element.defaultSize ?? false);
      if(_pizzaModel?.pizzaSize != getDefaultSizeInPizzaModel){
        var decreasePrice = (_pizzaModel?.price ?? 0.0) - (_pizzaModel?.pizzaSize?.price ?? 0.0);
        _pizzaModel?.price = decreasePrice;
      }

      var newPrice = (_pizzaModel?.price ?? 0.0) + (pizzaSize.price ?? 0.0);
      _pizzaModel?.price = newPrice;
      _pizzaModel?.pizzaSize = pizzaSize;
    }
    streamController.sink.add(_pizzaModel!);
  }


  void close() {
    streamController.close();
  }

}