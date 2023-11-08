import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';

class PizTChoosableDialog extends StatefulWidget {
  const PizTChoosableDialog({super.key, required this.title,required this.selectPizzaSize ,required this.pizzaSize, required this.pizzaPastry  ,required this.onSelected, required this.onCanceled});

  final String title;
  final bool selectPizzaSize;
  final List<PizzaSize> pizzaSize;
  final List<ChoosePizzaPastry> pizzaPastry;
  final Widget Function(String) onSelected;
  final Widget Function() onCanceled;


  @override
  State<PizTChoosableDialog> createState() => _PizTChoosableDialogState();
}

class _PizTChoosableDialogState extends State<PizTChoosableDialog> {
  String _selectedCheckBoxTitle = "";

  @override
  void initState() {
    _selectedCheckBoxTitle = (widget.selectPizzaSize ? widget.pizzaSize.first.pizzaSize ?? "" : widget.pizzaPastry.first.pastryName ?? "");
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
              value: _selectedCheckBoxTitle == (widget.selectPizzaSize == true ? widget.pizzaSize[index].pizzaSize ?? "" : widget.pizzaPastry[index].pastryName ?? ""),
              onChanged: (bool? value) {
                setState(() {

                  _selectedCheckBoxTitle = (widget.selectPizzaSize ? widget.pizzaSize[index].pizzaSize ?? "" : widget.pizzaPastry[index].pastryName ?? "");
                });
              },
            );
          },
        ),
      ),
      actions: [
        widget.onCanceled(),
        widget.onSelected(_selectedCheckBoxTitle)
      ],

    );
  }
}
