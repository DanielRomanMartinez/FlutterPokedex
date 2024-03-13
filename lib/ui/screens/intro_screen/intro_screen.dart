import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/application/bloc/intro_screen/intro_screen_bloc.dart';
import 'package:flutter_pokedex/ui/common/theme/shapes.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = 'intro';

  const IntroScreen({
    super.key,
  });

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final IntroScreenBloc _introScreenBloc = GetIt.instance.get<IntroScreenBloc>();

  @override
  void initState() {
    super.initState();

    _introScreenBloc.stream.listen((IntroScreenState state) {
      if (state is IntroScreenGotNextPage) {
        context.go("/${state.nextPage}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<IntroScreenBloc, IntroScreenState>(
          bloc: _introScreenBloc,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/intro/intro_image_player.png'),
                const SizedBox(height: Shapes.gutter2x),
                const Text(
                  'Are you ready for the adventure?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: Shapes.gutter),
                const Text(
                  'Start exploring the world of Pokémon today!',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 70),
                InkWell(
                  onTap: () {
                    if (state is! LoadingNextPage) {
                      _introScreenBloc.add(const FinishIntro());
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF173EA5),
                    ),
                    child: (state is LoadingNextPage)
                        ? const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                        : Center(
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
