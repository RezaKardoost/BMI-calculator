import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'bloc/bloc.dart';

class ResultPage extends StatelessWidget {
  final BmiState state;
  final NumberFormat f = NumberFormat(".##");
  ResultPage({this.state,Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<BmiBloc>(context).dispatch(CheckNewBMI());
        return Future.value(false);
      },
      child:Scaffold(
        appBar: AppBar(
          title: Text('Result'),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
            BlocProvider.of<BmiBloc>(context).dispatch(CheckNewBMI());
          },),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'your BMI: ${f.format((state as BmiResult).bmi)}',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 15,),
              Text(
                (state as BmiResult).bmiCategory,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      )
    );
  }
}
