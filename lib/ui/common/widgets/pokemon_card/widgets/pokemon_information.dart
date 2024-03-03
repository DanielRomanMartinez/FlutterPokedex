part of '../pokemon_card.dart';

class PokemonInformation extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonInformation(
    this.pokemon, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        bottom: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pokemon.id.toString().padLeft(3, '0'),
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ), // Dynamic pokemon ID
          const SizedBox(height: Shapes.gutter),
          Text(
            pokemon.name.capitalize(),
            style: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: Shapes.gutter),
          SizedBox(
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: pokemon.types.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    PokemonTypeCard(pokemon.types[index]),
                    const SizedBox(width: 4),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
