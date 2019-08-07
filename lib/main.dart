import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/bloc.dart';
import 'package:test_bloc/initPage.dart';
import 'package:test_bloc/resultPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Oxygen',
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        builder: (context) => BmiBloc(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BmiBloc, BmiState>(
      listener: (context, BmiState state) {
        if(state is InitialBmiState){
          if (state.hasError == true){
            final snackBar = SnackBar(content: Text('please fill text fields'));
            initPageScaffoldKey.currentState.showSnackBar(snackBar);
          } 
        }
      },
      child: BlocBuilder<BmiBloc, BmiState>(
        builder: (context, state) {
          if (state is InitialBmiState) {
            return InitPage();
          } else if (state is BmiResult) {
            return ResultPage(state: state);
          }
          return null;
        },
      ),
    );
  }
}
