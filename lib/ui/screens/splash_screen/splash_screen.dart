import 'package:flutter/material.dart';
import 'package:flutter_pokedex/application/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenBloc _splashScreenBloc = GetIt.instance.get<SplashScreenBloc>();

  @override
  void initState() {
    super.initState();
    _splashScreenBloc.add(const SplashScreenGetNextPageEvent());

    _splashScreenBloc.stream.listen((SplashScreenState state) {
      if (state is SplashScreenGotNextPage) {
        context.go("/${state.nextPage}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text('Flutter Pokedex'),
    );
  }
}
