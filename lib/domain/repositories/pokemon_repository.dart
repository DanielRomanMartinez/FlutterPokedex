import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon?> getPokemon({
    required String name,
  });

  Future<Map<String, dynamic>> getPokemons({
    String offset = '0',
    String limit = '151',
  });
}
