import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:first_app/features/BMI_calculation/presentation/components/models/bmi_model.dart';
part 'bmi_calc_state.dart';

class BMiCalcCubit extends Cubit<BMiCalcState> {
  BMiCalcCubit() : super(BMiCalcInitial());

  /// This method calculates the Body Mass Index (BMI) based on the provided height and weight.
  double calculateBMI({required double height, required double weight}) {
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

  Future<void> getBmiData({
    required double height,
    required double weight,
  }) async {
    emit(BMiCalcLoading());

    try {
      var dio = Dio();

      dio.options.headers = {
        'x-api-key': '3e52e438-49d0-45af-a783-e92650495631',
      };

      final response = await dio.get(
        'https://api.apiverve.com/v1/bmicalculator',
        queryParameters: {'height': height, 'weight': weight, 'unit': 'metric'},
      );
      var data= jsonDecode(response.data.toString());
      print(response.data.runtimeType);
      final bmiModel = BmiModel.fromJson(data['data']);
      emit(BMiCalcSuccess(bmiModel));
      // return bmiModel;
    } on TypeError catch (e) {
      print('======================');
      print(e.stackTrace);
      print('======================');

      emit(BMiCalcFailure("Type Error: ${e.toString()}"));
    } catch (e) {
      emit(
        BMiCalcFailure(
          e is DioException ? e.message ?? "Dio Error" : e.toString(),
        ),
      );
    }
  }
}
