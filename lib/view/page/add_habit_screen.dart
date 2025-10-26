import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/controller/habit_cubit.dart';
import 'package:habit_tracker/model/habit_model.dart';
import 'package:habit_tracker/view/page/home_screen.dart';

import '../component/insert_habit_form.dart';

class AddHabitScreen extends StatelessWidget {
  Habit habit = Habit(
    description: '',
    title: '',
    color: Color.fromARGB(255, 110, 114, 182),
    isCompleted: false,
    interval: 'Every day',
    icon: Icons.question_mark,
  );
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitCubit, HabitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
            }, icon: Icon(Icons.arrow_back)),
            title: Text('Let\'s start a new habit'),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<HabitCubit>().addHabit(habit);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InsertHabit(habit: habit, formKey: formKey, isUpdate: false),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
