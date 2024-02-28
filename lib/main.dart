import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pokedex/application.dart';
import 'package:flutter_pokedex/config/injection.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const Pokedex());
}
