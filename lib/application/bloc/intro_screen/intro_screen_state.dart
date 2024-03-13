part of 'intro_screen_bloc.dart';

@immutable
abstract class IntroScreenState extends Equatable {
  const IntroScreenState();
}

class IntroScreenInitial extends IntroScreenState {
  const IntroScreenInitial();

  @override
  List<Object> get props => [];
}

class LoadingNextPage extends IntroScreenState {
  const LoadingNextPage();

  @override
  List<Object> get props => [];
}

class IntroScreenGotNextPage extends IntroScreenState {
  final String nextPage;

  const IntroScreenGotNextPage({
    required this.nextPage,
  });

  @override
  List<Object> get props => [
        nextPage,
      ];
}
