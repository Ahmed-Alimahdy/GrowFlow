import 'package:flutter/material.dart';
class IconItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final bool isSelected;
  const IconItem({super.key,required this.icon,required this.color,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(color: Colors.white, width: 3)
            : null,
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5)]
            : [],
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon,size: 30),
    );
  }
}
