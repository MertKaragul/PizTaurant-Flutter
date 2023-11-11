import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class JsonService {
  Future<dynamic> readJson(String? path) async{
    if(path == null) throw Exception("Path cannot be empty");
    var response = await rootBundle.loadString(path);
    var data = await jsonDecode(response);
    return data;
  }

  List<Map<String,dynamic>> listJsonConvertMap(List<dynamic>? jsonList){
    if(jsonList == null) throw Exception("ListJsonConvert error; JsonList cannot be empty");
    if(jsonList.isEmpty) throw Exception("ListJsonConvert error; JsonList cannot be empty");

    var returnableList = <Map<String,dynamic>>[];
    for (var element in jsonList) {
      try{
        var data = json.decode(element) as Map<String,dynamic>;
        returnableList.add(data);
      }catch(e){
        throw Exception("ListJsonConvert error; JsonList cannot be converted");
      }
    }
    return returnableList;
  }

}