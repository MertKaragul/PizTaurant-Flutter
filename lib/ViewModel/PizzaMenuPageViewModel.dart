import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';
import 'package:piztaurantflutter/Service/Json/JsonService.dart';

class PizzaMenuPageViewModel {
  final _jsonService = JsonService();

  Future<List<PizzaModel>?> getPizza() async{
    var data = [];
    var json = <PizzaModel>[];
    try{
      data = await _jsonService.readJson("assets/pizza-data.json") as List<dynamic>;
    }catch(e){
      data = [];
    }

    if(data.isNotEmpty){
      for (var element in data) {
        //json.add(PizzaModel.fromJson(element));
      }
    }
    return json;
  }

}