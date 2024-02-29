import 'package:flutter/material.dart';
import 'package:flutter_pokedex/application/bloc/custom_bottom_navigation/custom_bottom_navigation_bloc.dart';
import 'package:flutter_pokedex/ui/screens/captured_pokemons_screen/captured_pokemons_screen.dart';
import 'package:flutter_pokedex/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_pokedex/ui/screens/regions_screen/regions_screen.dart';
import 'package:flutter_pokedex/ui/screens/user_settings_screen/user_settings_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final PageScreen pageScreen;

  const CustomBottomNavigationBar({
    super.key,
    this.pageScreen = PageScreen.home,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final CustomBottomNavigationBloc _customBottomNavigationBloc =
      GetIt.instance.get<CustomBottomNavigationBloc>();

  final List<Map<String, dynamic>> _pages = [
    {
      "enum": PageScreen.home,
      "route": HomeScreen.routeName,
    },
    {
      "enum": PageScreen.regions,
      "route": RegionsScreen.routeName,
    },
    {
      "enum": PageScreen.favorites,
      "route": CapturedPokemonsScreen.routeName,
    },
    {
      "enum": PageScreen.user,
      "route": UserSettingsScreen.routeName,
    },
  ];

  void _onItemTapped(int index) {
    _customBottomNavigationBloc.add(LoadPageScreen(
      pageScreen: _pages[index]["enum"],
    ));

    context.go("/${_pages[index]["route"]}");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      currentIndex: widget.pageScreen.value,
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: const Color(0xFFF5897F),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Pokedex',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Regiones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Capturados',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts),
          label: 'Settings',
        ),
      ],
    );
  }
}
