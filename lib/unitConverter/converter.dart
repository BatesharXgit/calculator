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

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        inputValue = double.tryParse(inputController.text) ?? 0.0;
        convertLength();
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void convertLength() {
    double inputFactor = lengthUnits[selectedInputUnit]!;
    double outputFactor = lengthUnits[selectedOutputUnit]!;
    setState(() {
      outputValue = inputValue * (outputFactor / inputFactor);
      outputValue = double.parse(outputValue.toStringAsFixed(4));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Length Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Length',
                border: OutlineInputBorder(), // Add border to text field
              ),
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
                      convertLength();
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
                      convertLength();
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
            Text(
              'Result: $outputValue $selectedOutputUnit',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
