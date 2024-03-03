part of 'captured_pokemons_screen_bloc.dart';

abstract class CapturedPokemonsScreenEvent extends Equatable {
  const CapturedPokemonsScreenEvent();

  @override
  List<Object?> get props => [];
}

class LoadCapturedPokemonsScreen extends CapturedPokemonsScreenEvent {
  const LoadCapturedPokemonsScreen();
}