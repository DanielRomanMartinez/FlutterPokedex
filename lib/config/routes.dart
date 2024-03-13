import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/common/transactions/no_animation_page_transation.dart';
import 'package:flutter_pokedex/ui/screens/captured_pokemons_screen/captured_pokemons_screen.dart';
import 'package:flutter_pokedex/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_pokedex/ui/screens/intro_screen/intro_screen.dart';
import 'package:flutter_pokedex/ui/screens/not_found_screen/not_found_screen.dart';
import 'package:flutter_pokedex/ui/screens/pokemon_detail_screen/pokemon_detail_screen.dart';
import 'package:flutter_pokedex/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter_pokedex/ui/screens/user_information_screen/user_information_screen.dart';
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
          path: IntroScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => const IntroScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const IntroScreen(),
          ),
        ),
        GoRoute(
          path: HomeScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => HomeScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: UserInformationScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => UserInformationScreen(),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: UserInformationScreen(),
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
          path: '${PokemonDetailScreen.routeName}/:name',
          builder: (BuildContext context, GoRouterState state) =>
              PokemonDetailScreen(name: state.pathParameters['name']!),
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: PokemonDetailScreen(name: state.pathParameters['name']!),
          ),
        ),
      ],
    ),
  ],
);

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
