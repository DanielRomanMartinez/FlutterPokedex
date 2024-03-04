import 'dart:convert';
import 'dart:io';

import 'package:flutter_pokedex/config/endpoints.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon_type.dart';
import 'package:flutter_pokedex/domain/model/value_object/response.dart';
import 'package:flutter_pokedex/domain/repositories/captured_pokemon_repository.dart';
import 'package:flutter_pokedex/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/domain/services/http_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PokemonRepository)
class HttpPokemonRepository implements PokemonRepository {

  static const int maxOffset = 151;
  int currentOffset = 0;
  int currentLimit = 20;

  final HttpService _httpService;
  final CapturedPokemonsRepository _capturedPokemonsRepository;

  HttpPokemonRepository(
    this._httpService,
    this._capturedPokemonsRepository,
  );

  @override
  Future<Pokemon?> getPokemon({
    required String name,
  }) async {
    final Response httpPokemonResponse = await _httpService.get(
      Uri.https(
        Endpoints.urlServer,
        '${Endpoints.pokemon}/$name',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (httpPokemonResponse.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> pokemonResponse = jsonDecode(httpPokemonResponse.body);

      final List<PokemonType> pokemonTypes = [];
      for (final pokemonType in pokemonResponse['types']) {
        pokemonTypes.add(PokemonType(name: pokemonType['type']['name']));
      }

      final Pokemon? pokemon = await _capturedPokemonsRepository.getPokemon(pokemonResponse['id']);

      return Pokemon(
        id: pokemonResponse['id'],
        name: pokemonResponse['name'],
        description: pokemonResponse['name'], // TODO: Requires make request to another endpoint
        height: pokemonResponse['height'],
        weight: pokemonResponse['weight'],
        image: pokemonResponse['sprites']['front_default'],
        types: pokemonTypes,
        isCaptured: pokemon != null,
      );
    }

    return null;
  }

  @override
  Future<Map<String, dynamic>> getPokemons({
    required int offset,
    required int limit,
  }) async {
    final Response httpResponse = await _httpService.get(
      Uri.https(
        Endpoints.urlServer,
        Endpoints.pokemons,
        {
          'offset': offset.toString(),
          'limit': limit.toString(),
        },
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    final List<Pokemon> pokemons = [];

    if (httpResponse.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> response = jsonDecode(httpResponse.body);

      for (final pokemon in response['results']) {
        final pokemonResult = await getPokemon(name: pokemon['name']);

        if (pokemonResult != null) {
          pokemons.add(pokemonResult);
        }
      }
    }

    return {
      'offset': 0, // TODO: Make pagination
      'limit': 151, // TODO: Make pagination
      'content': pokemons,
    };
  }
}
