import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/habit_cubit.dart';
import '../../model/habit_model.dart';
import 'color_item.dart';
class InsertHabit extends StatelessWidget {
  final Habit habit;
  List<Color> colorPalette = [
    Color.fromARGB(255, 77, 84, 222),
    Color.fromARGB(255, 183, 232, 107),
    Color.fromARGB(255, 246, 204, 98),
    Color.fromARGB(255, 250, 142, 196),
  ];
  InsertHabit({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            initialValue: habit.title,
            onChanged: (value) {
              habit.title = value;
              context.read<HabitCubit>().updateHabit(habit);
            },
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            initialValue: habit.description,
            onChanged: (value) {
              habit.description = value;
              context.read<HabitCubit>().updateHabit(habit);
            },
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          DropdownMenu(
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: 'Every day'),
              DropdownMenuEntry(value: 2, label: 'Every week'),
              DropdownMenuEntry(value: 3, label: 'Every month'),
            ],
            initialSelection: habit.interval,
            hintText: habit.interval,
            width: double.infinity,
            leadingIcon: Icon(Icons.repeat),
            onSelected: (value) {
              switch (value) {
                case 1:
                  habit.interval = 'Every day';
                  break;
                case 2:
                  habit.interval = 'Every week';
                  break;
                case 3:
                  habit.interval = 'Every month';
                  break;
              }
              context.read<HabitCubit>().updateHabit(habit);
            },
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Color',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var color in colorPalette)
                GestureDetector(onTap:(){
                  habit.color = color;
                  context.read<HabitCubit>().updateHabit(habit);
                },child: ColorItem(color: color)),
            ],
          ),
        ],
      ),
    );
  }
}
