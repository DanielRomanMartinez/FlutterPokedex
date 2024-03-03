import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon_type.dart';
import 'package:flutter_pokedex/infrastructure/repositories/hive/model/hive_pokemon_type.dart';
import 'package:hive/hive.dart';

part 'hive_pokemon.g.dart';

@HiveType(typeId: 0)
class HivePokemon extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int height;

  @HiveField(3)
  final int weight;

  @HiveField(4)
  final bool isCaptured;

  @HiveField(5)
  final String image;

  @HiveField(7)
  List<HivePokemonType> types;

  HivePokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.isCaptured,
    required this.image,
    required this.types,
  });

  Pokemon toPokemon() {
    final typesPokemon = types.map((HivePokemonType hiveType) => hiveType.toPokemonType()).toList();

    return Pokemon(
      id: id,
      name: name,
      height: height,
      weight: weight,
      isCaptured: isCaptured,
      image: image,
      types: typesPokemon,
    );
  }

  factory HivePokemon.fromPokemon(Pokemon pokemon) {

    final typesPokemon = pokemon.types.map((PokemonType type) => HivePokemonType.fromPokemonType(type)).toList();

    return HivePokemon(
      id: pokemon.id,
      name: pokemon.name,
      height: pokemon.height,
      weight: pokemon.weight,
      isCaptured: pokemon.isCaptured,
      image: pokemon.image,
      types: typesPokemon,
    );
  }
}
