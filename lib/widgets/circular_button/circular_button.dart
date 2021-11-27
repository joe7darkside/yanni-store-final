import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Icon? icon;
  final Color? color;
  final Function onClick;

  const CircularButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.icon,
      required this.color,
      required this.onClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: IconButton(
        icon: icon!,
        onPressed: () => onClick(),
        enableFeedback: true,
      ),
    );
  }
}
