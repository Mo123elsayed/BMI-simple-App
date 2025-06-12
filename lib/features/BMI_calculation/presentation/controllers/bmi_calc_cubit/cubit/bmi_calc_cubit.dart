import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bmi_calc_state.dart';

class BMiCalcCubit extends Cubit<BMiCalcState> {
  BMiCalcCubit() : super(BMiCalcInitial());
  double calculateBMI({
    required double height,
    required double weight,
  }) {
    double heightInMeters = height / 100; // Convert height from cm to meters
    final bmi = weight / (heightInMeters * heightInMeters);
    return bmi;
  }
}
