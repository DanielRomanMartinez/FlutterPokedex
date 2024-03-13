import 'package:flutter_pokedex/domain/services/get_storage_service.dart';
import 'package:flutter_pokedex/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_pokedex/ui/screens/intro_screen/intro_screen.dart';
import 'package:injectable/injectable.dart';

@injectable
class StartUpRouteService {
  final GetStorageService getStorageService;

  const StartUpRouteService({
    required this.getStorageService,
  });

  Future<String> getInitialPage() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    bool? isFirstTime = getStorageService.read('firstTime');

    if(isFirstTime == null || isFirstTime){
      return IntroScreen.routeName;
    }

    return HomeScreen.routeName;
  }
}
