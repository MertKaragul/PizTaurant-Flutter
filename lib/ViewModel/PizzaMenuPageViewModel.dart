import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:piztaurantflutter/Model/PizzaModels/PizzaModel.dart';
import 'package:piztaurantflutter/Service/Json/JsonService.dart';

class PizzaMenuPageViewModel {
  final _jsonService = JsonService();

  Future<List<PizzaModel>> getPizza() async{
    try{
      var json = <PizzaModel>[];
      var data = await _jsonService.readJson("assets/pizza-data.json") as List<dynamic>;
      for (var element in data) { json.add(PizzaModel.fromJson(element)); }
      return json;
    }catch(e){
      print(e);
      return [];
    }
  }
}