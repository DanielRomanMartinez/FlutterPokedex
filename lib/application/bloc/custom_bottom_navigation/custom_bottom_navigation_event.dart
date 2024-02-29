part of 'custom_bottom_navigation_bloc.dart';

abstract class CustomBottomNavigationEvent extends Equatable {
  const CustomBottomNavigationEvent();

  @override
  List<Object?> get props => [];
}

class LoadPageScreen extends CustomBottomNavigationEvent {
  final PageScreen pageScreen;

  const LoadPageScreen({
    required this.pageScreen,
  });

  @override
  List<Object> get props => [
        pageScreen,
      ];
}
