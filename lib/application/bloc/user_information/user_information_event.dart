part of 'user_information_bloc.dart';

abstract class UserInformationEvent extends Equatable {
  const UserInformationEvent();

  @override
  List<Object?> get props => [];
}

class LoadUserInformation extends UserInformationEvent {
  const LoadUserInformation();
}