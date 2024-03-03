import 'package:flutter/material.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon_type.dart';
import 'package:flutter_pokedex/extensions/string_extension.dart';

class PokemonTypeCard extends StatelessWidget {
  final PokemonType pokemonType;

  const PokemonTypeCard(
    this.pokemonType, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: pokemonType.pokemonColor.background,
      ),
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 6,
        right: 8,
      ),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Image.asset('assets/images/pokemon_type_logos/small_coloured/${pokemonType.name.toLowerCase()}.png'),
          ),
          const SizedBox(width: 6),
          Text(
            pokemonType.name.capitalize(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: pokemonType.pokemonColor.foreground,
            ),
          ),
        ],
      ),
    );
  }
}
