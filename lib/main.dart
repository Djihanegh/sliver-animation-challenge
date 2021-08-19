import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_animation_card/challenge_sliver/home_challenge_sliver.dart';

import 'challenge_sliver/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sliver Challenge Animated',
      theme: theme,
      home: HomeSliverChallenge(),
    );
  }
}
