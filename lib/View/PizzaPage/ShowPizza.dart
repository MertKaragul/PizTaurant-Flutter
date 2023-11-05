import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';
import 'package:piztaurantflutter/View/ErrorPage/PizzaError.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTElavatedButton.dart';

class ShowPizza extends StatefulWidget {
  const ShowPizza({super.key, required this.pizzaModel});
  final List<PizzaModel> pizzaModel;

  @override
  State<ShowPizza> createState() => _StateShowPizza();
}

class _StateShowPizza extends State<ShowPizza> {

  @override
  void initState() {
    widget.pizzaModel.first.choosePizzaPastry!.forEach((element) { print(element.defaultPastry) ; });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var getPizza = widget.pizzaModel;
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;
    var colorScheme = Theme.of(context).colorScheme;
    return ListView.builder(
      itemCount: getPizza.length,
      itemBuilder: (BuildContext context, int index) {
        var listItem = getPizza[index];
        var pizzaSize = getPizza[index].pizzaSize;
        var pizzaPastry = getPizza[index].choosePizzaPastry;
        return Card(
          color: colorScheme.primaryContainer,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Image(
                  image: AssetImage(listItem.image ?? ""),
                  width: width * .35,
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      listItem.pizzaName ?? "",
                      style: TextStyle(
                          color: colorScheme.primary,
                          fontSize: 25
                      ),
                    ),

                    pizzaSize != null
                        ? Text(pizzaSize.singleWhere((element) => element.defaultSize == true).pizzaSize ?? "", style: TextStyle( color: colorScheme.primary),)
                        : Text(""),

                    pizzaPastry != null
                        ? Text(pizzaPastry.singleWhere((element) => element.defaultPastry == true).pastryName ?? "", style: TextStyle( color: colorScheme.primary ))
                        : Text(""),


                    PizTElavatedButton(
                      textColor: colorScheme.onPrimary,
                      containerColor: colorScheme.onPrimaryContainer,
                      height: heigth * .03,
                      width: width * .5,
                      buttonText: "Ekle",
                      onPressed: () {
                        print("hello");
                      },)
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );

  }
}
