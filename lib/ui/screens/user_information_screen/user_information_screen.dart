import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/user_information/user_information_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/user.dart';
import 'package:flutter_pokedex/ui/common/theme/shapes.dart';
import 'package:flutter_pokedex/ui/common/widgets/application_layout/application_layout.dart';
import 'package:flutter_pokedex/ui/common/widgets/pokemon_type_card/pokemon_type_card.dart';
import 'package:get_it/get_it.dart';

class UserInformationScreen extends StatelessWidget {
  static const String routeName = 'user-information';

  final _userInformationBloc = GetIt.instance.get<UserInformationBloc>();

  UserInformationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationLayout(
      canPop: false,
      title: 'User Information',
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: BlocBuilder<UserInformationBloc, UserInformationState>(
            bloc: _userInformationBloc,
            builder: (context, state) {
              if (state is! UserInformationLoaded) {
                _userInformationBloc.add(const LoadUserInformation());
              }

              if (state is UserInformationLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'User stats',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: Shapes.gutter2x),
                    Row(
                      children: [
                        const Text(
                          'Pokemons captured: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          state.user.numPokemonsCaptured.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    state.user.mostPokemonTypeCaptured == null
                        ? const SizedBox.shrink()
                        : const SizedBox(height: Shapes.gutter),
                    state.user.mostPokemonTypeCaptured == null
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              const Text(
                                'Most type pokemon captured: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 6),
                              PokemonTypeCard(state.user.mostPokemonTypeCaptured!),
                            ],
                          ),
                  ],
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
