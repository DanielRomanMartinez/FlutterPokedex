part of 'captured_pokemons_screen_bloc.dart';

abstract class CapturedPokemonsScreenEvent extends Equatable {
  const CapturedPokemonsScreenEvent();

  @override
  List<Object?> get props => [];
}

class LoadCapturedPokemonsScreen extends CapturedPokemonsScreenEvent {
  const LoadCapturedPokemonsScreen();
}

class SearchPokemon extends CapturedPokemonsScreenEvent {
  final String name;

  const SearchPokemon({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
