import 'package:flutter_pokedex/domain/model/objects/pokemon.dart';
import 'package:flutter_pokedex/domain/repositories/captured_pokemon_repository.dart';
import 'package:flutter_pokedex/infrastructure/providers/hive_provider.dart';
import 'package:flutter_pokedex/infrastructure/repositories/hive/model/hive_pokemon.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CapturedPokemonsRepository)
class HiveCapturedPokemonsRepository implements CapturedPokemonsRepository {
  static const boxName = HiveProvider.capturedPokemons;

  final HiveProvider _hiveProvider;

  Box<dynamic>? _box;

  HiveCapturedPokemonsRepository(
    this._hiveProvider,
  );

  Future<Box<dynamic>> get box async {
    _box ??= (await _hiveProvider.database)[boxName]!;

    return _box!;
  }

  @override
  Future<void> markAsCaptured(
    Pokemon pokemon,
  ) async {
    final Box<dynamic> b = await box;
    b.put(pokemon.id, HivePokemon.fromPokemon(pokemon));
  }

  Future<Pokemon?> _read({
    required int id,
  }) async {
    final HivePokemon? pokemon = await readRaw(id: id);
    if (pokemon == null) return null;

    return pokemon.toPokemon();
  }

  Future<HivePokemon?> readRaw({
    required int id,
  }) async {
    final Box<dynamic> b = await box;
    final HivePokemon? d = await b.get(id) as HivePokemon?;

    return d;
  }

  @override
  Future<List<Pokemon>> getPokemons({
    String name = '',
  }) async {
    final List<Pokemon> pokemons = [];

    final Box<dynamic> b = await box;

    if (name.isEmpty) {
      if (b.keys.isNotEmpty) {
        for (final key in b.keys) {
          Pokemon? pokemon = await _read(id: key);
          if (pokemon != null) pokemons.add(pokemon);
        }
      }

      return pokemons
        ..sort(
          (Pokemon b, Pokemon a) => a.id.compareTo(
            b.id,
          ),
        );
    }

    final values = b.values.where((pokemon) => pokemon.name.toLowerCase().contains(name.toLowerCase())).toList();

    for (final pokemonValue in values) {
      Pokemon? pokemon = await _read(id: pokemonValue.id);
      if (pokemon != null) pokemons.add(pokemon);
    }

    return pokemons
      ..sort(
        (Pokemon b, Pokemon a) => a.id.compareTo(
          b.id,
        ),
      );
  }

  @override
  Future<Pokemon?> getPokemon(int id) async {
    return await _read(id: id);
  }

  @override
  Future<void> removePokemon(int id) async {
    final HivePokemon? pokemon = await readRaw(id: id);
    if (pokemon != null) pokemon.delete();
  }
}
