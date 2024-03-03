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
  final String description;

  @HiveField(4)
  final int weight;

  @HiveField(5)
  final bool isCaptured;

  @HiveField(6)
  final String image;

  @HiveField(7)
  List<HivePokemonType> types;

  HivePokemon({
    required this.id,
    required this.name,
    required this.description,
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
      description: description,
      height: height,
      weight: weight,
      isCaptured: true,
      image: image,
      types: typesPokemon,
    );
  }

  factory HivePokemon.fromPokemon(Pokemon pokemon) {

    final typesPokemon = pokemon.types.map((PokemonType type) => HivePokemonType.fromPokemonType(type)).toList();

    return HivePokemon(
      id: pokemon.id,
      name: pokemon.name,
      description: pokemon.description,
      height: pokemon.height,
      weight: pokemon.weight,
      isCaptured: true,
      image: pokemon.image,
      types: typesPokemon,
    );
  }
}
