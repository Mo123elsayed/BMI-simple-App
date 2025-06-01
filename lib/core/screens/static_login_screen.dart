import 'package:flutter/material.dart';

class StaticLoginScreen extends StatelessWidget {
  // const StaticLoginScreen({super.key});
  static const screenRoute = '/login-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI",
            style: TextStyle(
              letterSpacing: 1.3,
              fontSize: 40,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
