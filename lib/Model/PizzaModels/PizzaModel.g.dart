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
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    var choosePizzaModel = jsonDecode(jsonEncode(fields[8])) as List<dynamic>;

    var pizzaSizeModel = jsonDecode(jsonEncode(fields[9])) as List<dynamic>;

    return PizzaModel(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as double?,
      fields[4] as String?,
      fields[5] as bool?,
      fields[6] as bool?,
      fields[7] as double?,
      choosePizzaModel.cast<ChoosePizzaPastry>(),
      pizzaSizeModel.cast<PizzaSize>(),
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
      ..write(obj.choosePizzaPastry)
      ..writeByte(9)
      ..write(obj.pizzaSize);
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
