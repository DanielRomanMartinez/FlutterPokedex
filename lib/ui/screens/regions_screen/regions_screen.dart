import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';

class RegionsScreen extends StatelessWidget {
  static const String routeName = 'regions';

  const RegionsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationLayout(
      child: const Center(
        child: Text(
          'Regions',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
