import 'package:hive/hive.dart';
part 'ChoosePizzaPastry.g.dart';


@HiveType(typeId: 3)
class ChoosePizzaPastry{
  @HiveType(typeId: 0)
  late String? pastryName;
  @HiveType(typeId: 1)
  late bool? defaultPastry;
  @HiveType(typeId: 2)
  late bool? status;
  @HiveType(typeId: 3)
  late double? pastryPrice;
  @HiveType(typeId: 4)
  late String? pastryIngredients;

  ChoosePizzaPastry(
      this.pastryName,
      this.defaultPastry,
      this.status,
      this.pastryPrice,
      this.pastryIngredients
  );




  Map<String, dynamic> toJson() => {
    "pastryName": pastryName,
    "defaultPastry": defaultPastry,
    "status": status,
    "pastryPrice" : pastryPrice,
    "pastryIngredients" : pastryIngredients
  };


   ChoosePizzaPastry.from(Map<String,dynamic> json) :
        pastryName = json["pastryName"],
        defaultPastry = json["defaultPastry"],
        status = json["status"],
        pastryPrice = json["pastryPrice"],
        pastryIngredients = json["pastryIngredients"];
}