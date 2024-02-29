import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';

class PokemonsScreen extends StatelessWidget {
  static const String routeName = 'pokemons';

  const PokemonsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationLayout(
      child: const Center(
        child: Text(
          'Pokemons',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
