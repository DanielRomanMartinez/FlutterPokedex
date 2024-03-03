import 'package:flutter/material.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon_type.dart';
import 'package:flutter_pokedex/domain/model/objects/user.dart';
import 'package:flutter_pokedex/domain/repositories/captured_pokemon_repository.dart';
import 'package:flutter_pokedex/domain/services/user_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserService)
class InfrastructureUserService implements UserService {
  final CapturedPokemonsRepository _capturedPokemonsRepository;

  InfrastructureUserService(this._capturedPokemonsRepository);

  @override
  Future<User> getUserInformation() async {
    List<Pokemon> pokemons = await _capturedPokemonsRepository.getPokemons();
    Color backgroundColor = User.defaultBackgroundColor;
    Color foregroundColor = User.defaultForegroundColor;
    PokemonType? mostPokemonTypeCaptured;

    Map<String, int> capturedTypes = {};

    // To calculate the most type captured, we will use the primary and not both.
    if (pokemons.isNotEmpty) {
      for (final pokemon in pokemons) {
        final String pokemonType = pokemon.types.first.name;

        if (capturedTypes.containsKey(pokemonType)) {
          capturedTypes[pokemonType] = capturedTypes[pokemonType]! + 1;
        } else {
          capturedTypes.addAll(
            {pokemonType: 1},
          );
        }
      }

      final sorted = capturedTypes.entries.toList()..sort((a, b) => a.value.compareTo(b.value));

      final mostPokemonTypeCaptured = PokemonType(name: sorted.first.key);
      backgroundColor = mostPokemonTypeCaptured.pokemonColor.background;
      foregroundColor = mostPokemonTypeCaptured.pokemonColor.foreground;
    }

    return User(
      numPokemonsCaptured: pokemons.length,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      mostPokemonTypeCaptured: mostPokemonTypeCaptured,
    );
  }
}
