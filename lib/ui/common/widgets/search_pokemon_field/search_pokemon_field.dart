import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/user_information/user_information_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/user.dart';
import 'package:get_it/get_it.dart';

class SearchPokemonField extends StatefulWidget {
  final Function(String text) onChanged;
  final String placeHolder;

  const SearchPokemonField({
    required this.onChanged,
    required this.placeHolder,
    super.key,
  });

  @override
  State<SearchPokemonField> createState() => _SearchPokemonFieldState();
}

class _SearchPokemonFieldState extends State<SearchPokemonField> {
  final _textController = TextEditingController();
  final UserInformationBloc _userInformationBloc = GetIt.instance.get<UserInformationBloc>();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInformationBloc, UserInformationState>(
      bloc: _userInformationBloc,
      builder: (context, state) {
        return TextField(

          controller: _textController,
          onChanged: (String text) => widget.onChanged.call(text),
          cursorColor: state is UserInformationLoaded ? state.user.backgroundColor : User.defaultBackgroundColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: widget.placeHolder,
            contentPadding: const EdgeInsets.all(15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: state is UserInformationLoaded ? state.user.backgroundColor : User.defaultBackgroundColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: state is UserInformationLoaded ? state.user.backgroundColor : User.defaultBackgroundColor,
                width: 2,
              ),
            ),
          ),
        );
      },
    );
  }
}
