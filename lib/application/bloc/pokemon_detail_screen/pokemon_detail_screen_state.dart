part of 'pokemon_detail_screen_bloc.dart';

@immutable
abstract class PokemonDetailScreenState extends Equatable {
  const PokemonDetailScreenState();
}

class PokemonDetailScreenStateInitial extends PokemonDetailScreenState {
  const PokemonDetailScreenStateInitial();

  @override
  List<Object> get props => [];
}

class LoadingPokemonDetailScreen extends PokemonDetailScreenStateInitial {
  const LoadingPokemonDetailScreen();

  @override
  List<Object> get props => [];
}

class PokemonDetailScreenLoaded extends PokemonDetailScreenStateInitial {
  final Pokemon pokemon;

  const PokemonDetailScreenLoaded({
    required this.pokemon,
  });

  @override
  List<Object> get props => [
        pokemon,
      ];
}
