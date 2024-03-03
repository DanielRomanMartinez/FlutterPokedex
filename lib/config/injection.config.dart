// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../application/bloc/captured_pokemons_screen/captured_pokemons_screen_bloc.dart'
    as _i10;
import '../application/bloc/custom_bottom_navigation/custom_bottom_navigation_bloc.dart'
    as _i3;
import '../application/bloc/home_screen/home_screen_bloc.dart' as _i16;
import '../application/bloc/pokemon_detail_screen/pokemon_detail_screen_bloc.dart'
    as _i18;
import '../application/bloc/splash_screen/splash_screen_bloc.dart' as _i13;
import '../application/bloc/user_information/user_information_bloc.dart'
    as _i17;
import '../domain/repositories/captured_pokemon_repository.dart' as _i8;
import '../domain/repositories/pokemon_repository.dart' as _i11;
import '../domain/services/http_service.dart' as _i5;
import '../domain/services/splash_service.dart' as _i7;
import '../domain/services/user_service.dart' as _i14;
import '../infrastructure/providers/hive_provider.dart' as _i4;
import '../infrastructure/repositories/hive/hive_captured_pokemons_repository.dart'
    as _i9;
import '../infrastructure/repositories/http/pokemon_repository.dart' as _i12;
import '../infrastructure/services/http_service.dart' as _i6;
import '../infrastructure/services/user_service.dart' as _i15;

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
  gh.lazySingleton<_i4.HiveProvider>(() => _i4.HiveProvider());
  gh.factory<_i5.HttpService>(() => _i6.FlutterHttpService());
  gh.factory<_i7.SplashService>(() => const _i7.SplashService());
  gh.lazySingleton<_i8.CapturedPokemonsRepository>(
      () => _i9.HiveCapturedPokemonsRepository(gh<_i4.HiveProvider>()));
  gh.lazySingleton<_i10.CapturedPokemonsScreenBloc>(() =>
      _i10.CapturedPokemonsScreenBloc(gh<_i8.CapturedPokemonsRepository>()));
  gh.factory<_i11.PokemonRepository>(() => _i12.HttpPokemonRepository(
        gh<_i5.HttpService>(),
        gh<_i8.CapturedPokemonsRepository>(),
      ));
  gh.lazySingleton<_i13.SplashScreenBloc>(
      () => _i13.SplashScreenBloc(gh<_i7.SplashService>()));
  gh.factory<_i14.UserService>(() =>
      _i15.InfrastructureUserService(gh<_i8.CapturedPokemonsRepository>()));
  gh.lazySingleton<_i16.HomeScreenBloc>(
      () => _i16.HomeScreenBloc(gh<_i11.PokemonRepository>()));
  gh.lazySingleton<_i17.UserInformationBloc>(
      () => _i17.UserInformationBloc(gh<_i14.UserService>()));
  gh.lazySingleton<_i18.PokemonDetailScreenBloc>(
      () => _i18.PokemonDetailScreenBloc(
            gh<_i11.PokemonRepository>(),
            gh<_i8.CapturedPokemonsRepository>(),
            gh<_i10.CapturedPokemonsScreenBloc>(),
            gh<_i17.UserInformationBloc>(),
          ));
  return getIt;
}
