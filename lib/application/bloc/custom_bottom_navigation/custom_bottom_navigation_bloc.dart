import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'custom_bottom_navigation_event.dart';
part 'custom_bottom_navigation_state.dart';

enum PageScreen {
  home(0),
  regions(1),
  favorites(2),
  user(3);

  const PageScreen(this.value);
  final int value;
}

@lazySingleton
class CustomBottomNavigationBloc
    extends Bloc<CustomBottomNavigationEvent, CustomBottomNavigationState> {
  CustomBottomNavigationBloc()
      : super(const CustomBottomNavigationStateInitial()) {
    on<LoadPageScreen>(_loadPage);
  }

  Future<void> _loadPage(
    LoadPageScreen event,
    Emitter<CustomBottomNavigationState> emit,
  ) async {
    emit(PageScreenLoaded(
      pageScreen: event.pageScreen,
    ));
  }
}
