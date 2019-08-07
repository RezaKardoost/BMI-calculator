import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  @override
  BmiState get initialState => InitialBmiState(false);

  @override
  Stream<BmiState> mapEventToState(
    BmiEvent event,
  ) async* {
    if (event is ShowResult) {
      if (event.weight == null || event.height == null) {
        yield InitialBmiState(true);
      } else {
        double bmi = calculateBmi(weight: event.weight, hight: event.height);
        String bmiCategory = calculateBmiCategory(bmi: bmi);
        yield BmiResult(bmi, bmiCategory);
      }
    }
    if (event is CheckNewBMI) {
      yield InitialBmiState(false);
    }
  }

  double calculateBmi({double weight, double hight}) {
    return weight / (hight * hight);
  }

  String calculateBmiCategory({double bmi}) {
    if (bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'NORMAL';
    } else if (bmi >= 25 && bmi < 30) {
      return 'OVERWEIGHT';
    } else if (bmi >= 30 && bmi < 35) {
      return 'OBESE';
    } else {
      return 'EXTEREMELY OBESE';
    }
  }
}
