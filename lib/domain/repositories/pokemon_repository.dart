import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';

abstract class PokemonRepository {
  Future<Map<String, dynamic>> getPokemons({
    String text = '',
    int page = 0,
  });

  Future<Pokemon?> getPokemon({
    required String name,
  });
}
