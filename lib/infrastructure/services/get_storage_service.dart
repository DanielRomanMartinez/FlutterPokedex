import 'package:flutter_pokedex/domain/services/get_storage_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetStorageService)
class FlutterGetStorageService implements GetStorageService {

  @override
  Future<bool> init() async {
    return await GetStorage.init();
  }

  @override
  T? read<T>(String key) {
    final box = GetStorage();
    return box.read(key);
  }

  @override
  Future<void> write(String key, dynamic value) async {
    final box = GetStorage();
    box.write(key, value);
  }

  @override
  Future<void> remove(String key) async {
    final box = GetStorage();
    box.remove(key);
  }

}