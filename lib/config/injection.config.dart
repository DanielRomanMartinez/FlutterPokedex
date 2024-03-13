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
    as _i14;
import '../application/bloc/custom_bottom_navigation/custom_bottom_navigation_bloc.dart'
    as _i3;
import '../application/bloc/home_screen/home_screen_bloc.dart' as _i21;
import '../application/bloc/intro_screen/intro_screen_bloc.dart' as _i15;
import '../application/bloc/pokemon_detail_screen/pokemon_detail_screen_bloc.dart'
    as _i23;
import '../application/bloc/splash_screen/splash_screen_bloc.dart' as _i18;
import '../application/bloc/user_information/user_information_bloc.dart'
    as _i22;
import '../domain/repositories/captured_pokemon_repository.dart' as _i12;
import '../domain/repositories/pokemon_repository.dart' as _i16;
import '../domain/services/get_storage_service.dart' as _i4;
import '../domain/services/http_service.dart' as _i7;
import '../domain/services/start_up_route_service.dart' as _i9;
import '../domain/services/start_up_service.dart' as _i10;
import '../domain/services/user_service.dart' as _i19;
import '../infrastructure/providers/hive_provider.dart' as _i6;
import '../infrastructure/repositories/hive/hive_captured_pokemons_repository.dart'
    as _i13;
import '../infrastructure/repositories/http/pokemon_repository.dart' as _i17;
import '../infrastructure/services/get_storage_service.dart' as _i5;
import '../infrastructure/services/http_service.dart' as _i8;
import '../infrastructure/services/start_up_service.dart' as _i11;
import '../infrastructure/services/user_service.dart' as _i20;

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
  gh.factory<_i4.GetStorageService>(() => _i5.FlutterGetStorageService());
  gh.lazySingleton<_i6.HiveProvider>(() => _i6.HiveProvider());
  gh.factory<_i7.HttpService>(() => _i8.FlutterHttpService());
  gh.factory<_i9.StartUpRouteService>(() =>
      _i9.StartUpRouteService(getStorageService: gh<_i4.GetStorageService>()));
  gh.factory<_i10.StartUpService>(() => _i11.FlutterStartUpService(
      getStorageService: gh<_i4.GetStorageService>()));
  gh.lazySingleton<_i12.CapturedPokemonsRepository>(
      () => _i13.HiveCapturedPokemonsRepository(gh<_i6.HiveProvider>()));
  gh.lazySingleton<_i14.CapturedPokemonsScreenBloc>(() =>
      _i14.CapturedPokemonsScreenBloc(gh<_i12.CapturedPokemonsRepository>()));
  gh.lazySingleton<_i15.IntroScreenBloc>(() => _i15.IntroScreenBloc(
        gh<_i4.GetStorageService>(),
        gh<_i9.StartUpRouteService>(),
      ));
  gh.factory<_i16.PokemonRepository>(() => _i17.HttpPokemonRepository(
        gh<_i7.HttpService>(),
        gh<_i12.CapturedPokemonsRepository>(),
      ));
  gh.lazySingleton<_i18.SplashScreenBloc>(
      () => _i18.SplashScreenBloc(gh<_i9.StartUpRouteService>()));
  gh.factory<_i19.UserService>(() =>
      _i20.InfrastructureUserService(gh<_i12.CapturedPokemonsRepository>()));
  gh.lazySingleton<_i21.HomeScreenBloc>(
      () => _i21.HomeScreenBloc(gh<_i16.PokemonRepository>()));
  gh.lazySingleton<_i22.UserInformationBloc>(
      () => _i22.UserInformationBloc(gh<_i19.UserService>()));
  gh.lazySingleton<_i23.PokemonDetailScreenBloc>(
      () => _i23.PokemonDetailScreenBloc(
            gh<_i16.PokemonRepository>(),
            gh<_i12.CapturedPokemonsRepository>(),
            gh<_i14.CapturedPokemonsScreenBloc>(),
            gh<_i22.UserInformationBloc>(),
          ));
  return getIt;
}
