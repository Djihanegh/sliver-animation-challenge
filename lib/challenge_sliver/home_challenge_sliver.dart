import 'package:flutter/material.dart';

import 'widgets/body_sliver.dart';

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
       return Container(child: Stack(
         children: [
          // BackgroundSliver(),

         ],
       ),);
  }

  @override
  double get maxExtent => maxExtended;

  @override
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
