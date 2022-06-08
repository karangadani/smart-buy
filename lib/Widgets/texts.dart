import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  final String text;
  const SubTitleText({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  final String text;
  const HeadingWidget({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
    );
  }
}