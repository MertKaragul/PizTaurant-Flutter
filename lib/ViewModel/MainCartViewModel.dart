import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Model/CartModel/OrderPizzaModel.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/Service/Database/CartDatabase/CartDatabase.dart';
import 'package:piztaurantflutter/Service/Json/JsonService.dart';

class MainCartViewModel {
  final CartDatabase _cartDatabase = CartDatabase();
  final JsonService _jsonService = JsonService();
  StreamController<List<OrderPizzaModel>> streamController = StreamController();
  List<OrderPizzaModel>? _orderPizzaList;

  Future getCart() async{
    try{
      var data = await _cartDatabase.getAll();
      if(data == null || data.isEmpty) return streamController.addError("Sipariş yok");
      _orderPizzaList = data;
      insertDataStreamController();
    }catch(e){
      streamController.addError(e);
      _orderPizzaList = null;
    }
  }


  void deleteOrder(OrderPizzaModel? t){
    if(t == null) return;
    if(_orderPizzaList == null) return;
    _cartDatabase.delete(t);
    getCart();
  }

  void insertDataStreamController(){
    if(_orderPizzaList == null) return;
    streamController.add(_orderPizzaList!);
  }


  void close(){
    streamController.close();
  }
}