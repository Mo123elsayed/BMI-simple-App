import 'package:flutter/material.dart';

class StaticLoginScreen extends StatefulWidget {
  // const StaticLoginScreen({super.key});
  static const screenRoute = '/login-screen';

  const StaticLoginScreen({super.key});

  @override
  State<StaticLoginScreen> createState() => _StaticLoginScreenState();
}

class _StaticLoginScreenState extends State<StaticLoginScreen> {
  String selectedGender = '';
  String value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
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
        children: [
          SizedBox(height: 100),
          buildFormField(
            labelText: 'Name',
            icon: Icon(Icons.person, color: Colors.black),
          ),
          SizedBox(height: 25),
          buildFormField(
            labelText: 'Birth Date',
            icon: Icon(Icons.calendar_today, color: Colors.black),
          ),
          SizedBox(height: 25),
          Text(
            "Choose Gender",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  buildGenderImage(
                    image: Image.asset('assets/images/male.png'),
                    value: 'male',
                  ),
                  SizedBox(height: 10),
                  Text(
                    "male",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  buildGenderImage(
                    image: Image.asset('assets/images/female.png'),
                    value: 'female',
                  ),
                  SizedBox(height: 10),
                  Text(
                    "female",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// methods to retrun gender images and form fields
  Widget buildGenderImage({Widget? image, String? value}) {
    /// using GestureDetector to detect tap on the image
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = value!;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.deepPurple, width: 2.0),
        ),
        child: ClipRRect(borderRadius: BorderRadius.circular(10.0), child: image),
      ),
    );
  }

  /// method to return form fields
  Widget buildFormField({String? labelText, Widget? icon}) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),

      /// using TextFormField to create a form field
      child: TextFormField(
        decoration: InputDecoration(
          labelText: '${labelText}',
          labelStyle: TextStyle(color: Colors.grey[700], fontSize: 16),
          floatingLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: Color.fromRGBO(179, 178, 234, 0.15),
          contentPadding: EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 20.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: icon,
        ),
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
