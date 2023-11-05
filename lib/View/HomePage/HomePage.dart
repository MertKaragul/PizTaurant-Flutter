import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Enums/EPageRoute.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/View/ErrorPage/PizzaError.dart';
import 'package:piztaurantflutter/View/PizzaPage/PizzaMenuPage.dart';
import 'package:piztaurantflutter/View/ViewElements/RouteGenerator.dart';
import 'package:piztaurantflutter/ViewModel/HomePageViewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   HomePageViewModel viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var colorScheme = Theme.of(context).colorScheme;
    return FutureBuilder(
      future: viewModel.checkUser(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return PizzaError(informationModel: InformationModel("Hata", snapshot.error.toString() , EInformation.ERROR));
        }if(snapshot.data == null){
          return SafeArea(
              child: SizedBox(
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "PizTaurant'a hoşgeldin",
                      style: TextStyle(
                          fontSize: 35.0,
                          color: colorScheme.primary
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        RouteGenerator.route(context, EPageRoute.REGISTER_PAGE.name, []);
                      },
                      child: Text("Devam et"),
                    )
                  ],
                ),
              )
          );
        }else{
          return PizzaMenuPage();
        }
      },
    );
  }
}
