import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/domain/exceptions/api_connection_error.dart';
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
    try {
      emit(const LoadingHomeScreen());

      final information = await _pokemonRepository.getPokemons(
        offset: 0,
        limit: 10,
      );

      emit(HomeScreenLoaded(
        information: information,
      ));
    } on ApiConnectionError {
      emit(const HomeScreenError());
    } on Exception catch(e){
      debugPrint('Error: ${e.toString()}');
      emit(const HomeScreenError());
    }
  }
}
