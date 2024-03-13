import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/domain/services/get_storage_service.dart';
import 'package:flutter_pokedex/domain/services/start_up_route_service.dart';
import 'package:injectable/injectable.dart';

part 'intro_screen_event.dart';
part 'intro_screen_state.dart';

@lazySingleton
class IntroScreenBloc extends Bloc<IntroScreenEvent, IntroScreenState> {
  final GetStorageService _getStorageService;
  final StartUpRouteService _startUpRouteService;

  IntroScreenBloc(
    this._getStorageService,
    this._startUpRouteService,
  ) : super(const IntroScreenInitial()) {
    on<FinishIntro>(_finishIntro);
  }

  void _finishIntro(
    FinishIntro event,
    Emitter<IntroScreenState> emit,
  ) async {
    emit(const LoadingNextPage());
    _getStorageService.write('firstTime', false);
    final String nextPage = await _startUpRouteService.getInitialPage();
    emit(IntroScreenGotNextPage(nextPage: nextPage));
  }
}
