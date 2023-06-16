import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:watch_it_app/movies/presentation/screens/test_screen.dart';

import 'movies_screen.dart';

class SwipingScreens extends StatelessWidget {
  static const String routeName = 'swipe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LiquidSwipe(
      ignoreUserGestureWhileAnimating: true,
      pages: page,
      enableLoop: true,
      fullTransitionValue: 800,
      waveType: WaveType.liquidReveal,
      positionSlideIcon: 0.5,
    ));
  }
}

final page = [const MainMoviesScreen(), TestScreen()];
