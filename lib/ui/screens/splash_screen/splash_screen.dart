import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:flutter_pokedex/application/bloc/user_information/user_information_bloc.dart';
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
  final UserInformationBloc _userInformationBloc = GetIt.instance.get<UserInformationBloc>();

  @override
  void initState() {
    super.initState();
    _userInformationBloc.add(const LoadUserInformation());
    _splashScreenBloc.add(const SplashScreenGetNextPageEvent());

    _splashScreenBloc.stream.listen((SplashScreenState state) {
      if (state is SplashScreenGotNextPage) {
        context.go("/${state.nextPage}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInformationBloc, UserInformationState>(
      bloc: _userInformationBloc,
      builder: (context, state) {
        return ColoredBox(
          color: state is UserInformationLoaded
              ? state.user.mostPokemonTypeCaptured?.pokemonColor.background ?? const Color(0xFF000029)
              : const Color(0xFF000029),
          child: Center(
            child: Image.asset('assets/images/pokedex_logo.png'),
          ),
        );
      },
    );
  }
}
