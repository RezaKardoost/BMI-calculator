import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

var initPageScaffoldKey = GlobalKey<ScaffoldState>();

class InitPage extends StatefulWidget {
  InitPage({Key key}) : super(key: key);

  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  TextEditingController weightController = new TextEditingController();
  TextEditingController hightController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: initPageScaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/bmi.png',
              width: 150,
            ),
            Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black12,
                child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        suffixText: 'kg',
                        border: InputBorder.none,
                        hintText: 'Weight')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black12,
                child: TextField(
                    controller: hightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        suffixText: 'm',
                        border: InputBorder.none,
                        hintText: 'Height')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CupertinoButton(
                child: Text('Calculate'),
                onPressed: () {
                  BlocProvider.of<BmiBloc>(context).dispatch(ShowResult(
                      hightController.value.text.trim()==''?null:double.parse(hightController.value.text),
                      weightController.value.text.trim()==''?null:double.parse(weightController.value.text)));
                },
                color: Color(0xFFF15A5C),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    hightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
