import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Model/PizzaModels/PizzaModel.dart';
import 'package:piztaurantflutter/Model/PizzaModels/ChoosePizzaPastry.dart';
import 'package:piztaurantflutter/Model/PizzaModels/PizzaSize.dart';

class PizzaDetailPageSelectables extends StatefulWidget {
  const PizzaDetailPageSelectables({
    super.key,
    required this.title,
    required this.defaultPizzaSize,
    required this.selectPizzaSize ,
    required this.pizzaSize,
    required this.defaultPizzaPastry,
    required this.pizzaPastry,
    required this.onSelected,
    required this.onCanceled
  });

  final String title;
  final bool selectPizzaSize;
  // Pizza size
  final PizzaSize? defaultPizzaSize;
  final List<PizzaSize> pizzaSize;
  // Pizza pastry
  final ChoosePizzaPastry? defaultPizzaPastry;
  final List<ChoosePizzaPastry> pizzaPastry;
  // Widget
  final Widget Function(dynamic) onSelected;
  final Widget Function() onCanceled;


  @override
  State<PizzaDetailPageSelectables> createState() => _PizzaDetailPageSelectablesState();
}

class _PizzaDetailPageSelectablesState extends State<PizzaDetailPageSelectables> {
  dynamic _selectedValue;

  @override
  void initState() {
    _selectedValue = (widget.selectPizzaSize ? widget.defaultPizzaSize : widget.defaultPizzaPastry);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return AlertDialog(
      backgroundColor: colorScheme.secondaryContainer,
      title: Text(
          widget.title,
          style: TextStyle(
              color: colorScheme.secondary
          )
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.selectPizzaSize ? widget.pizzaSize.length : widget.pizzaPastry.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              activeColor: colorScheme.secondary,
              checkColor: Colors.white,
              title: Row(
                children: [
                  Text(
                    widget.selectPizzaSize ? widget.pizzaSize[index].pizzaSize ?? "" : widget.pizzaPastry[index].pastryName ?? "" ,
                    style: TextStyle(
                        color: colorScheme.secondary
                    ),
                  ),
                  Spacer(),
                  Text(
                    widget.selectPizzaSize ? (widget.pizzaSize[index].price ?? 0.0).toString() : (widget.pizzaPastry[index].pastryPrice ?? 0.0).toString(),
                    style: TextStyle(
                        color: colorScheme.secondary
                    ),
                  )
                ],
              ),
              value: _selectedValue == (widget.selectPizzaSize == true ? widget.pizzaSize[index] : widget.pizzaPastry[index]),
              onChanged: (bool? value) {
                setState(() {
                  _selectedValue = widget.selectPizzaSize ? widget.pizzaSize[index] : widget.pizzaPastry[index];
                });
              },
            );
          },
        ),
      ),
      actions: [
        widget.onCanceled(),
        widget.onSelected(_selectedValue)
      ],
    );
  }
}
