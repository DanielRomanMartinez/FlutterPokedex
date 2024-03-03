part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeScreenStateInitial extends HomeScreenState {
  const HomeScreenStateInitial();

  @override
  List<Object> get props => [];
}

class LoadingHomeScreen extends HomeScreenStateInitial {
  const LoadingHomeScreen();

  @override
  List<Object> get props => [];
}

class HomeScreenLoaded extends HomeScreenStateInitial {
  final Map<String, dynamic> information;

  const HomeScreenLoaded({
    required this.information,
  });

  @override
  List<Object> get props => [
        information,
      ];
}
