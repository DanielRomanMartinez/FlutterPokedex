import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pokedex/application.dart';
import 'package:flutter_pokedex/config/injection.dart';
import 'package:flutter_pokedex/domain/services/start_up_service.dart';
import 'package:get_it/get_it.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final startUpService = GetIt.instance.get<StartUpService>();
  await startUpService.init();

  runApp(const Pokedex());
}
