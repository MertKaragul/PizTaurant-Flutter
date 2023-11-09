// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderPizzaModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderPizzaModelAdapter extends TypeAdapter<OrderPizzaModel> {
  @override
  final int typeId = 1;

  @override
  OrderPizzaModel read(BinaryReader reader) {
    return OrderPizzaModel(
      reader.read() as PizzaModel?,
      reader.read() as PizzaSize?,
      reader.read() as ChoosePizzaPastry?,
      reader.readDouble(),

    );
  }

  @override
  void write(BinaryWriter writer, OrderPizzaModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.pizzaModel)
      ..writeByte(1)
      ..write(obj.pizzaSize)
      ..writeByte(2)
      ..write(obj.choosePizzaPastry)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderPizzaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
