import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:piztaurantflutter/Model/CartModel/OrderPizzaModel.dart';
import 'package:piztaurantflutter/Model/PizzaModels/ChoosePizzaPastry.dart';
import 'package:piztaurantflutter/Model/PizzaModels/PizzaSize.dart';
part 'PizzaModel.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class PizzaModel{
  @HiveType(typeId: 0)
  int? id;
  @HiveType(typeId: 1)
  String? pizzaName;
  @HiveType(typeId: 2)
  String? pizzaIngredients;
  @HiveType(typeId: 3)
  double? pizzaPrice;
  @HiveType(typeId: 4)
  String? image;
  @HiveType(typeId: 5)
  bool? status;
  @HiveType(typeId: 6)
  bool? discount;
  @HiveType(typeId: 7)
  double? discountPrice;
  @HiveType(typeId: 8)
  List<ChoosePizzaPastry>? choosePizzaPastry;
  @HiveType(typeId: 9)
  List<PizzaSize>? pizzaSize;


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
      choosePizzaPastry = (json["choosePizzaPastry"] as List<dynamic>)
         .map((e){ return ChoosePizzaPastry.from(e); }).toList(),
      pizzaSize = (json["pizzaSize"] as List<dynamic>?)
         ?.map((e) => PizzaSize.from(e))
         .toList();

}



