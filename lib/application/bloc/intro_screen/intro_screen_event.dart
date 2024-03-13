part of 'intro_screen_bloc.dart';

abstract class IntroScreenEvent extends Equatable {
  const IntroScreenEvent();
}

class FinishIntro extends IntroScreenEvent {
  const FinishIntro();

  @override
  List<Object?> get props => [];
}
