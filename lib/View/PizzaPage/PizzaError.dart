
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Model/InformationModel.dart';

class PizzaError extends StatelessWidget {
  const PizzaError({super.key , required this.informationModel});
  final InformationModel informationModel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            informationModel.title,
            style: TextStyle(
              fontSize: 35.0,
              color: colorScheme.primary
            ),
          ),
          Text(
            informationModel.description,
            style: TextStyle(
                fontSize: 15.0,
                color: colorScheme.primary
            ),
          )
        ],
      ),
    );
  }
}
