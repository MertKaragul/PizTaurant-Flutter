import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:piztaurantflutter/Enums/EPageRoute.dart';
import 'package:piztaurantflutter/Model/UserModel/UserModel.dart';
import 'package:piztaurantflutter/Service/Database/GenericDatabase/DatabaseStrings.dart';
import 'package:piztaurantflutter/View/PizzaPage/PizzaMenuPage.dart';
import 'package:piztaurantflutter/View/RegisterPage/RegisterPage.dart';
import 'package:piztaurantflutter/View/Theme/Colors.dart';
import 'package:piztaurantflutter/View/ViewElements/RouteGenerator.dart';
import 'HomePage/HomePage.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: HomePage()
      ),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}