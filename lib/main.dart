import 'package:first_app/features/BMI_calculation/presentation/controllers/bmi_calc_cubit/cubit/bmi_calc_cubit.dart';
import 'package:first_app/features/BMI_calculation/presentation/ui_screens/result_screen.dart';
import 'package:first_app/features/BMI_calculation/presentation/ui_screens/static_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'features/BMI_calculation/presentation/ui_screens/intro_screen.dart';

void main() {
  runApp(BlocProvider(create: (context) => BMiCalcCubit(), child: FirstApp()));
}

/// we use context to access the widget tree
/// and to get the current state of the widget
class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (ctx) => IntroScreen(),
        StaticLoginScreen.screenRoute: (context) => StaticLoginScreen(),
        ResultScreen.screenRoute: (context) => BlocProvider(
          create: (context) => BMiCalcCubit(),
          child: ResultScreen(),
        ),
      },
    );
  }
}
