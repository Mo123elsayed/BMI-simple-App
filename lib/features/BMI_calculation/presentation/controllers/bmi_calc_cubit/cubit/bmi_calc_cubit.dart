import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bmi_calc_state.dart';

class BMiCalcCubit extends Cubit<BMiCalcState> {
  BMiCalcCubit() : super(BMiCalcInitial());
  /// This method calculates the Body Mass Index (BMI) based on the provided height and weight.
  double calculateBMI({
    required double height,
    required double weight,
  }) {
    double heightInMeters = height / 100; // Convert height from cm to meters
    final bmi = weight / (heightInMeters * heightInMeters);
    return bmi;
  }

  String getName({required String name}) {
    /// This method returns a string containing the user's name and age.
    return name;
  }
  String getAge({required String age}) {
    /// This method returns a string containing the user's age.
    return age;
  }
}
