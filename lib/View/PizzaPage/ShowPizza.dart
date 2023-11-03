import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';
import 'package:piztaurantflutter/View/PizzaPage/PizzaError.dart';

class ShowPizza extends StatefulWidget {
  const ShowPizza({super.key, required this.pizzaModel});
  final List<PizzaModel>? pizzaModel;

  @override
  State<ShowPizza> createState() => _StateShowPizza();
}

class _StateShowPizza extends State<ShowPizza> {
  @override
  Widget build(BuildContext context) {
    var getPizza = widget.pizzaModel;
    var width = MediaQuery.of(context).size.width;
    var colorScheme = Theme.of(context).colorScheme;
    if(getPizza == null) {
      return PizzaError(informationModel: InformationModel("Hata" , "Pizzaları getiremedikasdasd", EInformation.ERROR));
    }else{
      return SafeArea(
        child: ListView.builder(
            itemCount: getPizza.length,
            itemBuilder: (BuildContext context, int index) {
              var pizza = getPizza[index];
              Text(pizza.toString());
              SizedBox(
                width: width,
                child: Column(
                  children: [
                    Text(
                      pizza.id.toString(),
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 25.0,
                      ),
                    )
                  ],
                ),
              );
            }
        ),
      );
    }

  }
}
