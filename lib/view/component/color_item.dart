import 'package:flutter/material.dart';
class ColorItem extends StatelessWidget {
  final Color color;
  const ColorItem({super.key,required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
