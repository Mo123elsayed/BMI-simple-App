import 'package:first_app/features/BMI_calculation/presentation/ui_screens/intro_screen.dart';
import 'package:first_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_app/features/BMI_calculation/presentation/controllers/bmi_calc_cubit/cubit/bmi_calc_cubit.dart';

class ResultScreen extends StatefulWidget {
  // const ResultScreen({super.key});
  static const screenRoute = '/result-screen';

  final String? fullName;
  final String?
  age; // Assuming age is a string, you can change it to int if needed
  final double? height;
  final double? weight;

  const ResultScreen({super.key, 
    this.fullName,this.age,this.height,this.weight,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late double bmiResult;
  late String name;
  late String age;

  @override
  void initState() {
    bmiResult = context.read<BMiCalcCubit>().calculateBMI(
      height: widget.height!,
      weight: widget.weight!,
    );
    name = context.read<BMiCalcCubit>().getName(name: widget.fullName!);
    age = context.read<BMiCalcCubit>().getAge(age: widget.age!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BMI Result",
          style: TextStyle(
            color: AppColor.white,
            letterSpacing: 1.3,
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColor.white),
        ),
        backgroundColor: Color(0xFF7876CD),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            // left: 15.0,
            top: 45,
            bottom: 20,
          ),
          child: Column(
            children: [
              Container(
                height: 300,
                width: 350,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF7876CD),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              name,
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'A $age years old male',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  bmiResult.toStringAsFixed(2),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'BMI Calc',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        '${widget.height} cm',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Height',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        '${widget.weight} kg',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Weight',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/body.png',
                        // height: 280,
                        // width: 83.6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              buildContentMethod(
                color: Color(0xFF01502E),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8, top: 7),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Under Weight',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your BMI is less than 18.5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                        'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: TextStyle(
                          overflow: TextOverflow.fade,
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                // padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                margin: EdgeInsets.only(top: 15, left: 35, right: 35),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF484783),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(IntroScreen.screenRoute);
                  },
                  child: Text(
                    'Calculate BMI Again',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContentMethod({Widget? child, Color? color}) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 320,
      width: 350,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
