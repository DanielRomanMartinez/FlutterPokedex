import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';

class CapturedPokemonsScreen extends StatelessWidget {
  static const String routeName = 'captured-pokemons';

  const CapturedPokemonsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationLayout(
      child: const Center(
        child: Text(
          'Captured Pokemons',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
