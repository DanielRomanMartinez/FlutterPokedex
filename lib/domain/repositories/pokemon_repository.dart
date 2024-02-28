import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';

abstract class PokemonCate {
  Future<Map<String, dynamic>> getPokemons({
    required String text,
    int page = 0,
  });

  Future<Pokemon> getPokemon({
    required int pokemonId,
  });

  Future<void> removeCategory({
    required int categoryId,
  });

  Future<void> markAsCaptured({
    required int pokemonId,
  });
}
