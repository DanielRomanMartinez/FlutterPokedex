import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon_type.dart';
import 'package:flutter_pokedex/ui/common/theme/colors_map.dart';

class User extends Equatable {
  static const Color defaultBackgroundColor = ColorsMap.bostonUniversityRed;
  static const Color defaultForegroundColor = Colors.white;

  final int numPokemonsCaptured;
  final Color backgroundColor;
  final Color foregroundColor;
  final PokemonType? mostPokemonTypeCaptured;

  const User({
    this.numPokemonsCaptured = 0,
    this.backgroundColor = defaultBackgroundColor,
    this.foregroundColor = defaultForegroundColor,
    this.mostPokemonTypeCaptured,
  });

  @override
  List<Object?> get props => [
        numPokemonsCaptured,
        backgroundColor,
        foregroundColor,
        mostPokemonTypeCaptured,
      ];
}
