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
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return OrderPizzaModel(
      fields[0] as PizzaModel?,
      fields[1] as PizzaSize?,
      fields[2] as ChoosePizzaPastry?,
      fields[3] as double?,
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
