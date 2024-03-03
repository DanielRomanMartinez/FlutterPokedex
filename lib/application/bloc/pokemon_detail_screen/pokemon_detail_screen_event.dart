part of 'pokemon_detail_screen_bloc.dart';

abstract class PokemonDetailScreenEvent extends Equatable {
  const PokemonDetailScreenEvent();

  @override
  List<Object?> get props => [];
}

class LoadPokemonDetailScreen extends PokemonDetailScreenEvent {
  final String name;

  const LoadPokemonDetailScreen({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}

class CapturePokemonActions extends PokemonDetailScreenEvent {
  final Pokemon pokemon;

  const CapturePokemonActions({
    required this.pokemon,
  });

  @override
  List<Object?> get props => [
        pokemon,
      ];
}

class CapturePokemon extends CapturePokemonActions {
  const CapturePokemon({
    required super.pokemon,
  });
}

class UnleashPokemon extends CapturePokemonActions {
  const UnleashPokemon({
    required super.pokemon,
  });
}
