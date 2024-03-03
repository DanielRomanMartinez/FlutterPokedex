import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';

class PokemonDetailScreen extends StatelessWidget {
  static const String routeName = 'pokemon-detail';

  final int pokemonId;

  const PokemonDetailScreen({
    required this.pokemonId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationLayout(
      canPop: true,
      title: 'Pokemon Name',
      child: const Center(
        child: Text(
          'Pokemon details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
