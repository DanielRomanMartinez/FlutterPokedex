import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationLayout(
      canPop: false,
      title: 'Page Not Found',
      child: const Center(
        child: Text(
          'Not Found',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
