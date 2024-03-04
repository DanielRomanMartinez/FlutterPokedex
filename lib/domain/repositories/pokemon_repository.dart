import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon?> getPokemon({
    required String name,
  });

  Future<Map<String, dynamic>> getPokemons({
    required int offset,
    required int limit,
  });
}
