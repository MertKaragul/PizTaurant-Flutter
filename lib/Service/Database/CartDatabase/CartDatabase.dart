import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:piztaurantflutter/Model/CartModel/OrderPizzaModel.dart';
import 'package:piztaurantflutter/Service/Database/GenericDatabase/DatabaseStrings.dart';
import 'package:piztaurantflutter/Service/Database/GenericDatabase/IDatabase.dart';

class CartDatabase extends IDatabase<OrderPizzaModel>{
  static Box<OrderPizzaModel>? _cartDatabase;

  @override
  Future open() async {
    _cartDatabase = await Hive.openBox(DatabaseStrings.CART_DATABASE);
  }

  @override
  Future close() async{
    await _cartDatabase?.close();
  }

  @override
  Future delete(OrderPizzaModel t) async {
    if(_cartDatabase == null) throw Exception("Cart database cannot be initialized");
    try{
      await _cartDatabase!.delete(t.key);
    }catch(e){
      throw Exception("Cart database has been error, \n $e");
    }
  }

  @override
  Future<List<OrderPizzaModel>?> getAll() async{
    if(_cartDatabase == null) throw Exception("Cart database cannot be initialized");
    try{
      return _cartDatabase!.values.toList();
    }catch(e){
      throw Exception("Cart database has been error, \n $e");
    }

  }

  @override
  Stream<List<OrderPizzaModel>> getAllStream() {
    // TODO: implement getAllStream
    throw UnimplementedError();
  }

  @override
  Future insert(OrderPizzaModel t) async{
    if(_cartDatabase == null) return throw Exception("Cart database cannot be initialized");
    try{
      await _cartDatabase!.add(t);
    }catch(e){
      return throw Exception("Cart database has been error, \n $e");
    }
  }

  @override
  void update(OrderPizzaModel t) {
    // TODO: implement update
  }

}