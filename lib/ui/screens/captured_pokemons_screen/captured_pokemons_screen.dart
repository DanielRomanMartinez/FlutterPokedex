import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/captured_pokemons_screen/captured_pokemons_screen_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/user.dart';
import 'package:flutter_pokedex/ui/common/theme/colors_map.dart';
import 'package:flutter_pokedex/ui/common/theme/shapes.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';
import 'package:flutter_pokedex/ui/common/widgets/pokemon_card/pokemon_card.dart';
import 'package:flutter_pokedex/ui/common/widgets/search_pokemon_field/search_pokemon_field.dart';
import 'package:flutter_pokedex/ui/screens/pokemon_detail_screen/pokemon_detail_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

part 'widgets/no_pokemons.dart';

class CapturedPokemonsScreen extends StatefulWidget {
  static const String routeName = 'captured-pokemons';

  const CapturedPokemonsScreen({
    super.key,
  });

  @override
  State<CapturedPokemonsScreen> createState() => _CapturedPokemonsScreenState();
}

class _CapturedPokemonsScreenState extends State<CapturedPokemonsScreen> {
  final _capturedPokemonsScreenBloc = GetIt.instance.get<CapturedPokemonsScreenBloc>();

  @override
  void initState() {
    _capturedPokemonsScreenBloc.add(const LoadCapturedPokemonsScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationLayout(
      canPop: false,
      title: 'Captured Pokemons',
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: ColorsMap.neutral100,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              child: SearchPokemonField(
                onChanged: (String text) {
                  _capturedPokemonsScreenBloc.add(SearchPokemon(name: text));
                },
                placeHolder: 'Search pokemon',
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<CapturedPokemonsScreenBloc, CapturedPokemonsScreenState>(
                  bloc: _capturedPokemonsScreenBloc,
                  builder: (context, state) {
                    if (state is CapturedPokemonsScreenLoaded) {
                      if (state.pokemons.isEmpty) {
                        return const NoPokemons();
                      }

                      return ListView.builder(
                        itemCount: state.pokemons.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.push("/${PokemonDetailScreen.routeName}/${state.pokemons[index].name}");
                                },
                                child: PokemonCard(state.pokemons[index]),
                              ),
                              const SizedBox(height: Shapes.gutter),
                            ],
                          );
                        },
                      );
                    }

                    return const Center(
                      child: Row(
                        children: [
                          Text('Loading...'),
                          SizedBox(width: 5),
                          CircularProgressIndicator(
                            color: User.defaultBackgroundColor,
                          ),

                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
