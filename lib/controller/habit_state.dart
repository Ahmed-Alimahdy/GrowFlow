part of 'habit_cubit.dart';

@immutable
sealed class HabitState {}

final class HabitInitial extends HabitState {}
final class HabitLoading extends HabitState {}
final class HabitLoaded extends HabitState {
  final List<Habit> allHabits;
  final List<Habit> todayHabit;
  HabitLoaded(this.allHabits,this.todayHabit);
}
final class HabitError extends HabitState {
  final String message;
  HabitError(this.message);
}