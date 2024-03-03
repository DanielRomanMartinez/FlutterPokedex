import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/captured_pokemons_screen/captured_pokemons_screen_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/domain/repositories/captured_pokemon_repository.dart';
import 'package:flutter_pokedex/domain/repositories/pokemon_repository.dart';
import 'package:injectable/injectable.dart';

part 'pokemon_detail_screen_event.dart';
part 'pokemon_detail_screen_state.dart';

@lazySingleton
class PokemonDetailScreenBloc extends Bloc<PokemonDetailScreenEvent, PokemonDetailScreenState> {
  final PokemonRepository _pokemonRepository;
  final CapturedPokemonsRepository _capturedPokemonsRepository;
  final CapturedPokemonsScreenBloc _capturedPokemonsScreenBloc;

  PokemonDetailScreenBloc(
    this._pokemonRepository,
    this._capturedPokemonsRepository,
    this._capturedPokemonsScreenBloc,
  ) : super(const PokemonDetailScreenStateInitial()) {
    on<LoadPokemonDetailScreen>(_handleLoadScreen);
    on<CapturePokemon>(_handleCapturePokemon);
    on<UnleashPokemon>(_handleUnleashPokemon);
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

  Future<void> _handleCapturePokemon(
    CapturePokemon event,
    Emitter<PokemonDetailScreenState> emit,
  ) async {
    emit(const LoadingPokemonDetailScreen());

    _capturedPokemonsRepository.markAsCaptured(event.pokemon);

    final Pokemon? pokemon = await _pokemonRepository.getPokemon(name: event.pokemon.name);

    if (pokemon != null) {
      _capturedPokemonsScreenBloc.add(const LoadCapturedPokemonsScreen());
      emit(PokemonDetailScreenLoaded(
        pokemon: pokemon,
      ));
    }
  }

  Future<void> _handleUnleashPokemon(
    UnleashPokemon event,
    Emitter<PokemonDetailScreenState> emit,
  ) async {
    emit(const LoadingPokemonDetailScreen());

    _capturedPokemonsRepository.removePokemon(event.pokemon.id);

    final Pokemon? pokemon = await _pokemonRepository.getPokemon(name: event.pokemon.name);

    if (pokemon != null) {
      _capturedPokemonsScreenBloc.add(const LoadCapturedPokemonsScreen());
      emit(PokemonDetailScreenLoaded(
        pokemon: pokemon,
      ));
    }
  }
}
