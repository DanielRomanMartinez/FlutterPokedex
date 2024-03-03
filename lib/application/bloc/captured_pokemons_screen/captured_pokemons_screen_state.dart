part of 'captured_pokemons_screen_bloc.dart';

@immutable
abstract class CapturedPokemonsScreenState extends Equatable {
  const CapturedPokemonsScreenState();
}

class CapturedPokemonsScreenStateInitial extends CapturedPokemonsScreenState {
  const CapturedPokemonsScreenStateInitial();

  @override
  List<Object> get props => [];
}

class LoadingCapturedPokemonsScreen extends CapturedPokemonsScreenStateInitial {
  const LoadingCapturedPokemonsScreen();

  @override
  List<Object> get props => [];
}

class CapturedPokemonsScreenLoaded extends CapturedPokemonsScreenStateInitial {
  final List<Pokemon> pokemons;

  const CapturedPokemonsScreenLoaded({
    required this.pokemons,
  });

  @override
  List<Object> get props => [
        pokemons,
      ];
}
