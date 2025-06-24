import 'package:first_app/features/BMI_calculation/presentation/ui_screens/static_login_screen.dart';
import 'package:flutter/material.dart';

/// This screen is the introduction screen for the app.
class IntroScreen extends StatelessWidget {
  /// The route name for the intro screen
  static const screenRoute = '/intro';

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// This method builds the intro screen UI.
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 100),
              Container(
                // height: ,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 43, 43, 43),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    // SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
                      width: double.infinity,
                      // height: 40,
                      child: Text(
                        'Know Your body Better,',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                      width: double.infinity,
                      // height: 40,
                      child: Text(
                        'Get your BMI, Score in less\nThan a Minute.',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 35),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                      width: double.infinity,
                      // height: 40,
                      child: Text(
                        'it takes just 30 seconds - and your health is worth it!',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 20,
                      width: 350,
                      child: Divider(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(2),
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
                          ).pushReplacementNamed(StaticLoginScreen.screenRoute);
                        },
                        child: Text(
                          'Get Start',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.11,
            child: Container(
              decoration: BoxDecoration(),
              child: Image.asset(
                'assets/images/BMI_image.png',
                width: 400,
                height: 450,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
