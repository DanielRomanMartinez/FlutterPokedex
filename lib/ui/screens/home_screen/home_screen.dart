import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
   const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationLayout(
      child: const Placeholder(
        child: Text('Home',),
      )
    );
  }
}
