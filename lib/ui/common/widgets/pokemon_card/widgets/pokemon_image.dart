part of '../pokemon_card.dart';

class _Constants {
  static double pokemonContainerWidth = 140;
}

class PokemonImage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonImage(
    this.pokemon, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _Constants.pokemonContainerWidth,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: pokemon.types.first.pokemonColor.background,
      ),
      child: Stack(
        children: [
          Center(
            child:
                Image.asset('assets/images/pokemon_type_logos/big_white/${pokemon.types.first.name.toLowerCase()}.png'),
          ),
          Center(
            child: Image.network(pokemon.image),
          ),
        ],
      ),
    );
  }
}
