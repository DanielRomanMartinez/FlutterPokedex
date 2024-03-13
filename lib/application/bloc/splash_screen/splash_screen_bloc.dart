import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/domain/services/start_up_route_service.dart';
import 'package:injectable/injectable.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

@lazySingleton
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final StartUpRouteService _startUpRouteService;

  SplashScreenBloc(
    this._startUpRouteService,
  ) : super(const SplashScreenInitial()) {
    on<SplashScreenGetNextPageEvent>(_handleGetNextPageEvent);
  }

  void _handleGetNextPageEvent(
    SplashScreenGetNextPageEvent event,
    Emitter<SplashScreenState> emit,
  ) async {
    final String nextPage = await _startUpRouteService.getInitialPage();
    emit(SplashScreenGotNextPage(nextPage: nextPage));
  }
}
