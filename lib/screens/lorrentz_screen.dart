import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:induction_21_task1/screens/practice_screen.dart';

class LorrentzScreen extends StatelessWidget {
  const LorrentzScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'Scientify',
        ),
        titleTextStyle: TextStyle(
          fontFamily: 'Volte',
          color: Colors.white,
        ),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  bool isInvalid = false;
  bool isGreater = false;
  int inputVal = 0;
  double ans = 0;
  TextEditingController lorrentzController = new TextEditingController();
  TextEditingController lorrentzAnsController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Text(
                  'LORRENTZ FACTOR',
                  style: TextStyle(
                    fontFamily: 'Volte',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 10,
                    color: Colors.yellowAccent
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/lorrentzformula.png')
                  ),
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.yellow,
                    primaryColorDark: Colors.yellowAccent,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Velocity',
                      labelStyle: TextStyle(
                        fontFamily: 'Volte',
                        color: Colors.yellow
                      ),
                      enabledBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.yellow)),
                      focusedBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.yellow)),
                    ),
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'Volte'
                    ),
                    keyboardType: TextInputType.number,
                    controller: lorrentzController,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(lorrentzController.text.isNotEmpty) {
                        inputVal = int.parse(lorrentzController.text);
                        if(inputVal > (300000000)) {
                          ans = 0;
                          isGreater = true;
                          lorrentzAnsController.text = 'Velocity cant be greater than speed of light';
                        }
                        else {
                          ans = (1/ sqrt(1- pow(inputVal.toDouble()/300000000, 2)));
                          lorrentzAnsController.text = ans.toString();
                          isInvalid = false;
                          isGreater = false;
                        }
                      }
                      else {
                        isInvalid = true;
                        Fluttertoast.showToast(msg: 'Invalid Input');
                      }
                    });
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.yellow),
                    backgroundColor: MaterialStateProperty.all(Colors.yellow)
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Volte',
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: size.width * 0.8,
                child: TextField(
                  readOnly: true,
                  decoration: (!isGreater || !isInvalid) ? InputDecoration(
                    labelText: 'Lorrentz Factor',
                    labelStyle: TextStyle(
                        fontFamily: 'Volte',
                        color: Colors.yellow
                    ),
                    enabledBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.yellow)),
                    focusedBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.yellow)),
                  ) : InputDecoration(
                    labelText: 'Error',
                    labelStyle: TextStyle(
                        fontFamily: 'Volte',
                        color: Colors.yellow
                    ),
                    enabledBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.yellow)),
                    focusedBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.yellow)),
                  ),
                  cursorColor: Colors.yellow,
                  style: TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'Volte'
                  ),
                  keyboardType: TextInputType.number,
                  controller: lorrentzAnsController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

