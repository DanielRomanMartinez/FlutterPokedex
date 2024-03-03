import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/ui/common/theme/colors_map.dart';

class PokemonType extends Equatable {
  final String name;

  const PokemonType({
    this.name = 'Name',
  });

  PokemonColor get pokemonColor {
    switch (name.toLowerCase()) {
      case 'water':
        return PokemonColor.water;
      case 'dragon':
        return PokemonColor.dragon;
      case 'electric':
        return PokemonColor.electric;
      case 'fairy':
        return PokemonColor.fairy;
      case 'ghost':
        return PokemonColor.ghost;
      case 'fire':
        return PokemonColor.fire;
      case 'ice':
        return PokemonColor.ice;
      case 'grass':
        return PokemonColor.grass;
      case 'bug':
        return PokemonColor.bug;
      case 'fighting':
        return PokemonColor.fighting;
      case 'normal':
        return PokemonColor.normal;
      case 'shadow':
        return PokemonColor.shadow;
      case 'steel':
        return PokemonColor.steel;
      case 'rock':
        return PokemonColor.rock;
      case 'psychic':
        return PokemonColor.psychic;
      case 'ground':
        return PokemonColor.ground;
      case 'poison':
        return PokemonColor.poison;
      case 'stellar':
        return PokemonColor.stellar;
      case 'flying':
        return PokemonColor.flying;
      default:
        return PokemonColor.defaultColors;
    }
  }

  @override
  List<Object?> get props => [
        name,
        pokemonColor,
      ];
}
