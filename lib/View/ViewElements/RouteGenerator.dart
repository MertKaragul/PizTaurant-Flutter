import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EPageRoute.dart';
import 'package:piztaurantflutter/View/Cart/MainCartPage.dart';
import 'package:piztaurantflutter/View/HomePage/HomePage.dart';
import 'package:piztaurantflutter/View/PizzaDetailPage/PizzaDetailPage.dart';
import 'package:piztaurantflutter/View/RegisterPage/RegisterPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    final args = routeSettings.arguments;

    var routeName = routeSettings.name;

    if(routeName == EPageRoute.REGISTER_PAGE.name){
      return MaterialPageRoute(builder: (_) => RegisterPage());
    }else if(routeName == EPageRoute.PIZZA_DETAIL_PAGE.name){
      return MaterialPageRoute(builder: (context) => PizzaDetailPage(selectedPizza: args, colorScheme: Theme.of(context).colorScheme));
    }else if(routeName == EPageRoute.CART_PAGE.name) {
      return MaterialPageRoute(builder: (context) => MainCartPage(colorScheme: Theme.of(context).colorScheme));
    }else{
      return MaterialPageRoute(builder: (_) => HomePage());
    }
  }

  static void route(BuildContext context, String name, Object arguments) =>
      Navigator.of(context).pushNamed(name, arguments: arguments);

  static void routeReplacement(BuildContext context, String name, Object arguments) =>
      Navigator.of(context).pushReplacementNamed(name, arguments: arguments);
}