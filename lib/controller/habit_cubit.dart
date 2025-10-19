import 'package:bloc/bloc.dart';
import 'package:habit_tracker/model/habit_model.dart';
import 'package:meta/meta.dart';

import '../services/sqflite_services.dart';

part 'habit_state.dart';

class HabitCubit extends Cubit<HabitState> {
  List<Habit> allHabits =[];
  List<Habit> todayHabit=[];
  HabitCubit() : super(HabitInitial());
  void loadHabits() async{
    try {
      emit(HabitLoading());
      await Sqflite_service.open('habit5.db');
      allHabits = await Sqflite_service().getHabits() ?? [];
      todayHabit = [];
      emit(HabitLoaded(allHabits, todayHabit));
    }
    catch(e)
    {
      emit(HabitError(e.toString()));
    }
  }
  void toggleHabit(Habit habit) async {
    try {
      habit.isCompleted = !habit.isCompleted;
      await Sqflite_service.update(habit);
       loadHabits();
    }
    catch(e) {
      emit(HabitError(e.toString()));
    }
  }
  void addHabit(Habit habit) async {
    try {
      await Sqflite_service.insert(habit);
      loadHabits();
    }
    catch(e) {
      emit(HabitError(e.toString()));
    }
  }
  void deleteHabit(Habit habit) async {
    try {
      await Sqflite_service.delete(habit.id!);
      loadHabits();
    }
    catch(e) {
      emit(HabitError(e.toString()));
    }
  }
  void updateHabit(Habit habit) async {
    try {
      await Sqflite_service.update(habit);
      loadHabits();
    }
    catch(e) {
      emit(HabitError(e.toString()));
    }
  }
}

