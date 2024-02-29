import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/custom_bottom_navigation/custom_bottom_navigation_bloc.dart';
import 'package:flutter_pokedex/ui/common/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:get_it/get_it.dart';

class ApplicationLayout extends StatelessWidget {
  static const String routeName = 'home';

  final CustomBottomNavigationBloc _customBottomNavigationBloc = GetIt.instance.get<CustomBottomNavigationBloc>();
  final Widget child;

  ApplicationLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFFF5897F),
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BlocBuilder<CustomBottomNavigationBloc, CustomBottomNavigationState>(
          bloc: _customBottomNavigationBloc,
          builder: (context, state) {
            if (state is PageScreenLoaded) {
              return CustomBottomNavigationBar(pageScreen: state.pageScreen);
            }
            return const CustomBottomNavigationBar();
          },
        ),
      ),
      body: child,
    );
  }
}
