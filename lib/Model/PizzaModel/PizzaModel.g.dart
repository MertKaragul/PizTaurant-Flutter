// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PizzaModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PizzaModelAdapter extends TypeAdapter<PizzaModel> {
  @override
  final int typeId = 2;

  @override
  PizzaModel read(BinaryReader reader) {
    return PizzaModel(
      reader.readInt(),
      reader.readString(),
      reader.readString(),
      reader.readDouble(),
      reader.readString(),
      reader.readBool(),
      reader.readBool(),
      reader.readDouble(),
      reader.readList as List<ChoosePizzaPastry>?,
      reader.readList as List<PizzaSize>?,
    );
  }

  @override
  void write(BinaryWriter writer, PizzaModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.pizzaName)
      ..writeByte(2)
      ..write(obj.pizzaIngredients)
      ..writeByte(3)
      ..write(obj.pizzaPrice)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.discount)
      ..writeByte(7)
      ..write(obj.discountPrice)
      ..writeByte(8)
      ..writeList(obj.choosePizzaPastry!.cast<ChoosePizzaPastry>())
      ..writeByte(9)
      ..writeList(obj.pizzaSize!.cast<PizzaSize>());
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PizzaModelAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}

class ChoosePizzaPastryAdapter extends TypeAdapter<ChoosePizzaPastry> {
  @override
  final int typeId = 3;

  @override
  ChoosePizzaPastry read(BinaryReader reader) {
    return ChoosePizzaPastry(
      reader.readString(),
      reader.readBool(),
      reader.readBool(),
      reader.readDouble(),
      reader.readString()
    );

  }

  @override
  void write(BinaryWriter writer, ChoosePizzaPastry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.pastryName)
      ..writeByte(1)
      ..write(obj.defaultPastry)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.pastryPrice)
      ..writeByte(4)
      ..write(obj.pastryIngredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ChoosePizzaPastryAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}

class PizzaSizeAdapter extends TypeAdapter<PizzaSize> {
  @override
  final int typeId = 4;

  @override
  PizzaSize read(BinaryReader reader) {
    return PizzaSize(
      reader.readString(),
      reader.readBool(),
      reader.readBool(),
      reader.readDouble()
    );
  }

  @override
  void write(BinaryWriter writer, PizzaSize obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.pizzaSize)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.defaultSize)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PizzaSizeAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
