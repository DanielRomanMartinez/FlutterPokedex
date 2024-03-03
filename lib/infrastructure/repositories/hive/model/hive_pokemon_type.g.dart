// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_pokemon_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePokemonTypeAdapter extends TypeAdapter<HivePokemonType> {
  @override
  final int typeId = 2;

  @override
  HivePokemonType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePokemonType(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HivePokemonType obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePokemonTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
