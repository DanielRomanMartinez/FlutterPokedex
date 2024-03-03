import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';

abstract class CapturedPokemonsRepository {
  Future<List<Pokemon>> getPokemons({
    String? name,
  });

  Future<void> markAsCaptured(Pokemon pokemon);

  Future<void> removePokemon(int id);
}
