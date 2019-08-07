import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BmiState{}

class InitialBmiState extends BmiState {
  final bool hasError;
  InitialBmiState(this.hasError);
}

class BmiResult extends BmiState{
  final double bmi;
  final String bmiCategory;
  BmiResult(this.bmi,this.bmiCategory);
}
