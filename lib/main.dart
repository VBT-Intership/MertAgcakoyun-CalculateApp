//Developed by Mert AGCAKOYUN - 08.2020

import 'package:calc_app/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Simple Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var result = '';
  var symbol = '';
  bool isEqualBtnPressed = false;
  double number1 = 0.0, number2 = 0.0;
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(21),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      result,
                      style: TextStyle(fontSize: 60, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      //RESET PROCESS (C)

                      if (index == 0) {
                        return Buttons(
                          buttonClicked: () {
                            setState(() {
                              result = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueGrey[300]
                              : Colors.white,
                        );
                      }
                      //OPERATOR PROCESS (+ , - , / , x )
                      else if (index == 15 ||
                          index == 11 ||
                          index == 7 ||
                          index == 3) {
                        return Buttons(
                          buttonClicked: () {
                            setState(() {
                              number1 = double.parse(result);
                              result = '';
                              symbol = buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueGrey[300]
                              : Colors.white,
                        );
                      }
                      //EQUAL PROCESS
                      else if (index == 19) {
                        return Buttons(
                          buttonClicked: () {
                            setState(() {
                              number2 = double.parse(result);
                              result = mathLib(number1, number2, symbol);
                              isEqualBtnPressed = true;
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueGrey[300]
                              : Colors.white,
                        );
                      }
                      //PRESSING BUTTON PROCESS (1, .. ,9 )
                      else {
                        return Buttons(
                          buttonClicked: () {
                            setState(() {
                              result += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueGrey[300]
                              : Colors.white,
                        );
                      }
                    }),
              ))
        ],
      ),
    );
  }

  //Choosing operator with symbol
  String mathLib(double num1, double num2, var symbol) {
    double result = 0.0;
    switch (symbol) {
      case ('+'):
        {
          result = num1 + num2;
        }
        break;
    }
    switch (symbol) {
      case ('-'):
        {
          result = num1 - num2;
        }
        break;
    }
    switch (symbol) {
      case ('x'):
        {
          result = num1 * num2;
        }
        break;
    }
    switch (symbol) {
      case ('/'):
        {
          result = num1 / num2;
        }
        break;
    }

    return ((result % 1 == 0) ? result.round().toString() : result.toString());
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }
}
