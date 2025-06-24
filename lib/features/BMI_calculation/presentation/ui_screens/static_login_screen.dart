import 'package:first_app/features/BMI_calculation/presentation/ui_screens/result_screen.dart';
import 'package:flutter/material.dart';

class StaticLoginScreen extends StatefulWidget {
  // const StaticLoginScreen({super.key});
  static const screenRoute = '/login';

  const StaticLoginScreen({super.key});

  @override
  State<StaticLoginScreen> createState() => _StaticLoginScreenState();
}

class _StaticLoginScreenState extends State<StaticLoginScreen> {
  /// Controllers for the input fields
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();


  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String selectedGender = '';
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 100),
              buildFormField(
                labelText: 'Name',
                icon: Icon(Icons.person, color: Colors.black),
                controller: nameController,
              ),
              SizedBox(height: 25),
              buildFormField(
                labelText: 'Age',
                icon: Icon(Icons.calendar_today, color: Colors.black),
                controller: ageController,
                // input: TextInputType.number,
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
              SizedBox(height: 25),
              buildRangeButton("Your Height (cm)", heightController),
              SizedBox(height: 25),
              buildRangeButton("Your Weight (kg)", weightController),
              // SizedBox(height: 25),
              // Spacer(),
              Container(
                margin: EdgeInsets.only(top: 35, left: 35, right: 35),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF484783),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            fullName: nameController.text,
                            age: ageController.text,
                            height: double.parse(heightController.text),
                            weight: double.parse(weightController.text),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // SizedBox(height: 3),
            ],
          ),
        ),
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
          border: Border.all(
            color: selectedGender == value
                ? Colors.deepPurple
                : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: image,
        ),
      ),
    );
  }

  /// method to return form fields
  Widget buildFormField({
    String? labelText,
    Widget? icon,
    TextEditingController? controller,
    // TextInputType? input,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),

      /// using TextFormField to create a form field
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter valid value';
          }
          return null;
          // return null;
        },
        // controller: labelText,
        // keyboardType: input!,
        decoration: InputDecoration(
          label: Text(
            '$labelText',
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
          labelStyle: TextStyle(color: Colors.grey[700], fontSize: 16),
          floatingLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
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

  /// method to return range buttons for height and weight
  /// using TextEditingController to manage the text input
  Widget buildRangeButton(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Color(0xF0EAEAFE),
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  'Please enter a valid value';
                }
                final num = int.tryParse(value!);
                if (num == null || num <= 0) {
                  'Please enter a positive number';
                }
                return null;
              },
              textAlign: TextAlign.center,
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
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
                prefixIcon: GestureDetector(
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      int currentValue = int.parse(controller.text);
                      currentValue -= 1;
                      controller.text = currentValue.toString();
                    }
                  },
                  child: Icon(Icons.remove),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    int currentValue = int.parse(controller.text);
                    currentValue += 1;
                    controller.text = currentValue.toString();
                  },
                  child: Icon(Icons.add),
                ),
              ),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
