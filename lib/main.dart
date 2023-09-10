import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _currentInput = '';
  double _result = 0;

  void _onNumberPressed(String number) {
    setState(() {
      if (_currentInput == '0') {
        _currentInput = number;
      } else {
        _currentInput += number;
      }
      _display = _currentInput;
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      if (_currentInput.isNotEmpty) {
        _result = double.parse(_currentInput);
        _currentInput = '';
        _display = operator; // Set the operator to the display
      }
    });
  }

  void _onEqualsPressed() {
    setState(() {
      if (_currentInput.isNotEmpty) {
        switch (_display) {
          case '+':
            _result += double.parse(_currentInput);
            break;
          case '-':
            _result -= double.parse(_currentInput);
            break;
          case '*':
            _result *= double.parse(_currentInput);
            break;
          case '/':
            _result /= double.parse(_currentInput);
            break;
          default:
            _result = double.parse(_currentInput);
        }
        _currentInput = '';
        _display = _result.toString();
      }
    });
  }

  void _onClearPressed() {
    setState(() {
      _display = '0';
      _currentInput = '';
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16.0),
              child: Text(
                _display,
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton('0'),
              _buildButton('C'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label) {
    return ElevatedButton(
      onPressed: () {
        if (label == '=') {
          _onEqualsPressed();
        } else if (label == 'C') {
          _onClearPressed();
        } else if (['+', '-', '*', '/'].contains(label)) {
          _onOperatorPressed(label);
        } else {
          _onNumberPressed(label);
        }
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
