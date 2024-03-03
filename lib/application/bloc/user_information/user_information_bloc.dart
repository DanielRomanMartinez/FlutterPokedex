import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/user.dart';
import 'package:flutter_pokedex/domain/services/user_service.dart';
import 'package:injectable/injectable.dart';

part 'user_information_event.dart';
part 'user_information_state.dart';

@lazySingleton
class UserInformationBloc extends Bloc<UserInformationEvent, UserInformationState> {
  final UserService _userService;

  UserInformationBloc(
    this._userService,
  ) : super(const UserInformationStateInitial()) {
    on<LoadUserInformation>(_handleLoadInformation);
  }

  Future<void> _handleLoadInformation(
    LoadUserInformation event,
    Emitter<UserInformationState> emit,
  ) async {
    emit(const LoadingUserInformation());

    final user = await _userService.getUserInformation();

    emit(UserInformationLoaded(
      user: user,
    ));
  }
}
