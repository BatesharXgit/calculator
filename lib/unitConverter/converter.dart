import 'package:flutter/material.dart';

class LengthConverterPage extends StatefulWidget {
  @override
  _LengthConverterPageState createState() => _LengthConverterPageState();
}

class _LengthConverterPageState extends State<LengthConverterPage> {
  double inputValue = 0.0;
  double outputValue = 0.0;

  String selectedInputUnit = 'Meters';
  String selectedOutputUnit = 'Feet';

  // Conversion factors for various length units as doubles
  Map<String, double> lengthUnits = {
    'Meters': 1.0,
    'Feet': 3.28084,
    'Inches': 39.3701,
    'Yards': 1.09361,
    'Kilometers': 0.001,
    'Miles': 0.000621371,
    'Centimeters': 100.0,
    'Millimeters': 1000.0,
  };

  void convertLength() {
    double inputFactor = lengthUnits[selectedInputUnit]!;
    double outputFactor = lengthUnits[selectedOutputUnit]!;
    setState(() {
      outputValue = inputValue * (outputFactor / inputFactor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Length Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Length'),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DropdownButton<String>(
                  value: selectedInputUnit,
                  onChanged: (value) {
                    setState(() {
                      selectedInputUnit = value!;
                    });
                  },
                  items: lengthUnits.keys.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
                Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: selectedOutputUnit,
                  onChanged: (value) {
                    setState(() {
                      selectedOutputUnit = value!;
                    });
                  },
                  items: lengthUnits.keys.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                convertLength();
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20.0),
            Text('Result: $outputValue $selectedOutputUnit'),
          ],
        ),
      ),
    );
  }
}