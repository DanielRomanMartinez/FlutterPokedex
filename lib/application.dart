import 'package:flutter/material.dart';
import 'package:flutter_pokedex/config/routes.dart';
import 'package:flutter_pokedex/ui/common/theme/theme.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.lightTheme,
    );
  }
}
