// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChoosePizzaPastry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChoosePizzaPastryAdapter extends TypeAdapter<ChoosePizzaPastry> {
  @override
  final int typeId = 3;

  @override
  ChoosePizzaPastry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChoosePizzaPastry(
      fields[0] as String?,
      fields[1] as bool?,
      fields[2] as bool?,
      fields[3] as double?,
      fields[4] as String?,
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
