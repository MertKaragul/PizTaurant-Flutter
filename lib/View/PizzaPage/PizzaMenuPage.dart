import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/View/ErrorPage/PizzaError.dart';
import 'package:piztaurantflutter/View/PizzaPage/ShowPizza.dart';
import 'package:piztaurantflutter/ViewModel/PizzaMenuPageViewModel.dart';

class PizzaMenuPage extends StatefulWidget {
  const PizzaMenuPage({super.key});

  @override
  State<PizzaMenuPage> createState() => _PizzaMenuPageState();
}

class _PizzaMenuPageState extends State<PizzaMenuPage> {
  PizzaMenuPageViewModel pizzaMenuPageViewModel = PizzaMenuPageViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: pizzaMenuPageViewModel.getPizza(),
          builder: (context, snapshot) {
            var getPizza = snapshot.data;
            if(snapshot.connectionState  == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else if(snapshot.hasError){
              return PizzaError(informationModel: InformationModel("Hata" , "Pizzaları getirirken bir hata ile karşılaştık \n ${snapshot.error}" , EInformation.ERROR));
            } else if(getPizza == null || getPizza.isEmpty){
              return PizzaError(informationModel: InformationModel("Hata" , "Pizzaları getirirken bir hata ile karşılaştık" , EInformation.ERROR));
            }else{
              return ShowPizza(pizzaModel: getPizza);
            }
          },
      ),
    );
  }
}
