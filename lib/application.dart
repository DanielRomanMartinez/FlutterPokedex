import 'package:flutter/material.dart';
import 'package:flutter_pokedex/config/routes.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: Colors.white,
          secondary: Colors.white,
          background: const Color.fromRGBO(18, 18, 18, 1),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(18, 18, 18, 1),
          elevation: 0,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color(0xffB4D5FE),
        ),
      ),
    );
  }
}
