// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PizzaSize.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PizzaSizeAdapter extends TypeAdapter<PizzaSize> {
  @override
  final int typeId = 4;

  @override
  PizzaSize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PizzaSize(
      fields[0] as String?,
      fields[1] as bool?,
      fields[2] as bool?,
      fields[3] as double?,
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
