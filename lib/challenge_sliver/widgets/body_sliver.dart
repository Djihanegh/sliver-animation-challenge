import 'package:flutter/material.dart';

import '../theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10),
      color: backgroundcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            CustomIcon(icon: Icons.stars, text: '89%'),
            CustomIcon(icon: Icons.tv, text: 'Netflix'),
            CustomIcon(icon: Icons.wc, text: 'Tv +14'),
            CustomIcon(icon: Icons.av_timer_rounded, text: '50m'),
          ],),

          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              '''When a young boy disappears, his mother, a police chief ''',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 10),
            child: Text(
              'Related shows',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 23),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  8,
                  (index) => Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ClipRect(
                          child: Image(
                              height: size.height * 0.18,
                              width: size.width * 0.23,
                              image: AssetImage(
                                'assets/images/img${index}.jpg',
                              ),
                              fit: BoxFit.fill),
                          //borderRadius: BorderRadius.circular(10)
                        ),
                      )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Seasons',
                style: TextStyle(fontSize: 23),
              )),
          Features(
              size: size,
              title: 'Season 1',
              subtitle: '8 Watched',
              colorline: Colors.red[300]!),
          Features(
              size: size,
              title: 'Season 2',
              subtitle: '9 Watched',
              colorline: Colors.red[300]!),
          Features(
              size: size,
              title: 'Season 3',
              subtitle: '1 to air',
              colorline: Colors.grey[300]!),
        ],
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 45,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        )
      ],
    );
  }
}

class Features extends StatelessWidget {
  const Features(
      {Key? key,
      required this.size,
      required this.title,
      required this.subtitle,
      required this.colorline})
      : super(key: key);

  final Size size;
  final String title;
  final String subtitle;
  final Color colorline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: size.width,
      color: backgroundcolor,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 5,
                    color: colorline,
                  )),
            ],
          )),
          Icon(
            Icons.pending,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}
