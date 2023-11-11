import 'package:hive/hive.dart';
part 'PizzaSize.g.dart';
@HiveType(typeId: 4)
class PizzaSize{
  @HiveType(typeId: 0)
  late String? pizzaSize;
  @HiveType(typeId: 1)
  late bool? status;
  @HiveType(typeId: 2)
  late bool? defaultSize;
  @HiveType(typeId: 3)
  late double? price;
  PizzaSize(
      this.pizzaSize,
      this.status,
      this.defaultSize,
      this.price
      );


  Map<String, dynamic> toJson() => {
    "pizzaSize": pizzaSize,
    "status": status,
    "defaultSize": defaultSize,
    "price" : price
  };

  PizzaSize.from(Map<String,dynamic> json) :
        pizzaSize = json["pizzaSize"],
        status = json["status"],
        defaultSize = json["defaultSize"],
        price = json["price"];


}