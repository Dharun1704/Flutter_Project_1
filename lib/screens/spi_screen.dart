import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SpiScreen extends StatefulWidget {
  const SpiScreen({Key key}) : super(key: key);

  @override
  _SpiScreenState createState() => _SpiScreenState();
}

class _SpiScreenState extends State<SpiScreen> {
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
      body: SpiBody(),
    );
  }
}

//
// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }
// class PageBG extends StatefulWidget {
//   _PageBGState createState() => _PageBGState();
// }
// class _PageBGState extends State<PageBG> {
//   String _now;
//   Timer _everySecond;
//   @override
//   void initState() {
//     super.initState();
//     _now = _timeToString(DateTime.now());
//     _everySecond = Timer.periodic(Duration(seconds: 5), (Timer t) {
//       if (!mounted) return;
//       setState(() {
//         _now = _timeToString(DateTime.now());
//       });
//     });
//   }
//   String _timeToString(DateTime now) {
//     String timeString =
//         "${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}";
//     return timeString;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       color: HexColor(_now),
//       duration: Duration(seconds: 5),
//       curve: Curves.decelerate,
//     );
//   }
// }

class SpiBody extends StatefulWidget {
  _SpiBodyState createState() => _SpiBodyState();
}

class _SpiBodyState extends State<SpiBody> {

  String _now, hr, min, sec;
  Timer _everySecond;
  TextEditingController spiController = new TextEditingController();
  double spiResult = 0;
  bool isAM = false;

  @override
  void initState() {
    super.initState();
    _now = _timeToString(DateTime.now());
    if(int.parse(_now.split(":")[0]) > 12) {
      int hrNum = (int.parse(_now.split(":")[0]) - 12);
      isAM = false;
      if(hrNum < 10) {
        hr = '0' + hrNum.toString();
      }
      else {
        hr = hrNum.toString();
        isAM = true;
      }
    }
    else
      hr = _now.split(":")[0];
    min = _now.split(":")[1];
    sec = _now.split(":")[2];
    spiResult = (_factorial(int.parse(hr))) / ((pow(int.parse(min), 3) + int.parse(sec))) ;
    spiController.text = spiResult.toString();
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (!mounted) return;
      setState(() {
        _now = _timeToString(DateTime.now());
        if(int.parse(_now.split(":")[0]) > 12) {
          int hrNum = (int.parse(_now.split(":")[0]) - 12);
          if(hrNum < 10) {
            hr = '0' + hrNum.toString();
          }
          else {
            hr = hrNum.toString();
          }
        }
        else
          hr = _now.split(":")[0];
        min = _now.split(":")[1];
        sec = _now.split(":")[2];
        spiResult = (_factorial(int.parse(hr))) / ((pow(int.parse(min), 3) + int.parse(sec))) ;
        spiController.text = spiResult.toString();
      });
    });
  }

  String _timeToString(DateTime now) {
    String timeString =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    return timeString;
  }

  int _factorial(int x) {
    int fact = 1;
    for(int i = 1; i <= x; i++)
      fact = fact * i;
    return fact;
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Text(
                  'SPI \nFACTOR',
                  style: TextStyle(
                      fontFamily: 'Volte',
                      fontSize: 30,
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
                        image: AssetImage('assets/images/spi.png')
                    ),
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      '$hr',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: 'Volte',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow
                      )
                    )
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontFamily: 'Volte',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow
                    ),
                  ),
                  Container(
                      child: Text(
                          '$min',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontFamily: 'Volte',
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow
                          )
                      )
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontFamily: 'Volte',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow
                    ),
                  ),
                  Container(
                      child: Text(
                          '$sec',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontFamily: 'Volte',
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow
                          )
                      )
                  ),
                  Text(
                    isAM ? 'am' : 'pm',
                    style: TextStyle(
                        fontFamily: 'Volte',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: size.width * 0.8,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'SPI Factor',
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
                  controller: spiController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}