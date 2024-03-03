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
