import 'package:flutter_pokedex/domain/model/objects/user.dart';

abstract class UserService {
  Future<User> getUserInformation();
}