import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EPageRoute.dart';
import 'package:piztaurantflutter/View/HomePage/HomePage.dart';
import 'package:piztaurantflutter/View/PizzaPage/PizzaMenuPage.dart';
import 'package:piztaurantflutter/View/RegisterPage/RegisterPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    final args = routeSettings.arguments;

    var routeName = routeSettings.name;

    if(routeName == EPageRoute.REGISTER_PAGE.name){
      return MaterialPageRoute(builder: (_) => RegisterPage());
    }else if(routeName == EPageRoute.PIZZA_MENU_PAGE.name){
      return MaterialPageRoute(builder: (_) => PizzaMenuPage());
    }else{
      return MaterialPageRoute(builder: (_) => HomePage());
    }
  }

  static void route(BuildContext context, String name, Object arguments) =>
      Navigator.of(context).pushNamed(name, arguments: arguments);
}