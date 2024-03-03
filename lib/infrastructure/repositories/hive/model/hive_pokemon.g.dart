// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_pokemon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePokemonAdapter extends TypeAdapter<HivePokemon> {
  @override
  final int typeId = 0;

  @override
  HivePokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePokemon(
      id: fields[0] as int,
      name: fields[1] as String,
      height: fields[2] as int,
      weight: fields[3] as int,
      isCaptured: fields[4] as bool,
      image: fields[5] as String,
      types: (fields[7] as List).cast<HivePokemonType>(),
    );
  }

  @override
  void write(BinaryWriter writer, HivePokemon obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.isCaptured)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.types);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
