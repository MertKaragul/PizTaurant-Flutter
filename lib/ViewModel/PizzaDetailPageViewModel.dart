import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';

class PizzaDetailPageViewModel{

  Stream<PizzaModel>? getSelectedPizza(Object? args){
    if(args == null) return null;
    try{
      return Stream.value(args as PizzaModel);
    }catch(e){
      return null;
    }
  }


}