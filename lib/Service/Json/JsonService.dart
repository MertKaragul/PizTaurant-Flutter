import 'dart:convert';

import 'package:flutter/services.dart';

class JsonService{
  Future<dynamic> readJson(String? path) async{
    if(path == null) throw Exception("Path cannot be empty");
    var response = await rootBundle.loadString(path);
    var data = await jsonDecode(response);
    return data;
  }
}