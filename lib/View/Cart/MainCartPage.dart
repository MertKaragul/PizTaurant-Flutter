import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/View/ErrorPage/PizzaError.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTDialog.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTElavatedButton.dart';
import 'package:piztaurantflutter/ViewModel/MainCartViewModel.dart';

class MainCartPage extends StatefulWidget {
  const MainCartPage({super.key, required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  State<MainCartPage> createState() => _MainCartPageState();
}

class _MainCartPageState extends State<MainCartPage> {
  final MainCartViewModel _mainCartViewModel = MainCartViewModel();

  @override
  void initState() {
    _mainCartViewModel.getCart();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.colorScheme.background,
      body: SafeArea(
        child: StreamBuilder(
          stream: _mainCartViewModel.streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.data == null || snapshot.hasError) {
              return PizzaError(
                  informationModel: InformationModel(
                      "Hata",
                      "Siparişleriniz kontrol edilirken bir hata meydana geldi \n ${snapshot.error}",
                      EInformation.ERROR));
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  var pizzaData = snapshot.data ?? [];
                  if (pizzaData.isEmpty) {
                    return PizzaError(
                        informationModel: InformationModel(
                            "Hata",
                            "Siparişleriniz kontrol edilirken bir hata meydana geldi \n ${snapshot.error}",
                            EInformation.ERROR));
                  }
                  return ListTile(
                    title: Text(
                      pizzaData[index].pizzaModel?.pizzaName ?? "piza yok",
                      style: TextStyle(
                          color: widget.colorScheme.primary,
                          fontSize: 25.0
                      ),
                    ),
                    leading: Image.asset(
                      pizzaData[index].pizzaModel?.image ?? "",
                      width: width * .22,
                      fit: BoxFit.scaleDown,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          pizzaData[index].pizzaModel?.pizzaIngredients ?? "",
                          style: TextStyle(color: widget.colorScheme.primary),
                        ),
                        Text(
                          (pizzaData[index].price ?? 0.0).toString(),
                          style: TextStyle(color: widget.colorScheme.primary),
                        ),
                        PizTElavatedButton(
                            buttonText: "Siparişi iptal et",
                            textColor: widget.colorScheme.onPrimary,
                            containerColor: widget.colorScheme.primary,
                            width: double.infinity,
                            height: height * .05,
                            onPressed: () {
                              _mainCartViewModel.deleteOrder(pizzaData[index]);
                            })
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mainCartViewModel.close();
    super.dispose();
  }
}
