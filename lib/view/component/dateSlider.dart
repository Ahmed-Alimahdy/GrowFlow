import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/habit_cubit.dart';
class DateSlider extends StatelessWidget {
  const DateSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(5.0),
      child: Transform.scale(
        scale: 1.2,
        child: CalendarSlider(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 140)),
          lastDate: DateTime.now().add(Duration(days: 100)),
          onDateSelected: (date) {
            context.read<HabitCubit>().updateDate(date);
          },
          fullCalendar: false,
          selectedDayPosition: SelectedDayPosition.center,
          selectedTileBackgroundColor:  Color.fromARGB(255, 77, 84, 222),
        ),
      ),
    );
  }
}
