import 'package:flutter_pokedex/ui/screens/home_screen/home_screen.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashService {

  const SplashService();

  Future<String> getNextPage() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return HomeScreen.routeName;
  }
}
