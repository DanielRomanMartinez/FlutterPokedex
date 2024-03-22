import 'dart:typed_data';

import 'package:flutter_pokedex/config/endpoints.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/domain/model/value_object/cached_response.dart';
import 'package:flutter_pokedex/domain/model/value_object/response.dart';
import 'package:flutter_pokedex/domain/repositories/captured_pokemon_repository.dart';
import 'package:flutter_pokedex/domain/services/http_service.dart';
import 'package:flutter_pokedex/infrastructure/repositories/http/pokemon_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'http_pokemon_repository_test.mocks.dart';

@GenerateMocks([
  HttpService,
  CapturedPokemonsRepository,
])
void main() {
  group('Tests over Pokemon Repository', () {
    final HttpService httpService = MockHttpService();
    final CapturedPokemonsRepository capturedPokemonsRepository =
        MockCapturedPokemonsRepository();

    final HttpPokemonRepository repository = HttpPokemonRepository(
      httpService,
      capturedPokemonsRepository,
    );

    const String httpPokemonListMockResponseOK = '''
{
	"results": [
		{
			"name": "bulbasaur"
		}
	]
}''';

    const String httpPokemonMockResponseOK = '''{
    "id": 1,
    "name": "bulbasaur",
    "height": 7,
    "weight": 69,
    "types": [
        {
            "type": {
                "name": "grass"
            }
        },
        {
            "type": {
                "name": "poison"
            }
        }
    ],
    "sprites": {
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
    }
}
''';

    test('Connection OK - Pokemons OK', () async {
      when(
        httpService.get(
          Uri.https(
            Endpoints.urlServer,
            Endpoints.pokemons,
            {
              'offset': '0',
              'limit': '10',
            },
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      ).thenAnswer(
        (_) => Future.value(
          CachedResponse(
            Response(
              body: httpPokemonListMockResponseOK,
              statusCode: 200,
              headers: const {'header': 'mock'},
              bodyBytes: Uint8List(1),
            ),
          ),
        ),
      );

      when(
        httpService.get(
          Uri.https(
            Endpoints.urlServer,
            '${Endpoints.pokemon}/bulbasaur',
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      ).thenAnswer(
        (_) => Future.value(
          CachedResponse(
            Response(
              body: httpPokemonMockResponseOK,
              statusCode: 200,
              headers: const {'header': 'mock'},
              bodyBytes: Uint8List(1),
            ),
          ),
        ),
      );

      when(capturedPokemonsRepository.getPokemon(1))
          .thenAnswer((_) => Future.value(null));

      final result = await repository.getPokemons(offset: 0, limit: 10);

      expect(result['content'], isA<List<Pokemon>>());
    });
  });
}
