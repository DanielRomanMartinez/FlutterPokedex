part of 'user_information_bloc.dart';

@immutable
abstract class UserInformationState extends Equatable {
  const UserInformationState();
}

class UserInformationStateInitial extends UserInformationState {
  const UserInformationStateInitial();

  @override
  List<Object> get props => [];
}

class LoadingUserInformation extends UserInformationStateInitial {
  const LoadingUserInformation();

  @override
  List<Object> get props => [];
}

class UserInformationLoaded extends UserInformationStateInitial {
  final User user;

  const UserInformationLoaded({
    required this.user,
  });

  @override
  List<Object> get props => [
    user,
      ];
}
