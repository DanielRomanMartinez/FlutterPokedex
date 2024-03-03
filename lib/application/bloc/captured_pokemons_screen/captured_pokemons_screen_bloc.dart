import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/domain/repositories/captured_pokemon_repository.dart';
import 'package:injectable/injectable.dart';

part 'captured_pokemons_screen_event.dart';
part 'captured_pokemons_screen_state.dart';

@lazySingleton
class CapturedPokemonsScreenBloc extends Bloc<CapturedPokemonsScreenEvent, CapturedPokemonsScreenState> {
  final CapturedPokemonsRepository _capturedPokemonsRepository;

  CapturedPokemonsScreenBloc(
    this._capturedPokemonsRepository,
  ) : super(const CapturedPokemonsScreenStateInitial()) {
    on<LoadCapturedPokemonsScreen>(_handleLoadScreen);
    on<SearchPokemon>(_handleSearchPokemon);
  }

  Future<void> _handleLoadScreen(
    LoadCapturedPokemonsScreen event,
    Emitter<CapturedPokemonsScreenState> emit,
  ) async {
    emit(const LoadingCapturedPokemonsScreen());

    List<Pokemon> pokemons = await _capturedPokemonsRepository.getPokemons();

    emit(CapturedPokemonsScreenLoaded(
      pokemons: pokemons,
    ));
  }

  Future<void> _handleSearchPokemon(
      SearchPokemon event,
      Emitter<CapturedPokemonsScreenState> emit,
      ) async {
    emit(const LoadingCapturedPokemonsScreen());

    List<Pokemon> pokemons = await _capturedPokemonsRepository.getPokemons(name: event.name);

    emit(CapturedPokemonsScreenLoaded(
      pokemons: pokemons,
    ));
  }
}
