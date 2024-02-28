import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  static const String routeName = 'pokemon-detail';

  final int pokemonId;

  const PokemonDetailScreen({
    required this.pokemonId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text('Pokemon detail'),
    );
  }
}
