import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';

class OrderPizzaModel{
  PizzaModel? pizzaModel;
  PizzaSize? pizzaSize;
  ChoosePizzaPastry? choosePizzaPastry;
  double? price;

  OrderPizzaModel(this.pizzaModel, this.pizzaSize, this.choosePizzaPastry, this.price);
}