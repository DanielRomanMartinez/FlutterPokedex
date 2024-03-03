import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/domain/repositories/pokemon_repository.dart';
import 'package:injectable/injectable.dart';

part 'pokemon_detail_screen_event.dart';
part 'pokemon_detail_screen_state.dart';

@lazySingleton
class PokemonDetailScreenBloc extends Bloc<PokemonDetailScreenEvent, PokemonDetailScreenState> {
  final PokemonRepository _pokemonRepository;

  PokemonDetailScreenBloc(
    this._pokemonRepository,
  ) : super(const PokemonDetailScreenStateInitial()) {
    on<LoadPokemonDetailScreen>(_handleLoadScreen);
  }

  Future<void> _handleLoadScreen(
    LoadPokemonDetailScreen event,
    Emitter<PokemonDetailScreenState> emit,
  ) async {
    emit(const LoadingPokemonDetailScreen());

    final Pokemon? pokemon = await _pokemonRepository.getPokemon(name: event.name);

    if (pokemon != null) {
      emit(PokemonDetailScreenLoaded(
        pokemon: pokemon,
      ));
    }
  }
}
