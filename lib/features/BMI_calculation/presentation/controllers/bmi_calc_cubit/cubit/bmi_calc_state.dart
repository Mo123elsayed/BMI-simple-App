part of 'bmi_calc_cubit.dart';

sealed class BMiCalcState extends Equatable {
  const BMiCalcState();

  @override
  List<Object> get props => [];
}

final class BMiCalcInitial extends BMiCalcState {}

final class BMiCalcLoading extends BMiCalcState {}

final class BMiCalcSuccess extends BMiCalcState {
  final BmiModel bmiModel;
  const BMiCalcSuccess(this.bmiModel);
}

final class BMiCalcFailure extends BMiCalcState {
  final String messageError;
  const BMiCalcFailure(this.messageError);
  // BMiCalcFailure(this.error);
}
