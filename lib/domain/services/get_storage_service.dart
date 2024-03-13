abstract class GetStorageService {

  Future<bool> init();
  T? read<T>(String key);
  Future<void> write(String key, dynamic value);
  Future<void> remove(String key);
}