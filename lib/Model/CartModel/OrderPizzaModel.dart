import 'package:hive/hive.dart';
import 'package:piztaurantflutter/Model/PizzaModels/ChoosePizzaPastry.dart';
import 'package:piztaurantflutter/Model/PizzaModels/PizzaModel.dart';
import 'package:piztaurantflutter/Model/PizzaModels/PizzaSize.dart';
part 'OrderPizzaModel.g.dart';

@HiveType(typeId: 1)
class OrderPizzaModel extends HiveObject {
  @HiveField(0)
  PizzaModel? pizzaModel;
  @HiveField(1)
  PizzaSize? pizzaSize;
  @HiveField(2)
  ChoosePizzaPastry? choosePizzaPastry;
  @HiveField(3)
  double? price;

  OrderPizzaModel(
  this.pizzaModel,
  this.pizzaSize,
  this.choosePizzaPastry,
  this.price
  );


  Map<String, dynamic> toJson() => {
    "pizzaModel" : pizzaModel?.toJson(),
    "pizzaSize" : pizzaSize?.toJson(),
    "choosePizzaPastry" : choosePizzaPastry?.toJson(),
    "price" : price,
  };

  OrderPizzaModel.from(Map<String,dynamic> json) :
        pizzaModel = PizzaModel.fromJson(json["pizzaModel"]),
        pizzaSize = PizzaSize.from(json["pizzaSize"]),
        choosePizzaPastry = ChoosePizzaPastry.from(json["choosePizzaPastry"]),
        price = json["price"];
}