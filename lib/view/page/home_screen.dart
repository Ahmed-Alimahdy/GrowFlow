import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/controller/habit_cubit.dart';
import 'package:habit_tracker/model/habit_model.dart';
import 'habit_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<HabitCubit>().loadHabits();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitCubit, HabitState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TimeOfDay.now().period == DayPeriod.am
                              ? 'Good morning,' : 'Good evening,',
                          style: TextStyle(
                            fontFamily: "oswald",
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more, size: 30),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.notifications, size: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Eyad',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 60),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Transform.scale(
                        scale: 1.2,
                        child: CalendarSlider(
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now().subtract(Duration(
                              days: 140)),
                          lastDate: DateTime.now().add(Duration(days: 100)),
                          onDateSelected: (date) {
                            context.read<HabitCubit>().todayHabit = context
                                .read<HabitCubit>()
                                .allHabits
                                .where((element) {
                              return element.interval == "Every day";
                            }).where((element) {
                              try {
                                DateTime habitDate = DateTime.parse(
                                    element.interval!);
                                return habitDate.compareTo(date) == 0;
                              }
                              catch (e) {
                                return false;
                              }
                            }).toList();
                          },
                          fullCalendar: false,
                          selectedDayPosition: SelectedDayPosition.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: context
                            .read<HabitCubit>()
                            .allHabits
                            .length,
                        itemBuilder: (BuildContext context, int index) =>
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HabitDetails(habit: context
                                            .read<HabitCubit>()
                                            .allHabits[index]),
                                  ),);
                              },
                              child: Card(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: context
                                        .read<HabitCubit>()
                                        .allHabits[index].color,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(context
                                                .read<HabitCubit>()
                                                .allHabits[index].icon,
                                                size: 50),
                                            Transform.scale(
                                              scale: 1.5,
                                              child: Checkbox(
                                                value: context
                                                    .read<HabitCubit>()
                                                    .allHabits[index]
                                                    .isCompleted,
                                                onChanged: (value) {
                                                  context
                                                      .read<HabitCubit>()
                                                      .toggleHabit(context
                                                      .read<HabitCubit>()
                                                      .allHabits[index]);
                                                },
                                                shape: CircleBorder(),
                                                materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  context
                                                      .read<HabitCubit>()
                                                      .allHabits[index].title!,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  context
                                                      .read<HabitCubit>()
                                                      .allHabits[index]
                                                      .description!,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded, size: 50),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 77, 84, 222),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                  label: "Add",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled, size: 50),
                  label: "Profile",
                ),
              ],

              onTap: (value) {
                if (value == 1) {
                  context.read<HabitCubit>().addHabit(Habit(
                      description: "description",
                      title: "title",
                      color: Colors.red,
                      icon: CupertinoIcons.person,
                      interval: "everyDay",
                      isCompleted: false));
                }
              },

              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          );
        }
    );
  }
}
