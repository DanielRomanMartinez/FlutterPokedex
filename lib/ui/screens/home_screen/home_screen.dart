import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/home_screen/home_screen_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/user.dart';
import 'package:flutter_pokedex/ui/common/theme/shapes.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';
import 'package:flutter_pokedex/ui/common/widgets/pokemon_card/pokemon_card.dart';
import 'package:flutter_pokedex/ui/screens/pokemon_detail_screen/pokemon_detail_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

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
      title: 'Pokedex',
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            bloc: _homeScreenBloc,
            builder: (context, state) {
              if (state is! HomeScreenLoaded && state is! HomeScreenError) {
                _homeScreenBloc.add(const LoadHomeScreen());
              }

              if (state is HomeScreenLoaded) {
                return ListView.builder(
                  itemCount: state.information['content'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .push("/${PokemonDetailScreen.routeName}/${state.information['content'][index].name}");
                          },
                          child: PokemonCard(state.information['content'][index]),
                        ),
                        const SizedBox(height: Shapes.gutter),
                      ],
                    );
                  },
                );
              }

              if (state is HomeScreenError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Something went wrong',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: Shapes.gutter2x),
                      InkWell(
                        onTap: () => _homeScreenBloc.add(const LoadHomeScreen()),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFF173EA5),
                          ),
                          child: const Text(
                            'Try again',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
