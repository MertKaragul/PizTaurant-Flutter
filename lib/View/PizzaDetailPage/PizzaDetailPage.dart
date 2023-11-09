import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Model/CartModel/OrderPizzaModel.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';
import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';
import 'package:piztaurantflutter/View/ErrorPage/PizzaError.dart';
import 'package:piztaurantflutter/View/PizzaDetailPage/PizzaDetailPageSelectables.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTDialog.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTElavatedButton.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTTextField.dart';
import 'package:piztaurantflutter/ViewModel/PizzaDetailPageViewModel.dart';
import 'dart:async';

class PizzaDetailPage extends StatefulWidget {
  const PizzaDetailPage(
      {super.key, required this.selectedPizza, required this.colorScheme});

  final Object? selectedPizza;
  final ColorScheme colorScheme;

  @override
  State<PizzaDetailPage> createState() => _PizzaDetailPageState();
}

class _PizzaDetailPageState extends State<PizzaDetailPage> {
  PizzaDetailPageViewModel pageViewModel = PizzaDetailPageViewModel();
  bool _hideOrderButton = false;
  double _pizzaPrice = 0.0;

  @override
  void initState() {
    pageViewModel.setupPizzaModel(widget.selectedPizza);
    setState(() {
      _hideOrderButton = pageViewModel.hideButton;
      _pizzaPrice = pageViewModel.pizzaPrice;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: widget.colorScheme.background,
      body: StreamBuilder(
        stream: pageViewModel.streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return PizzaError(
                informationModel: InformationModel(
                    "Hata",
                    "Pizzaları getirirken bir hata oldu, ${snapshot.error}",
                    EInformation.ERROR));
          } else {
            var pizzaData = snapshot.data;
            Future.delayed(Duration.zero, () {
              setState(() {
                _pizzaPrice = pizzaData?.price ?? 0.0;
              });
            });
            return SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image(
                            image:
                                AssetImage(pizzaData?.pizzaModel?.image ?? "")),
                        Container(
                          padding: EdgeInsets.fromLTRB((width * .09),
                              (width * .009), (width * .09), (width * .009)),
                          decoration: BoxDecoration(
                              color: widget.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.all(
                                  Radius.circular((width * .03)))),
                          child: Text(
                            pizzaData?.pizzaModel?.pizzaName ?? "",
                            style: TextStyle(
                              color: widget.colorScheme.primary,
                              fontSize: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return PizzaDetailPageSelectables(
                                    title: "Lütfen pizza hamuru seçin",
                                    selectPizzaSize: false,
                                    defaultPizzaSize: pizzaData?.pizzaSize,
                                    pizzaSize: [],
                                    defaultPizzaPastry:
                                        pizzaData?.choosePizzaPastry,
                                    pizzaPastry: pizzaData
                                            ?.pizzaModel?.choosePizzaPastry ??
                                        [],
                                    onSelected: (value) {
                                      return PizTElavatedButton(
                                          height: height * .05,
                                          width: width * .3,
                                          buttonText: "Seç",
                                          textColor: colorScheme.secondary,
                                          containerColor:
                                              colorScheme.secondaryContainer,
                                          onPressed: () {
                                            pageViewModel.updatePastry(
                                                value as ChoosePizzaPastry);
                                            Navigator.of(context).pop();
                                          });
                                    },
                                    onCanceled: () {
                                      return PizTElavatedButton(
                                          height: height * .05,
                                          width: width * .3,
                                          buttonText: "Vazgeç",
                                          textColor: colorScheme.secondary,
                                          containerColor:
                                              colorScheme.secondaryContainer,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          });
                                    });
                              });
                        },
                        child: PizTTextField(
                          hintText:
                              pizzaData?.choosePizzaPastry?.pastryName ?? "",
                          errorText: "",
                          enabled: false,
                          onChange: (value) {},
                        )),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return PizzaDetailPageSelectables(
                                    title: "Lütfen pizza boyutu seçin",
                                    selectPizzaSize: true,
                                    defaultPizzaPastry:
                                        pizzaData?.choosePizzaPastry,
                                    defaultPizzaSize: pizzaData?.pizzaSize,
                                    pizzaSize:
                                        pizzaData?.pizzaModel?.pizzaSize ?? [],
                                    pizzaPastry: [],
                                    onSelected: (value) {
                                      return PizTElavatedButton(
                                          buttonText: "Seç",
                                          height: height * .05,
                                          width: width * .3,
                                          textColor: colorScheme.secondary,
                                          containerColor:
                                              colorScheme.secondaryContainer,
                                          onPressed: () {
                                            pageViewModel
                                                .updateSize(value as PizzaSize);
                                            Navigator.of(context).pop();
                                          });
                                    },
                                    onCanceled: () {
                                      return PizTElavatedButton(
                                          buttonText: "Vazgeç",
                                          height: height * .05,
                                          width: width * .3,
                                          textColor: colorScheme.secondary,
                                          containerColor:
                                              colorScheme.secondaryContainer,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          });
                                    });
                              });
                        },
                        child: PizTTextField(
                          hintText: pizzaData?.pizzaSize?.pizzaSize ?? "",
                          errorText: "",
                          enabled: false,
                          onChange: (value) {},
                        )),
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: _hideOrderButton
          ? null
          : PizTElavatedButton(
              buttonText: "Sipariş ver : $_pizzaPrice",
              textColor: widget.colorScheme.primary,
              containerColor: widget.colorScheme.primaryContainer,
              height: height * .1,
              cornerTopLeft: 15,
              cornerTopRight: 15,
              width: width,
              onPressed: () {
                pageViewModel.orderPizza(
                  (p0) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PizTDialog(
                            title: p0.title,
                            description: p0.description,
                            onConfirm: () {
                              return TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Ok"));
                            },
                            onDismiss: () {
                              return const Text("");
                            });
                      },
                    );
                  },
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    pageViewModel.close();
    super.dispose();
  }
}
