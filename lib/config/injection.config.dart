// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../application/bloc/custom_bottom_navigation/custom_bottom_navigation_bloc.dart'
    as _i3;
import '../application/bloc/home_screen/home_screen_bloc.dart' as _i9;
import '../application/bloc/splash_screen/splash_screen_bloc.dart' as _i10;
import '../domain/repositories/pokemon_repository.dart' as _i6;
import '../domain/services/http_service.dart' as _i4;
import '../domain/services/splash_service.dart' as _i8;
import '../infrastructure/repositories/http/pokemon_repository.dart' as _i7;
import '../infrastructure/services/http_service.dart' as _i5;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.CustomBottomNavigationBloc>(
      () => _i3.CustomBottomNavigationBloc());
  gh.factory<_i4.HttpService>(() => _i5.FlutterHttpService());
  gh.factory<_i6.PokemonRepository>(
      () => _i7.HttpPokemonRepository(gh<_i4.HttpService>()));
  gh.factory<_i8.SplashService>(() => const _i8.SplashService());
  gh.lazySingleton<_i9.HomeScreenBloc>(
      () => _i9.HomeScreenBloc(gh<_i6.PokemonRepository>()));
  gh.lazySingleton<_i10.SplashScreenBloc>(
      () => _i10.SplashScreenBloc(gh<_i8.SplashService>()));
  return getIt;
}
