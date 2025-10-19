import 'package:flutter/material.dart';
class Habit{
  int? id;
  String? title;
  String? description;
  bool isCompleted=false;
  IconData icon = Icons.question_mark;
  Color? color;
  String? interval;

  Habit({IconData? icon, required String this.description,required String this.title,this.isCompleted=false,Color this.color=Colors.grey,this.id,this.interval}){
    this.icon = icon ?? Icons.question_mark;
  }



  Map<String, dynamic> toMap() {
    return {
      'interval': interval,
      'id': id,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
      'title': title,
      'color': color?.value,
      'icon': icon.codePoint
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      interval: map["interval"],
      id: map['id'],
      description: map['description'] as String,
      isCompleted: map['isCompleted'] == 1,
      title: map['title'] as String,
      color: Color(map['color']),
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
    );
  }
}
