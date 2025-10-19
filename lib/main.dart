import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habit_tracker/view/page/home_screen.dart';
import 'package:habit_tracker/view/page/splash_screen.dart';
import 'controller/habit_cubit.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        return BlocProvider(
          create: (context) => HabitCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "oswald",
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          ),
        );
  }
}

