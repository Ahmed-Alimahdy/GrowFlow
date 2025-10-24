import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/view/component/icon_item.dart';
import 'dart:math';
import '../../controller/habit_cubit.dart';
import '../../model/habit_model.dart';
import 'color_item.dart';
class InsertHabit extends StatelessWidget {
  final Habit habit;
  final GlobalKey<FormState> formKey;
  final List<Color> colorPalette = [
    Color.fromARGB(255, 110, 114, 182),
    Color.fromARGB(255, 183, 232, 107),
    Color.fromARGB(255, 246, 204, 98),
    Color.fromARGB(255, 250, 142, 196),
  ];
  final List<IconData> iconsList = const [
    Icons.import_contacts,
    Icons.sports_gymnastics,
    Icons.water_drop,
    Icons.access_alarm,
    Icons.account_balance,
    Icons.electric_bolt,
    Icons.fastfood,
    Icons.nightlight_round,
    Icons.spa,
    Icons.code,
    Icons.book,
    Icons.run_circle,
    Icons.self_improvement,
    Icons.sunny,
    Icons.sports_baseball,
    Icons.sports_basketball,
  ];
  final bool isUpdate;
  InsertHabit({super.key, required this.habit, required this.isUpdate,required this.formKey});


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: habit.title,
            onChanged: (value) {
              habit.title = value;
              if(isUpdate) {
                context.read<HabitCubit>().updateHabit(habit);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
                counter: SizedBox()
            ),
            maxLength: 20,
          ),
          SizedBox(height: 20),
          TextFormField(
            initialValue: habit.description,
            onChanged: (value) {
              habit.description = value;
              if(isUpdate)
              context.read<HabitCubit>().updateHabit(habit);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
              counter: SizedBox()
            ),
            maxLength: 60,
          ),
          SizedBox(height: 20),
          DropdownMenu(
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: 'Every day'),
              DropdownMenuEntry(value: 2, label: 'Every week'),
              DropdownMenuEntry(value: 3, label: 'Every month'),
            ],
            initialSelection: habit.interval ?? 1,
            hintText: habit.interval ?? 'Interval',
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
              if(isUpdate)
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
                },child: ColorItem(color: color ,isSelected: habit.color == color,)),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Icon',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
           SizedBox(
             height: (iconsList.length/4).ceil()*100,
             child: GridView.builder(
               shrinkWrap: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: iconsList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    habit.icon = iconsList[index];
                    context.read<HabitCubit>().updateHabit(habit);
                  },
                  child: IconItem(icon: iconsList[index] , color: habit.color!,isSelected: habit.icon == iconsList[index],)
                )
             ),
           ),
        ],
      ),
    );
  }
}
