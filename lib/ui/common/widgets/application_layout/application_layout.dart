import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/custom_bottom_navigation/custom_bottom_navigation_bloc.dart';
import 'package:flutter_pokedex/application/bloc/user_information/user_information_bloc.dart';
import 'package:flutter_pokedex/domain/model/objects/user.dart';
import 'package:flutter_pokedex/ui/common/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ApplicationLayout extends StatelessWidget {
  static const String routeName = 'home';

  final CustomBottomNavigationBloc _customBottomNavigationBloc = GetIt.instance.get<CustomBottomNavigationBloc>();
  final UserInformationBloc _userInformationBloc = GetIt.instance.get<UserInformationBloc>();

  final Widget child;
  final bool canPop;
  final String title;

  ApplicationLayout({
    super.key,
    required this.child,
    required this.canPop,
    required this.title,
    required,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInformationBloc, UserInformationState>(
      bloc: _userInformationBloc,
      builder: (context, userBlocState) {
        if (userBlocState is! UserInformationLoaded) {
          _userInformationBloc.add(const LoadUserInformation());
        }

        final Color backgroundColor = userBlocState is UserInformationLoaded ? userBlocState.user.backgroundColor : User.defaultBackgroundColor;
        final Color foregroundColor = userBlocState is UserInformationLoaded ? userBlocState.user.foregroundColor : User.defaultForegroundColor;

        return Scaffold(
          appBar: AppBar(
            leading: canPop ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: foregroundColor,
              ),
              onPressed: () => context.pop(),
            ) : const SizedBox.shrink(),
            title: Text(
              title,
              style: TextStyle(color: foregroundColor),
            ),
            backgroundColor: backgroundColor,
          ),
          bottomNavigationBar: BlocBuilder<CustomBottomNavigationBloc, CustomBottomNavigationState>(
            bloc: _customBottomNavigationBloc,
            builder: (context, navigationBlocState) {
              if (navigationBlocState is PageScreenLoaded) {
                return CustomBottomNavigationBar(
                  pageScreen: navigationBlocState.pageScreen,
                  bloc: _customBottomNavigationBloc,
                  color: backgroundColor,
                );
              }
              return CustomBottomNavigationBar(
                bloc: _customBottomNavigationBloc,
                color: backgroundColor,
              );
            },
          ),
          body: child,
        );
      },
    );
  }
}
