import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({Key key}) : super(key: key);

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {

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
      body: PracticeBody(),
    );
  }
}

class PracticeBody extends StatefulWidget {
  const PracticeBody({Key key}) : super(key: key);

  @override
  _PracticeBodyState createState() => _PracticeBodyState();
}

class _PracticeBodyState extends State<PracticeBody> {

  TextEditingController practiceController1 = new TextEditingController();
  TextEditingController practiceController2 = new TextEditingController();
  TextEditingController practiceControllerRes = new TextEditingController();

  bool isWrong = false, isResult = false;

  Color getColor() {
    if(!isResult) {
      return Colors.grey[900];
    }
    else {
      if (isWrong)
        return Colors.red[800];
      else
        return Colors.green[800];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: getColor(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Text(
                  'LORRENTZ FACTOR - PRACTICE',
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
                height: 30,
              ),
              Container(
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/lorrentzformula.png')
                    ),
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: size.width*0.8,
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
                    controller: practiceController1,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: size.width*0.8,
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
                      labelText: 'Lorrentz Factor',
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
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                      decimal: true
                    ),
                    controller: practiceController2,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if(practiceController1.text.isNotEmpty && practiceController2.text.isNotEmpty) {
                          int v = int.parse(practiceController1.text);
                          double lf = double.parse(practiceController2.text);
                          if(v > 300000000)
                            practiceControllerRes.text = 'Velocity cant be greater than speed of light';
                          else{
                            if(lf == (1/ sqrt(1- pow(v.toDouble()/300000000, 2)))) {
                              practiceControllerRes.text = 'Correct Answer';
                              isWrong = false;
                              isResult = true;
                            }
                            else{
                              HapticFeedback.heavyImpact();
                              Fluttertoast.showToast(msg: 'Wrong Answer');
                              double answer =(1/ sqrt(1- pow(v.toDouble()/300000000, 2)));
                              practiceControllerRes.text = 'Answer: $answer \n';
                              isWrong = true;
                              isResult = true;
                            }
                          }
                        }
                        else{
                          Fluttertoast.showToast(msg: 'Invalid Inputs');
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
                  Spacer(),
                  Visibility(
                    visible: (isResult) ? true : false,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            practiceControllerRes.clear();
                            practiceController2.clear();
                            practiceController1.clear();
                            isResult = false;
                            isWrong = false;
                          });
                        },
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(Colors.yellow),
                            backgroundColor: MaterialStateProperty.all(Colors.yellow)
                        ),
                        child: Text(
                          'RESET',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Volte',
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: size.width * 0.8,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Result',
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
                  controller: practiceControllerRes,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

