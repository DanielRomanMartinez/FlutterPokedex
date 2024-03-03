import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/domain/repositories/pokemon_repository.dart';
import 'package:injectable/injectable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

@lazySingleton
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final PokemonRepository _pokemonRepository;

  HomeScreenBloc(
    this._pokemonRepository,
  ) : super(const HomeScreenStateInitial()) {
    on<LoadHomeScreen>(_handleLoadScreen);
  }

  Future<void> _handleLoadScreen(
    LoadHomeScreen event,
    Emitter<HomeScreenState> emit,
  ) async {
    emit(const LoadingHomeScreen());

    final information = await _pokemonRepository.getPokemons();

    emit(HomeScreenLoaded(
      information: information,
    ));
  }
}
