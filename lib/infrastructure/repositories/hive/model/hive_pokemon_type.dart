import 'package:flutter_pokedex/domain/model/objects/pokemon_type.dart';
import 'package:hive/hive.dart';

part 'hive_pokemon_type.g.dart';

@HiveType(typeId: 2)
class HivePokemonType extends HiveObject {
  @HiveField(0)
  final String name;

  HivePokemonType({
    required this.name,
  });

  PokemonType toPokemonType() => PokemonType(
        name: name,
      );

  factory HivePokemonType.fromPokemonType(PokemonType pokemonType) => HivePokemonType(
        name: pokemonType.name,
      );
}
