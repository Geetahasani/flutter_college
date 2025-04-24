import 'package:flutter/material.dart';


class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = '';
  String _result = '';

  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
      } else if (value == '=') {
        try {
          _result = _calculate(_input).toStringAsFixed(2);
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _input += value;
      }
    });
  }

  double _calculate(String input) {
    List<String> tokens = [];
    String num = '';
    for (int i = 0; i < input.length; i++) {
      if ('+-*/'.contains(input[i])) {
        tokens.add(num);
        tokens.add(input[i]);
        num = '';
      } else {
        num += input[i];
      }
    }
    tokens.add(num);

    double res = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double next = double.parse(tokens[i + 1]);
      if (op == '+') res += next;
      else if (op == '-') res -= next;
      else if (op == '*') res *= next;
      else if (op == '/') res /= next;
    }

    return res;
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () => _buttonPressed(text),
      child: Text(text, style: TextStyle(fontSize: 24)),
      style: ElevatedButton.styleFrom(minimumSize: Size(70, 70)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(_input, style: TextStyle(fontSize: 28), textAlign: TextAlign.right),
            SizedBox(height: 10),
            Text(_result, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.right),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ...['7', '8', '9', '/'].map(_buildButton),
                ...['4', '5', '6', '*'].map(_buildButton),
                ...['1', '2', '3', '-'].map(_buildButton),
                _buildButton('0'),
                _buildButton('C'),
                _buildButton('='),
                _buildButton('+'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
