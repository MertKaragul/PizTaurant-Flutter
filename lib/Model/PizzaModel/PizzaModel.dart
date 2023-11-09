import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'PizzaModel.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class PizzaModel{
  @HiveType(typeId: 0)
  late int? id;
  @HiveType(typeId: 1)
  late String? pizzaName;
  @HiveType(typeId: 2)
  late String? pizzaIngredients;
  @HiveType(typeId: 3)
  late double? pizzaPrice;
  @HiveType(typeId: 4)
  late String? image;
  @HiveType(typeId: 5)
  late bool? status ;
  @HiveType(typeId: 6)
  late bool? discount;
  @HiveType(typeId: 7)
  late double? discountPrice;
  @HiveType(typeId: 8)
  late List<ChoosePizzaPastry>? choosePizzaPastry;
  @HiveType(typeId: 9)
  late List<PizzaSize>? pizzaSize;


  PizzaModel(
    this.id,
    this.pizzaName,
    this.pizzaIngredients,
    this.pizzaPrice,
    this.image,
    this.status,
    this.discount,
    this.discountPrice,
    this.choosePizzaPastry,
    this.pizzaSize
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "pizzaName": pizzaName,
    "pizzaIngredients": pizzaIngredients,
    "pizzaPrice" : pizzaPrice,
    "image" : image,
    "status" : status,
    "discount" : discount,
    "discountPrice" : discountPrice,
    "choosePizzaPastry" : choosePizzaPastry,
    "pizzaSize" : pizzaSize,
  };


  PizzaModel.fromJson(Map<String,dynamic> json) :
      id = json["id"],
      pizzaName = json["pizzaName"],
      pizzaIngredients = json["pizzaIngredients"],
      pizzaPrice = json["pizzaPrice"].toDouble(),
      image = json["image"],
      status = json["status"],
      discount = json["discount"],
      discountPrice = json["discountPrice"].toDouble(),
        choosePizzaPastry = (json["choosePizzaPastry"] as List)
            .map((item) => ChoosePizzaPastry.from(item))
            .toList(),
      pizzaSize = (json["pizzaSize"] as List)
         .map((e) => PizzaSize.from(e))
         .toList();
}

@HiveType(typeId: 3)
class ChoosePizzaPastry{
  @HiveType(typeId: 0)
  late String? pastryName;
  @HiveType(typeId: 1)
  late bool? defaultPastry;
  @HiveType(typeId: 2)
  late bool? status;
  @HiveType(typeId: 3)
  late double? pastryPrice;
  @HiveType(typeId: 4)
  late String? pastryIngredients;

  ChoosePizzaPastry(
      this.pastryName,
      this.defaultPastry,
      this.status,
      this.pastryPrice,
      this.pastryIngredients
  );


  Map<String, dynamic> toJson() => {
    "pastryName": pastryName,
    "defaultPastry": defaultPastry,
    "status": status,
    "pastryPrice" : pastryPrice,
    "pastryIngredients" : pastryIngredients
  };


  ChoosePizzaPastry.from(Map<String,dynamic> json) :
        pastryName = json["pastryName"],
        defaultPastry = json["defaultPastry"],
        status = json["status"],
        pastryPrice = json["pastryPrice"],
        pastryIngredients = json["pastryIngredients"];
}

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