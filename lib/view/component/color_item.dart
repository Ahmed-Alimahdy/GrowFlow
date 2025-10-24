import 'package:flutter/material.dart';
class ColorItem extends StatelessWidget {
  final Color color;
  bool isSelected=false;
   ColorItem({super.key,required this.color,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: isSelected
                ? Border.all(color: Colors.white, width: 3)
                : null,
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5)]
                : [],
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
