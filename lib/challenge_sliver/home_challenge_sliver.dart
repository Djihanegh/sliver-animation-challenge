import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/background_sliver.dart';
import 'widgets/body_sliver.dart';
import 'widgets/cover_photo.dart';
import 'widgets/cut_rectangle.dart';

class HomeSliverChallenge extends StatefulWidget {
  const HomeSliverChallenge({Key? key}) : super(key: key);

  @override
  _HomeSliverChallengeState createState() => _HomeSliverChallengeState();
}

class _HomeSliverChallengeState extends State<HomeSliverChallenge> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: _AppBarNetflix(
                  maxExtended: size.height * 0.35,
                  minExtended: kToolbarHeight,
                  size: size)),
          SliverToBoxAdapter(
            child: Body(size: size),
          )
        ],
      ),
    );
  }
}

class _AppBarNetflix extends SliverPersistentHeaderDelegate {
  final double maxExtended;
  final double minExtended;
  final Size size;

  const _AppBarNetflix(
      {required this.maxExtended,
      required this.minExtended,
      required this.size});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxExtended;
    //validate the angle at which the card returns
    final uploadlimit = 13 / 100;
    //return value of the card
    final valueback = (1 - percent - 0.77).clamp(0, uploadlimit);

    final fixrotation = pow(percent, 1.5);

    final bottomsliverbar = _CustomBottomSliverBar(
        size: size, fixrotation: fixrotation, percent: percent);
    final card = _CoverCard(
        valueback: valueback,
        size: size,
        percent: percent,
        uploadlimit: uploadlimit);
    return Container(
      child: Stack(
        children: [
          BackgroundSliver(),
          if (percent > uploadlimit) ...[
            card,
            bottomsliverbar
          ] else ...[
            bottomsliverbar,
            card
          ]
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxExtended;

  @override
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _CoverCard extends StatelessWidget {
  const _CoverCard(
      {Key? key,
      required this.size,
      required this.percent,
      required this.uploadlimit,
      required this.valueback})
      : super(key: key);

  final Size size;
  final double percent;
  final double uploadlimit;
  final num valueback;

  final double angleForCard = 6.5;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height * 0.15,
        left: size.width / 24,
        child: Transform(
          alignment: Alignment.topRight,
          transform: Matrix4.identity()
            ..rotateZ(percent > uploadlimit
                ? (valueback * angleForCard)
                : percent * angleForCard),
          child: CoverPhoto(size: size),
        ));
  }
}

class _CustomBottomSliverBar extends StatelessWidget {
  const _CustomBottomSliverBar(
      {Key? key,
      required this.size,
      required this.percent,
      required this.fixrotation})
      : super(key: key);
  final Size size;
  final double percent;
  final num fixrotation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        bottom: 0,
        left: -size.width * fixrotation.clamp(0, 0.35),
        child: Container(
          height: size.height * 0.12,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: CutRectangle(),
              )
            ],
          ),
        ));
  }
}
