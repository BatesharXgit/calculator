import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    'Kilometers': 1.0,
    'Meters': 1000.0,
    'Miles': 0.000621371,
    'Feet': 3.28084,
    'Inches': 39.3701,
    'Yards': 1.09361,
    'Decimeters': 10000.0,
    'Centimeters': 100000.0,
    'Millimeters': 1000000.0,
    'Micrometers': 1000000000.0,
    'Nanometers': 1000000000000.0,
    'Picometers': 1000000000000000.0,
    'Light Years': 1.057e-13,
    'Parsecs': 3.24078e-14,
    'Lunar Distances': 6.685e6,
    'Astronomical Units': 6.68459e-9,
  };

  List<Map<String, String>> lengthUnitsWithAbbreviations = [
    {'name': 'Kilometers', 'abbreviation': 'km'},
    {'name': 'Meters', 'abbreviation': 'm'},
    {'name': 'Miles', 'abbreviation': 'mi'},
    {'name': 'Feet', 'abbreviation': 'ft'},
    {'name': 'Inches', 'abbreviation': 'in'},
    {'name': 'Yards', 'abbreviation': 'yd'},
    {'name': 'Decimeters', 'abbreviation': 'dm'},
    {'name': 'Centimeters', 'abbreviation': 'cm'},
    {'name': 'Millimeters', 'abbreviation': 'mm'},
    {'name': 'Micrometers', 'abbreviation': 'µm'},
    {'name': 'Nanometers', 'abbreviation': 'nm'},
    {'name': 'Picometers', 'abbreviation': 'pm'},
    {'name': 'Light Years', 'abbreviation': 'ly'},
    {'name': 'Parsecs', 'abbreviation': 'pc'},
    {'name': 'Lunar Distances', 'abbreviation': 'LD'},
    {'name': 'Astronomical Units', 'abbreviation': 'AU'},
  ];

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
    Color backgroundColor = Theme.of(context).colorScheme.background;

    Color tertiaryColor = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Length Conversion',
          style: TextStyle(color: tertiaryColor),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$outputValue $selectedOutputUnit',
                style: GoogleFonts.rubik(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: tertiaryColor,
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
                      color: tertiaryColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      DropdownButton<String>(
                        value: selectedInputUnit,
                        onChanged: (value) {
                          setState(() {
                            selectedInputUnit = value!;
                            convertLength();
                          });
                        },
                        items: lengthUnitsWithAbbreviations.map((unit) {
                          return DropdownMenuItem<String>(
                            value: unit['name']!,
                            child: Text(
                                '${unit['name']} (${unit['abbreviation']})'),
                          );
                        }).toList(),
                        style: TextStyle(color: tertiaryColor),
                        underline: Container(),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_downward,
                  color: tertiaryColor,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: tertiaryColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      DropdownButton<String>(
                        value: selectedOutputUnit,
                        onChanged: (value) {
                          setState(() {
                            selectedOutputUnit = value!;
                            convertLength();
                          });
                        },
                        items: lengthUnitsWithAbbreviations.map((unit) {
                          return DropdownMenuItem<String>(
                            value: unit['name']!,
                            child: Text(
                                '${unit['name']} (${unit['abbreviation']})'),
                          );
                        }).toList(),
                        style: TextStyle(color: tertiaryColor),
                        underline: Container(),
                      ),
                    ],
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
                fillColor: tertiaryColor,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
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
    'Square Kilometers': 1.0,
    'Square Meters': 1000000.0,
    'Square Miles': 0.386102,
    'Square Feet': 10763910.4,
    'Square Inches': 1550003100.0,
    'Square Yards': 1195990.05,
    // Add other area units and conversion factors as needed
  };

  List<Map<String, String>> areaUnitsWithAbbreviations = [
    {'name': 'Square Kilometers', 'abbreviation': 'km²'},
    {'name': 'Square Meters', 'abbreviation': 'm²'},
    {'name': 'Square Miles', 'abbreviation': 'mi²'},
    {'name': 'Square Feet', 'abbreviation': 'ft²'},
    {'name': 'Square Inches', 'abbreviation': 'in²'},
    {'name': 'Square Yards', 'abbreviation': 'yd²'},
    // Add other area units with abbreviations as needed
  ];

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
    Color backgroundColor = Theme.of(context).colorScheme.background;

    Color tertiaryColor = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Area Conversion',
          style: TextStyle(color: tertiaryColor),
        ),
      ),
      backgroundColor: backgroundColor,
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
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: tertiaryColor,
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
                      color: tertiaryColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      DropdownButton<String>(
                        value: selectedInputUnit,
                        onChanged: (value) {
                          setState(() {
                            selectedInputUnit = value!;
                            convertArea();
                          });
                        },
                        items: areaUnitsWithAbbreviations.map((unit) {
                          return DropdownMenuItem<String>(
                            value: unit['name']!,
                            child: Text(
                                '${unit['name']} (${unit['abbreviation']})'),
                          );
                        }).toList(),
                        style: TextStyle(color: tertiaryColor),
                        underline: Container(),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_downward,
                  color: tertiaryColor,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: tertiaryColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      DropdownButton<String>(
                        value: selectedOutputUnit,
                        onChanged: (value) {
                          setState(() {
                            selectedOutputUnit = value!;
                            convertArea();
                          });
                        },
                        items: areaUnitsWithAbbreviations.map((unit) {
                          return DropdownMenuItem<String>(
                            value: unit['name']!,
                            child: Text(
                                '${unit['name']} (${unit['abbreviation']})'),
                          );
                        }).toList(),
                        style: TextStyle(color: tertiaryColor),
                        underline: Container(),
                      ),
                    ],
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
                fillColor: tertiaryColor,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
