import 'package:flutter/material.dart';

class ValContainer extends StatelessWidget {
  ValContainer(
      {key, required this.title, required this.color, required this.fontSize})
      : key = key ?? UniqueKey();
  final Key key;
  final String title;
  final Color color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
