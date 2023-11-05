import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PizzaModel{
  late int? id;
  late String? pizzaName;
  late String? pizzaIngredients;
  late double? pizzaPrice;
  late String? image;
  late bool? status;
  late bool? discount;
  late double? discountPrice;
  late List<ChoosePizzaPastry>? choosePizzaPastry;
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

class ChoosePizzaPastry{
  late String? pastryName;
  late bool? defaultPastry;
  late bool? status;
  late double? pastryPrice;
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

class PizzaSize{
  late String? pizzaSize;
  late bool? status;
  late bool? defaultSize;
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