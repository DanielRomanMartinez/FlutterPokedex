import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/extensions/string_extension.dart';
import 'package:flutter_pokedex/ui/common/theme/shapes.dart';
import 'package:flutter_pokedex/ui/common/widgets/pokemon_type_card/pokemon_type_card.dart';

part 'widgets/pokemon_information.dart';
part 'widgets/pokemon_image.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard(
    this.pokemon, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: pokemon.types.first.pokemonColor.cardBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          PokemonInformation(pokemon),
          const Spacer(),
          PokemonImage(pokemon),
        ],
      ),
    );
  }
}
