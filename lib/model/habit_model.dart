import 'package:flutter/material.dart';

class Habit {
  int? id;
  String? title;
  String? description;
  bool isCompleted = false;
  IconData icon;
  DateTime date = DateTime.now();
  Color? color;
  String? interval;

  Habit({
    this.icon = Icons.question_mark,
    required this.description,
    required this.title,
    this.isCompleted = false,
    this.color,
    this.id,
    this.interval,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  void copyWith(Habit habit) {
    description = description!.isEmpty ? habit.description : description;
    title = title!.isEmpty ? habit.title : title;
  }

  Map<String, dynamic> toMap() {
    return {
      'interval': interval,
      'id': id,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
      'title': title,
      'color': color?.value,
      'icon': icon.codePoint,
      'creationDate': date.toString(),
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
