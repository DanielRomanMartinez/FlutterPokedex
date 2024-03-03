import 'package:flutter/material.dart';
import 'package:flutter_pokedex/application/bloc/custom_bottom_navigation/custom_bottom_navigation_bloc.dart';
import 'package:flutter_pokedex/ui/screens/captured_pokemons_screen/captured_pokemons_screen.dart';
import 'package:flutter_pokedex/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_pokedex/ui/screens/user_information_screen/user_information_screen.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Color color;
  final PageScreen pageScreen;
  final CustomBottomNavigationBloc bloc;

  static const List<Map<String, dynamic>> _pages = [
    {
      "enum": PageScreen.home,
      "route": HomeScreen.routeName,
    },
    {
      "enum": PageScreen.capturedPokemons,
      "route": CapturedPokemonsScreen.routeName,
    },
    {
      "enum": PageScreen.user,
      "route": UserInformationScreen.routeName,
    },
  ];

  const CustomBottomNavigationBar({
    super.key,
    required this.color,
    required this.bloc,
    this.pageScreen = PageScreen.home,
  });

  void _onItemTapped(BuildContext context, int index) {
    bloc.add(LoadPageScreen(
      pageScreen: _pages[index]["enum"],
    ));

    context.go("/${_pages[index]["route"]}");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: color,
      onTap: (index) => _onItemTapped(context, index),
      currentIndex: pageScreen.value,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/pokemons_inactive.png'),
          activeIcon: Image.asset('assets/images/pokemons_active.png'),
          label: 'Pokedex',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/captured_pokemons_inactive.png'),
          activeIcon: Image.asset('assets/images/captured_pokemons_active.png'),
          label: 'Captured',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/user_inactive.png'),
          activeIcon: Image.asset('assets/images/user_active.png'),
          label: 'Information',
        ),
      ],
    );
  }
}
