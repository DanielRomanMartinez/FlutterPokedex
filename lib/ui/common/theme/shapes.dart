import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/common/theme/colors_map.dart';

class Shapes {
  // General shapes.
  static const double gutter = 12.0;
  static const double gutter2x = 24.0;
  static const double gutter3x = 36.0;
  static const double borderWidth = 1.0;
  static const double borderRadius = 2.0;
  static const double appBarHeight = 72;
  static const double elevation = 0.0;

  // Appbar.
  static const double appBarElevation = 0.5;

  // Buttons.
  static const double buttonBorderWidth = borderWidth;
  static const BorderRadius buttonBorderRadius = BorderRadius.all(
    Radius.circular(borderRadius),
  );
  static const EdgeInsets buttonPadding = EdgeInsets.all(gutter);

  // Cards.
  static const double cardBorderWidth = borderWidth;
  static const BorderRadius cardBorderRadius = BorderRadius.all(
    Radius.circular(borderRadius),
  );
  static const double cardElevation = elevation;
  static const EdgeInsets cardMargin = EdgeInsets.symmetric(
    horizontal: gutter,
    vertical: gutter / 2.0,
  );

  // Shadows.
  static const BoxShadow containerShadow = BoxShadow(
    color: ColorsMap.neutral200,
    blurRadius: 0.5,
    spreadRadius: 0.0,
    offset: Offset(
      0.0,
      0.5,
    ),
  );

  // Cropper.
  static const double cropperMargin = 12;

  // Sizes.
  static const double iconSize = 16;
}
