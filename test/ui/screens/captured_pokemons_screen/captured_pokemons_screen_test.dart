import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pokedex/application/bloc/captured_pokemons_screen/captured_pokemons_screen_bloc.dart';
import 'package:flutter_pokedex/application/bloc/custom_bottom_navigation/custom_bottom_navigation_bloc.dart';
import 'package:flutter_pokedex/application/bloc/user_information/user_information_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/domain/model/objects/pokemon_type.dart';
import 'package:flutter_pokedex/domain/model/objects/user.dart';
import 'package:flutter_pokedex/extensions/string_extension.dart';
import 'package:flutter_pokedex/ui/screens/captured_pokemons_screen/captured_pokemons_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import 'captured_pokemons_screen_test.mocks.dart';

class _Constants {
  static const String channelPath = "plugins.flutter.io/path_provider";
  static const String methodNameForPath = "getApplicationSupportDirectory";
  static const String methodNameForTempPath = "getTemporaryDirectory";
}

@GenerateMocks([
  CapturedPokemonsScreenBloc,
  CustomBottomNavigationBloc,
  UserInformationBloc,
])
void main() {
  late CapturedPokemonsScreenBloc capturedPokemonsScreenBloc;
  late CustomBottomNavigationBloc customBottomNavigationBloc;
  late UserInformationBloc userInformationBloc;

  TestWidgetsFlutterBinding.ensureInitialized();

  const pokemon = Pokemon(
    id: 1,
    name: 'Bulbasaur',
    description: 'Description',
    height: 10,
    weight: 10,
    isCaptured: false,
    image: '',
    types: [
      PokemonType(name: 'grass'),
    ],
  );

  setUpAll(() async {
    capturedPokemonsScreenBloc = MockCapturedPokemonsScreenBloc();
    customBottomNavigationBloc = MockCustomBottomNavigationBloc();
    userInformationBloc = MockUserInformationBloc();

    final getIt = GetIt.instance;
    getIt.registerSingleton<CapturedPokemonsScreenBloc>(
        capturedPokemonsScreenBloc);
    getIt.registerSingleton<CustomBottomNavigationBloc>(
        customBottomNavigationBloc);
    getIt.registerSingleton<UserInformationBloc>(userInformationBloc);

    String? providedPath;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel(_Constants.channelPath),
      (MethodCall methodCall) async {
        if (methodCall.method == _Constants.methodNameForPath) {
          return providedPath;
        }
        if (methodCall.method == _Constants.methodNameForTempPath) {
          return providedPath;
        }
        return null;
      },
    );
  });

  group('Captured Screen Test', () {
    testWidgets('Pump and test widget - Initial', (WidgetTester tester) async {
      const CapturedPokemonsScreenState state =
          CapturedPokemonsScreenStateInitial();
      const UserInformationState userState = UserInformationLoaded(
        user: User(
          numPokemonsCaptured: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mostPokemonTypeCaptured: null,
        ),
      );
      const CustomBottomNavigationState customBottomNavigationState =
          CustomBottomNavigationStateInitial();

      when(capturedPokemonsScreenBloc.stream).thenAnswer((_) {
        when(capturedPokemonsScreenBloc.state).thenAnswer((_) => state);
        return Stream.value(state);
      });

      when(userInformationBloc.stream).thenAnswer((_) {
        when(userInformationBloc.state).thenAnswer((_) => userState);
        return Stream.value(userState);
      });

      when(customBottomNavigationBloc.stream).thenAnswer((_) {
        when(customBottomNavigationBloc.state)
            .thenAnswer((_) => customBottomNavigationState);
        return Stream.value(customBottomNavigationState);
      });

      when(capturedPokemonsScreenBloc.state).thenAnswer((_) => state);
      when(userInformationBloc.state).thenAnswer((_) => userState);
      when(customBottomNavigationBloc.state)
          .thenAnswer((_) => customBottomNavigationState);

      await tester.pumpWidget(
        const MaterialApp(
          home: CapturedPokemonsScreen(),
        ),
      );

      Finder textFinder = find.text('Loading...');
      expect(textFinder, findsOneWidget);

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
            '../../goldens/captured_pokemons_screen/captured_pokemons_screen_1.png'),
      );
    });

    testWidgets('Pump and test widget - Pokemons Loaded',
        (WidgetTester tester) async {
      const CapturedPokemonsScreenState state = CapturedPokemonsScreenLoaded(
        pokemons: [
          pokemon,
        ],
      );
      const UserInformationState userState = UserInformationLoaded(
        user: User(
          numPokemonsCaptured: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mostPokemonTypeCaptured: null,
        ),
      );
      const CustomBottomNavigationState customBottomNavigationState =
          CustomBottomNavigationStateInitial();

      when(capturedPokemonsScreenBloc.stream).thenAnswer((_) {
        when(capturedPokemonsScreenBloc.state).thenAnswer((_) => state);
        return Stream.value(state);
      });

      when(userInformationBloc.stream).thenAnswer((_) {
        when(userInformationBloc.state).thenAnswer((_) => userState);
        return Stream.value(userState);
      });

      when(customBottomNavigationBloc.stream).thenAnswer((_) {
        when(customBottomNavigationBloc.state)
            .thenAnswer((_) => customBottomNavigationState);
        return Stream.value(customBottomNavigationState);
      });

      when(capturedPokemonsScreenBloc.state).thenAnswer((_) => state);
      when(userInformationBloc.state).thenAnswer((_) => userState);
      when(customBottomNavigationBloc.state)
          .thenAnswer((_) => customBottomNavigationState);

      await mockNetworkImages(() async => await tester.pumpWidget(
            const MaterialApp(
              home: CapturedPokemonsScreen(),
            ),
          ));

      Finder textFinder = find.text(pokemon.name.capitalize());
      expect(textFinder, findsOneWidget);

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
            '../../goldens/captured_pokemons_screen/captured_pokemons_screen_2.png'),
      );
    });
  });
}
