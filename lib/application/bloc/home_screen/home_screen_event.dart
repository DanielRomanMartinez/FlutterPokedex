part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeScreen extends HomeScreenEvent {
  final bool cached;

  const LoadHomeScreen({
    this.cached = true,
  });

  @override
  List<Object?> get props => [
        cached,
      ];
}
