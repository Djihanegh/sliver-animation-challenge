import 'package:flutter/material.dart';

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      width: size.width * 0.27,
      height: size.height * 0.18,
      child: ClipRect(
        child: Image.asset(
          'assets/images/img1.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
