import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/home_screen/home_screen_bloc.dart';
import 'package:flutter_pokedex/ui/common/theme/shapes.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';
import 'package:flutter_pokedex/ui/common/widgets/pokemon_card/pokemon_card.dart';
import 'package:flutter_pokedex/ui/screens/pokemon_detail_screen/pokemon_detail_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

part 'widgets/mock_pokemon.dart';
part 'widgets/error_message.dart';
part 'widgets/home_screen_loading.dart';

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
              return ConnectivityWidget(
                showOfflineBanner: false,
                builder: (context, isOnline) {
                  if (state is HomeScreenLoaded) {
                    return ListView.builder(
                      itemCount: state.information['content'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                context.push(
                                    "/${PokemonDetailScreen.routeName}/${state.information['content'][index].name}");
                              },
                              child: PokemonCard(
                                  state.information['content'][index]),
                            ),
                            const SizedBox(height: Shapes.gutter),
                          ],
                        );
                      },
                    );
                  }

                  if (isOnline) {
                    if (state is! HomeScreenLoaded &&
                        state is! HomeScreenError) {
                      _homeScreenBloc.add(const LoadHomeScreen());
                    }

                    if (state is HomeScreenError) {
                      return ErrorMessage(
                        text: 'Something went wrong',
                        onRetry: () =>
                            _homeScreenBloc.add(const LoadHomeScreen()),
                      );
                    }

                    return const HomeScreenLoading();
                  }

                  return ErrorMessage(
                    text: 'No connectivity',
                    onRetry: () => _homeScreenBloc.add(const LoadHomeScreen()),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
