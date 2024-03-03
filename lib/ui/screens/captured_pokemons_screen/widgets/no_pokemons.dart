part of '../captured_pokemons_screen.dart';

class NoPokemons extends StatelessWidget {
  const NoPokemons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/magikarp.png'),
        const SizedBox(height: Shapes.gutter3x),
        const Text(
          'You didn\'t capture any Pokémon :(',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Shapes.gutter2x),
        const Text(
          'Click on the pokeball icon in pokemon details and they will appear here.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF4D4D4D),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
