import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';
import 'package:piztaurantflutter/View/ErrorPage/PizzaError.dart';
import 'package:piztaurantflutter/View/Theme/Colors.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTElavatedButton.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTTextField.dart';
import 'package:piztaurantflutter/ViewModel/PizzaDetailPageViewModel.dart';

class PizzaDetailPage extends StatefulWidget {
  const PizzaDetailPage({super.key, required this.selectedPizza, required this.colorScheme});

  final Object? selectedPizza;
  final ColorScheme colorScheme;

  @override
  State<PizzaDetailPage> createState() => _PizzaDetailPageState();
}

class _PizzaDetailPageState extends State<PizzaDetailPage> {
  PizzaDetailPageViewModel pageViewModel = PizzaDetailPageViewModel();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.colorScheme.background,
      body: StreamBuilder(
        stream: pageViewModel.getSelectedPizza(widget.selectedPizza),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError || snapshot.data == null){
            return PizzaError(informationModel: InformationModel("Hata", "Pizzaları getirirken bir hata oldu, ${snapshot.error}", EInformation.ERROR));
          }else{
            return SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image(
                            image : AssetImage(snapshot.data?.image ?? "")
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB((width * .09), (width * .009), (width * .09), (width * .009)),
                          decoration: BoxDecoration(
                              color: widget.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.all(Radius.circular((width * .03)))
                          ),
                          child: Text(
                            snapshot.data?.pizzaName ?? "",
                            style: TextStyle(
                              color: widget.colorScheme.primary,
                              fontSize: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                    GestureDetector(onTap: (){ print("pastry working"); } ,child: PizTTextField(hintText: snapshot.data?.choosePizzaPastry?.firstWhere((element) => element.defaultPastry ?? false).pastryName ?? "", errorText: "", enabled: false, onChange:(value) {},)),
                    GestureDetector(onTap: (){ print("size working"); },child: PizTTextField(hintText: snapshot.data?.pizzaSize?.firstWhere((element) => element.defaultSize ?? false).pizzaSize ?? "", errorText: "", enabled: false, onChange:(value) {},)),
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: PizTElavatedButton(buttonText: "Sipariş ver : 10.0",
        textColor: widget.colorScheme.primary,
        containerColor: widget.colorScheme.primaryContainer,
        height: height * .1,
        cornerTopLeft: 30,
        cornerTopRight: 30,
        width: width, onPressed: () {

    },),
    );
  }
}
