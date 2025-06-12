part of 'bmi_calc_cubit.dart';

sealed class BMiCalcState extends Equatable {
  const BMiCalcState();

  @override
  List<Object> get props => [];
}

final class BMiCalcInitial extends BMiCalcState {}
