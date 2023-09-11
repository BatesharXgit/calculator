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
        title: Text('Length Conversion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$outputValue $selectedOutputUnit',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<String>(
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
                    style: TextStyle(color: Colors.white),
                    underline: Container(),
                  ),
                ),
                Icon(Icons.arrow_downward, color: Colors.grey),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<String>(
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
                    style:
                        TextStyle(color: Colors.white), // Customize text color
                    underline: Container(), // Remove default underline
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Length',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AreaConverterPage extends StatefulWidget {
  @override
  _AreaConverterPageState createState() => _AreaConverterPageState();
}

class _AreaConverterPageState extends State<AreaConverterPage> {
  double inputValue = 0.0;
  double outputValue = 0.0;

  String selectedInputUnit = 'Square Meters';
  String selectedOutputUnit = 'Square Feet';

  Map<String, double> areaUnits = {
    'Square Meters': 1.0,
    'Square Feet': 10.7639,
    'Square Inches': 1550.0,
    'Square Yards': 1.19599,
    'Square Kilometers': 0.0001,
    'Square Miles': 3.861e-8,
    'Square Centimeters': 10000.0,
    'Square Millimeters': 1000000.0,
  };

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        inputValue = double.tryParse(inputController.text) ?? 0.0;
        convertArea();
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void convertArea() {
    double inputFactor = areaUnits[selectedInputUnit]!;
    double outputFactor = areaUnits[selectedOutputUnit]!;
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
        title: Text('Area Conversion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$outputValue $selectedOutputUnit',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<String>(
                    value: selectedInputUnit,
                    onChanged: (value) {
                      setState(() {
                        selectedInputUnit = value!;
                        convertArea();
                      });
                    },
                    items: areaUnits.keys.map((unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    style: TextStyle(color: Colors.white),
                    underline: Container(),
                  ),
                ),
                Icon(Icons.arrow_downward, color: Colors.grey),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<String>(
                    value: selectedOutputUnit,
                    onChanged: (value) {
                      setState(() {
                        selectedOutputUnit = value!;
                        convertArea();
                      });
                    },
                    items: areaUnits.keys.map((unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    style: TextStyle(color: Colors.white),
                    underline: Container(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Area',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
