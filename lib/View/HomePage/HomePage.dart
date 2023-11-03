import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EPageRoute.dart';
import 'package:piztaurantflutter/View/PizzaPage/PizzaMenuPage.dart';
import 'package:piztaurantflutter/View/RegisterPage/RegisterPage.dart';
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
  void initState() {
    viewModel.open();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var colorScheme = Theme.of(context).colorScheme;

    return FutureBuilder(
      future: viewModel.checkUser(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }else if(snapshot.data != null){
          return PizzaMenuPage();
        } else {
          return SafeArea(
              child: Container(
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
        }
      },
    );
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }
}
