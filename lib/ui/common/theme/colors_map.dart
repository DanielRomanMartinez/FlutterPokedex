import 'package:flutter/material.dart';

class ColorsMap {
  static const Color primaryColor = Color(0xff222C56);
  static const Color secondaryColor = Color(0xff354585);
  static const Color textSecondaryColor = Color(0xff354585);

  // Pokemon type colors

  static const Color neutralWhite = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF9F9F9);
  static const Color neutral100 = Color(0xFFEEEEEE);
  static const Color neutral200 = Color(0xFFD2D2D2);
  static const Color neutral250 = Color(0xFFD9D9D9);
  static const Color neutral300 = Color(0xFFAFAFAF);
  static const Color neutral400 = Color(0xFF7D7D7D);
  static const Color neutral500 = Color(0xFF565656);

  // Header Pokemon Colors
  static const Color red = Color(0xFFFF0000);
  static const Color bostonUniversityRed = Color(0xFFCC0000);
  static const Color blue = Color(0xFF3B4CCA);
  static const Color yellow = Color(0xFFFFDE00);
  static const Color yellow2 = Color(0xFFB3A125);
}

enum PokemonColor {
  defaultColors(
    background: ColorsMap.bostonUniversityRed,
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFFA7179),
  ),
  water(
    background: Color(0xFF5090D6),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFEBF1F8),
  ),
  dragon(
    background: Color(0xFF0B6DC3),
    foreground: Color(0xFFFFFFFF),
    cardBackground: Color(0xFFE4EEF6),
  ),
  electric(
    background: Color(0xFFF4D23C),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFFBF8E9),
  ),
  fairy(
    background: Color(0xFFEC8FE6),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFFBF1FA),
  ),
  ghost(
    background: Color(0xFF5269AD),
    foreground: Color(0xFFFFFFFF),
    cardBackground: Color(0xFFEBEDF4),
  ),
  fire(
    background: Color(0xFFFF9D55),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFFCF3EB),
  ),
  ice(
    background: Color(0xFF73CEC0),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFF1FBF9),
  ),
  grass(
    background: Color(0xFF63BC5A),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFEDF6EC),
  ),
  bug(
    background: Color(0xFF91C12F),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFF1F6E8),
  ),
  fighting(
    background: Color(0xFFCE416B),
    foreground: Color(0xFFFFFFFF),
    cardBackground: Color(0xFFF8E9EE),
  ),
  normal(
    background: Color(0xFF919AA2),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFF1F2F3),
  ),
  shadow(
    background: Color(0xFF5A5465),
    foreground: Color(0xFFFFFFFF),
    cardBackground: Color(0xFFECEBED),
  ),
  steel(
    background: Color(0xFF5A8EA2),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFECF1F3),
  ),
  rock(
    background: Color(0xFFC5B78C),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFF7F5F1),
  ),
  psychic(
    background: Color(0xFFFA7179),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFFCEEEF),
  ),
  ground(
    background: Color(0xFFD97845),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFF9EFEA),
  ),
  poison(
    background: Color(0xFFB567CE),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFF5EDF8),
  ),
  stellar(
    background: Color(0xFF35ACE7),
    foreground: Color(0xFFFFFFFF),
    cardBackground: Color(0xFFEAF7FC),
  ),
  flying(
    background: Color(0xFF89AAE3),
    foreground: Color(0xFF000000),
    cardBackground: Color(0xFFF1F4FA),
  );

  const PokemonColor({
    required this.foreground,
    required this.background,
    required this.cardBackground,
  });

  final Color foreground;
  final Color background;
  final Color cardBackground;
}
