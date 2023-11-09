import 'package:hive/hive.dart';
import 'package:piztaurantflutter/Model/PizzaModel/PizzaModel.dart';
part 'OrderPizzaModel.g.dart';

@HiveType(typeId: 1)
class OrderPizzaModel{
  @HiveField(0)
  PizzaModel? pizzaModel;
  @HiveField(1)
  PizzaSize? pizzaSize;
  @HiveField(2)
  ChoosePizzaPastry? choosePizzaPastry;
  @HiveField(3)
  double? price;

  OrderPizzaModel(this.pizzaModel, this.pizzaSize, this.choosePizzaPastry, this.price);
}