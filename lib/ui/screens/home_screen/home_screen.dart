import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/home_screen/home_screen_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/user.dart';
import 'package:flutter_pokedex/ui/common/theme/shapes.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';
import 'package:flutter_pokedex/ui/common/widgets/pokemon_card/pokemon_card.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  final _homeScreenBloc = GetIt.instance.get<HomeScreenBloc>();

  HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationLayout(
      canPop: false,
      title: 'Pokemons',
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            bloc: _homeScreenBloc,
            builder: (context, state) {
              if (state is! HomeScreenLoaded) {
                _homeScreenBloc.add(const LoadHomeScreen());
              }

              if (state is HomeScreenLoaded) {
                return ListView.builder(
                  itemCount: state.information['content'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        PokemonCard(state.information['content'][index]),
                        const SizedBox(height: Shapes.gutter),
                      ],
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(
                  color: User.defaultBackgroundColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
