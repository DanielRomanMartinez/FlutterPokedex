import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_pokedex/application/bloc/home_screen/home_screen_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon_type.dart';
import 'package:flutter_pokedex/domain/repositories/pokemon_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_screen_bloc_test.mocks.dart';

@GenerateMocks([
  PokemonRepository,
])
void main() {
  final PokemonRepository pokemonRepository = MockPokemonRepository();

  group('Home Screen Bloc', () {
    const Pokemon pokemon = Pokemon(
      id: 1,
      name: 'Bulbasaur',
      description: 'Description',
      height: 10,
      weight: 10,
      isCaptured: false,
      image: '',
      types: [
        PokemonType(name: 'grass'),
      ],
    );

    final List<Pokemon> pokemons = [
      pokemon,
    ];

    when(pokemonRepository.getPokemons(
      offset: 0,
      limit: 10,
    )).thenAnswer(
      (_) => Future.value({
        'offset': 0,
        'limit': 10,
        'content': pokemons,
      }),
    );

    blocTest(
      'Creating Bloc',
      build: () => HomeScreenBloc(
        pokemonRepository,
      ),
      expect: () => [],
      verify: (_) {
        verifyNever(pokemonRepository.getPokemons(
          offset: 0,
          limit: 10,
        ));
      },
    );

    blocTest(
      'Send Load Event',
      build: () => HomeScreenBloc(
        pokemonRepository,
      )..add(const LoadHomeScreen()),
      expect: () => [
        const LoadingHomeScreen(),
        HomeScreenLoaded(information: {
          'offset': 0,
          'limit': 10,
          'content': pokemons,
        }),
      ],
      verify: (_) {
        verify(pokemonRepository.getPokemons(
          offset: 0,
          limit: 10,
        )).called(1);
      },
    );
  });
}
