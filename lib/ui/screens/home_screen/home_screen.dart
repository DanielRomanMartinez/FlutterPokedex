import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/custom_bottom_navigation/custom_bottom_navigation_bloc.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';
import 'package:flutter_pokedex/ui/common/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  final CustomBottomNavigationBloc _customBottomNavigationBloc = GetIt.instance.get<CustomBottomNavigationBloc>();

   HomeScreen({
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
