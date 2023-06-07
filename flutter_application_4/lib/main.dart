import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kichik kalkulyator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArithmeticPage(),
    );
  }
}

class ArithmeticPage extends StatefulWidget {
  @override
  _ArithmeticPageState createState() => _ArithmeticPageState();
}

class _ArithmeticPageState extends State<ArithmeticPage> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  String resultText = '';

  void calculate() {
    double firstNumber = double.parse(firstNumberController.text);
    double secondNumber = double.parse(secondNumberController.text);
    String operator = operatorController.text;

    double result;

    if (operator == '+') {
      result = firstNumber + secondNumber;
    } else if (operator == '-') {
      result = firstNumber - secondNumber;
    } else if (operator == '*') {
      result = firstNumber * secondNumber;
    } else if (operator == '/') {
      if (secondNumber != 0){
        result = firstNumber / secondNumber;
      } else {
        resultText = 'Sonni nolga bo\'lib bo\'lmaydi';
        return;
      }

    } else {
      resultText = 'Noto\'g\'ri amal!';
      return;
    }

    resultText = 'Javob: $result';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kichik kalkulyator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Birinchi sonni kiriting',
              ),
            ),
            TextField(
              controller: secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ikkinchi sonni kiriting',
              ),
            ),
            TextField(
              controller: operatorController,
              decoration: InputDecoration(
                labelText: 'Amalni kiriting (+, -, *, /)',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  calculate();
                });
              },
              child: Text('Hisoblash'),
            ),
            SizedBox(height: 20),
            Text(
              resultText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}