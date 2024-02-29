import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';

class UserSettingsScreen extends StatelessWidget {
  static const String routeName = 'user-settings';

  const UserSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationLayout(
      child: const Center(
        child: Text(
          'User Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
