import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:piztaurantflutter/Enums/EPageRoute.dart';
import 'package:piztaurantflutter/Model/CartModel/OrderPizzaModel.dart';
import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';
import 'package:piztaurantflutter/Model/UserModel/UserModel.dart';
import 'package:piztaurantflutter/Service/Database/CartDatabase/CartDatabase.dart';
import 'package:piztaurantflutter/Service/Database/GenericDatabase/DatabaseStrings.dart';
import 'package:piztaurantflutter/Service/Database/UserDatabase/UserDatabase.dart';
import 'package:piztaurantflutter/View/PizzaPage/PizzaMenuPage.dart';
import 'package:piztaurantflutter/View/RegisterPage/RegisterPage.dart';
import 'package:piztaurantflutter/View/Theme/Colors.dart';
import 'package:piztaurantflutter/View/ViewElements/RouteGenerator.dart';
import 'HomePage/HomePage.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PizzaModelAdapter());
  Hive.registerAdapter(ChoosePizzaPastryAdapter());
  Hive.registerAdapter(PizzaSizeAdapter());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(OrderPizzaModelAdapter());

  await UserDatabase().open();
  await CartDatabase().open();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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