import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BmiEvent extends Equatable {
  BmiEvent([List props = const []]) : super(props);
}

class ShowResult extends BmiEvent{
  final double weight;
  final double height;
  
  ShowResult(this.height,this.weight):super([height,weight]);
}
class CheckNewBMI extends BmiEvent{}
