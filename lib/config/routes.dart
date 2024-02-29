import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/common/transactions/no_animation_page_transation.dart';
import 'package:flutter_pokedex/ui/screens/captured_pokemons_screen/captured_pokemons_screen.dart';
import 'package:flutter_pokedex/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_pokedex/ui/screens/not_found_screen/not_found_screen.dart';
import 'package:flutter_pokedex/ui/screens/pokemon_detail_screen/pokemon_detail_screen.dart';
import 'package:flutter_pokedex/ui/screens/pokemons_screen/pokemons_screen.dart';
import 'package:flutter_pokedex/ui/screens/regions_screen/regions_screen.dart';
import 'package:flutter_pokedex/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter_pokedex/ui/screens/user_settings_screen/user_settings_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const NotFoundScreen(),
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: SplashScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => const SplashScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const SplashScreen(),
          ),
        ),
        GoRoute(
          path: HomeScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: RegionsScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => const RegionsScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const RegionsScreen(),
          ),
        ),
        GoRoute(
          path: UserSettingsScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => const UserSettingsScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const UserSettingsScreen(),
          ),
        ),
        GoRoute(
          path: PokemonsScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => const PokemonsScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const PokemonsScreen(),
          ),
        ),
        GoRoute(
          path: CapturedPokemonsScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => const CapturedPokemonsScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const CapturedPokemonsScreen(),
          ),
        ),
        GoRoute(
          path: '${PokemonDetailScreen.routeName}/:pokemonId',
          builder: (BuildContext context, GoRouterState state) =>
              PokemonDetailScreen(pokemonId: int.parse(state.pathParameters['pokemonId']!)),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: PokemonDetailScreen(pokemonId: int.parse(state.pathParameters['pokemonId']!)),
          ),
        ),
      ],
    ),
  ],
);

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
