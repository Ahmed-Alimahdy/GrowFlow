import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/model/habit_model.dart';
import 'package:habit_tracker/view/component/insert_habit_form.dart';
import 'package:habit_tracker/view/page/home_screen.dart';

import '../../controller/habit_cubit.dart';

class HabitDetails extends StatelessWidget {
  Habit habit;
  Habit origHabit=Habit(description: '', title: '');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  HabitDetails({super.key, required this.habit})
  {
    origHabit.copyWith(habit);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitCubit, HabitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () {
              if(formKey.currentState!.validate()) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
              }
              else
                {
                  habit.copyWith(origHabit);
                  context.read<HabitCubit>().updateHabit(habit);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                }
            }, icon: Icon(Icons.arrow_back)),
            title: Text('Habit Details'),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<HabitCubit>().deleteHabit(habit);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: habit.color,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(habit.icon, size: 50),
                              Text(
                                habit.title!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              Text(
                                habit.description!,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -30,
                        left: 7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Interval',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '${habit.interval}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Created at',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '${habit.date.day}/${habit.date.month}/${habit.date.year}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Is Completed',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Checkbox(
                                    value: habit.isCompleted,
                                    onChanged: (value) {
                                      context.read<HabitCubit>().toggleHabit(
                                        habit,
                                      );
                                    },
                                    shape: CircleBorder(),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Update Habit',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: InsertHabit(habit: habit,isUpdate: true,formKey: formKey,),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
