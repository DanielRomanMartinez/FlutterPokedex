import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/domain/model/objects/ability.dart';
import 'package:flutter_pokedex/domain/model/objects/forms.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon_type.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int height;
  final int weight;
  final bool isCaptured;
  final String image;
  final List<Ability> abilities;
  final List<PokemonType> types;
  final List<Forms> forms;

  const Pokemon({
    this.id = 0,
    this.name = 'Name',
    this.height = 0,
    this.weight = 0,
    this.isCaptured = false,
    this.image = '',
    this.abilities = const [],
    this.types = const [],
    this.forms = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        height,
        weight,
        isCaptured,
        image,
        abilities,
        types,
        forms,
      ];
}
