import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/controller/habit_cubit.dart';
import 'package:habit_tracker/view/component/dateSlider.dart';
import 'package:habit_tracker/view/page/add_habit_screen.dart';
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
                            ? 'Good morning,'
                            : 'Good evening,',
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
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DateSlider(),
                  if (context.read<HabitCubit>().todayHabit.isEmpty)
                    Column(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.add, size: 100,color: Colors.grey,),Text('There is not habits yet!',style: TextStyle(color: Colors.grey,fontSize: 16),)]),
                  if(context.read<HabitCubit>().todayHabit.isNotEmpty)
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: context.read<HabitCubit>().todayHabit.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HabitDetails(
                                    habit: context
                                        .read<HabitCubit>()
                                        .todayHabit[index],
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: context
                                      .read<HabitCubit>()
                                      .todayHabit[index]
                                      .color,
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
                                          Icon(
                                            context
                                                .read<HabitCubit>()
                                                .todayHabit[index]
                                                .icon,
                                            size: 50,
                                          ),
                                          Transform.scale(
                                            scale: 1.5,
                                            child: Checkbox(
                                              value: context
                                                  .read<HabitCubit>()
                                                  .todayHabit[index]
                                                  .isCompleted,
                                              onChanged: (value) {
                                                context
                                                    .read<HabitCubit>()
                                                    .toggleHabit(
                                                      context
                                                          .read<HabitCubit>()
                                                          .todayHabit[index],
                                                    );
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
                                                    .todayHabit[index]
                                                    .title!,
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
                                                    .todayHabit[index]
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AddHabitScreen()),
                );

              }
            },

            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        );
      },
    );
  }
}
