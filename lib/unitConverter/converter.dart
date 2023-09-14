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
        iconTheme: IconThemeData(color: tertiaryColor),
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
  };

  List<Map<String, String>> areaUnitsWithAbbreviations = [
    {'name': 'Square Kilometers', 'abbreviation': 'km²'},
    {'name': 'Square Meters', 'abbreviation': 'm²'},
    {'name': 'Square Miles', 'abbreviation': 'mi²'},
    {'name': 'Square Feet', 'abbreviation': 'ft²'},
    {'name': 'Square Inches', 'abbreviation': 'in²'},
    {'name': 'Square Yards', 'abbreviation': 'yd²'},
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
        iconTheme: IconThemeData(color: tertiaryColor),
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

class VolumeConverterPage extends StatefulWidget {
  @override
  _VolumeConverterPageState createState() => _VolumeConverterPageState();
}

class _VolumeConverterPageState extends State<VolumeConverterPage> {
  double inputValue = 0.0;
  double outputValue = 0.0;

  String selectedInputUnit = 'Cubic Meters';
  String selectedOutputUnit = 'Cubic Feet';

  Map<String, double> volumeUnits = {
    'Cubic Kilometers': 1.0,
    'Cubic Meters': 1000000000.0,
    'Cubic Miles': 0.239913,
    'Cubic Feet': 35314666.8,
    'Cubic Inches': 610237440000.0,
    // Add other volume units and conversion factors as needed
  };

  List<Map<String, String>> volumeUnitsWithAbbreviations = [
    {'name': 'Cubic Kilometers', 'abbreviation': 'km³'},
    {'name': 'Cubic Meters', 'abbreviation': 'm³'},
    {'name': 'Cubic Miles', 'abbreviation': 'mi³'},
    {'name': 'Cubic Feet', 'abbreviation': 'ft³'},
    {'name': 'Cubic Inches', 'abbreviation': 'in³'},
  ];

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        inputValue = double.tryParse(inputController.text) ?? 0.0;
        convertVolume();
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void convertVolume() {
    double inputFactor = volumeUnits[selectedInputUnit]!;
    double outputFactor = volumeUnits[selectedOutputUnit]!;
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
        iconTheme: IconThemeData(color: tertiaryColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Volume Conversion',
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
                            convertVolume();
                          });
                        },
                        items: volumeUnitsWithAbbreviations.map((unit) {
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
                            convertVolume();
                          });
                        },
                        items: volumeUnitsWithAbbreviations.map((unit) {
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
                labelText: 'Enter Volume',
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

class WeightConverterPage extends StatefulWidget {
  @override
  _WeightConverterPageState createState() => _WeightConverterPageState();
}

class _WeightConverterPageState extends State<WeightConverterPage> {
  double inputValue = 0.0;
  double outputValue = 0.0;

  String selectedInputUnit = 'Kilograms';
  String selectedOutputUnit = 'Pounds';

  Map<String, double> weightUnits = {
    'Kilograms': 1.0,
    'Grams': 1000.0,
    'Milligrams': 1000000.0,
    'Pounds': 2.20462,
    'Ounces': 35.274,
    // Add other weight units and conversion factors as needed
  };

  List<Map<String, String>> weightUnitsWithAbbreviations = [
    {'name': 'Kilograms', 'abbreviation': 'kg'},
    {'name': 'Grams', 'abbreviation': 'g'},
    {'name': 'Milligrams', 'abbreviation': 'mg'},
    {'name': 'Pounds', 'abbreviation': 'lb'},
    {'name': 'Ounces', 'abbreviation': 'oz'},
    // Add other weight units with abbreviations as needed
  ];

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        inputValue = double.tryParse(inputController.text) ?? 0.0;
        convertWeight();
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void convertWeight() {
    double inputFactor = weightUnits[selectedInputUnit]!;
    double outputFactor = weightUnits[selectedOutputUnit]!;
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
        iconTheme: IconThemeData(color: tertiaryColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Weight Conversion',
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
                            convertWeight();
                          });
                        },
                        items: weightUnitsWithAbbreviations.map((unit) {
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
                            convertWeight();
                          });
                        },
                        items: weightUnitsWithAbbreviations.map((unit) {
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
                labelText: 'Enter Weight',
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

class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  double inputValue = 0.0;
  double outputValue = 0.0;

  String selectedInputUnit = 'Celsius';
  String selectedOutputUnit = 'Fahrenheit';

  double convertTemperature(double value, String fromUnit, String toUnit) {
    // Define conversion factors for various temperature units
    final Map<String, double> temperatureFactors = {
      'Celsius': 1.0,
      'Fahrenheit': 1.8,
      'Kelvin': 1.0,
    };

    // Convert to a common base unit (Kelvin)
    final double baseValue = value + 273.15;
    final double kelvinValue = baseValue / temperatureFactors[fromUnit]!;

    // Convert from Kelvin to the target unit
    final double convertedValue = kelvinValue * temperatureFactors[toUnit]!;

    return convertedValue;
  }

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        inputValue = double.tryParse(inputController.text) ?? 0.0;
        convertTemperatureAndSetState();
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void convertTemperatureAndSetState() {
    outputValue =
        convertTemperature(inputValue, selectedInputUnit, selectedOutputUnit);
    outputValue = double.parse(outputValue.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.background;
    Color tertiaryColor = Theme.of(context).colorScheme.tertiary;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: tertiaryColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Temperature Conversion',
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
                            convertTemperatureAndSetState();
                          });
                        },
                        items: ['Celsius', 'Fahrenheit', 'Kelvin'].map((unit) {
                          return DropdownMenuItem<String>(
                            value: unit,
                            child: Text(unit),
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
                            convertTemperatureAndSetState();
                          });
                        },
                        items: ['Celsius', 'Fahrenheit', 'Kelvin'].map((unit) {
                          return DropdownMenuItem<String>(
                            value: unit,
                            child: Text(unit),
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
                labelText: 'Enter Temperature',
                fillColor: tertiaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpeedConverterPage extends StatefulWidget {
  @override
  _SpeedConverterPageState createState() => _SpeedConverterPageState();
}

class _SpeedConverterPageState extends State<SpeedConverterPage> {
  double inputValue = 0.0;
  double outputValue = 0.0;

  String selectedInputUnit = 'Meters per Second';
  String selectedOutputUnit = 'Kilometers per Hour';

  Map<String, double> speedUnits = {
    'Meters per Second': 1.0,
    'Kilometers per Hour': 3.6,
    'Miles per Hour': 2.23694,
    'Feet per Second': 3.28084,
    // Add other speed units and conversion factors as needed
  };

  List<Map<String, String>> speedUnitsWithAbbreviations = [
    {'name': 'Meters per Second', 'abbreviation': 'm/s'},
    {'name': 'Kilometers per Hour', 'abbreviation': 'km/h'},
    {'name': 'Miles per Hour', 'abbreviation': 'mi/h'},
    {'name': 'Feet per Second', 'abbreviation': 'ft/s'},
    // Add other speed units with abbreviations as needed
  ];

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        inputValue = double.tryParse(inputController.text) ?? 0.0;
        convertSpeed();
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void convertSpeed() {
    double inputFactor = speedUnits[selectedInputUnit]!;
    double outputFactor = speedUnits[selectedOutputUnit]!;
    setState(() {
      outputValue = inputValue * (outputFactor / inputFactor);
      outputValue = double.parse(outputValue.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.background;
    Color tertiaryColor = Theme.of(context).colorScheme.tertiary;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: tertiaryColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Speed Conversion',
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
                            convertSpeed();
                          });
                        },
                        items: speedUnitsWithAbbreviations.map((unit) {
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
                            convertSpeed();
                          });
                        },
                        items: speedUnitsWithAbbreviations.map((unit) {
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
                labelText: 'Enter Speed',
                fillColor: tertiaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PressureConverterPage extends StatefulWidget {
  @override
  _PressureConverterPageState createState() => _PressureConverterPageState();
}

class _PressureConverterPageState extends State<PressureConverterPage> {
  double inputValue = 0.0;
  double outputValue = 0.0;

  String selectedInputUnit = 'Pascals';
  String selectedOutputUnit = 'Pounds per Square Inch';

  Map<String, double> pressureUnits = {
    'Pascals': 1.0,
    'Kilopascals': 0.001,
    'Bars': 0.00001,
    'Pounds per Square Inch': 0.00014503773773375,
    'Millimeters of Mercury': 0.00750062,
    // Add other pressure units and conversion factors as needed
  };

  List<Map<String, String>> pressureUnitsWithAbbreviations = [
    {'name': 'Pascals', 'abbreviation': 'Pa'},
    {'name': 'Kilopascals', 'abbreviation': 'kPa'},
    {'name': 'Bars', 'abbreviation': 'bar'},
    {'name': 'Pounds per Square Inch', 'abbreviation': 'psi'},
    {'name': 'Millimeters of Mercury', 'abbreviation': 'mmHg'},
    // Add other pressure units with abbreviations as needed
  ];

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        inputValue = double.tryParse(inputController.text) ?? 0.0;
        convertPressure();
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void convertPressure() {
    double inputFactor = pressureUnits[selectedInputUnit]!;
    double outputFactor = pressureUnits[selectedOutputUnit]!;
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
        iconTheme: IconThemeData(color: tertiaryColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Pressure Conversion',
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
                            convertPressure();
                          });
                        },
                        items: pressureUnitsWithAbbreviations.map((unit) {
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
                            convertPressure();
                          });
                        },
                        items: pressureUnitsWithAbbreviations.map((unit) {
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
                labelText: 'Enter Pressure',
                fillColor: tertiaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PowerConverterPage extends StatefulWidget {
  @override
  _PowerConverterPageState createState() => _PowerConverterPageState();
}

class _PowerConverterPageState extends State<PowerConverterPage> {
  double inputValue = 0.0;
  double outputValue = 0.0;

  String selectedInputUnit = 'Watts';
  String selectedOutputUnit = 'Horsepower';

  Map<String, double> powerUnits = {
    'Watts': 1.0,
    'Kilowatts': 0.001,
    'Horsepower': 0.00134102,
    'Megawatts': 0.000001,
    'Foot-Pounds per Second': 737.562,
    // Add other power units and conversion factors as needed
  };

  List<Map<String, String>> powerUnitsWithAbbreviations = [
    {'name': 'Watts', 'abbreviation': 'W'},
    {'name': 'Kilowatts', 'abbreviation': 'kW'},
    {'name': 'Horsepower', 'abbreviation': 'hp'},
    {'name': 'Megawatts', 'abbreviation': 'MW'},
    {'name': 'Foot-Pounds per Second', 'abbreviation': 'ft-lb/s'},
    // Add other power units with abbreviations as needed
  ];

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        inputValue = double.tryParse(inputController.text) ?? 0.0;
        convertPower();
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void convertPower() {
    double inputFactor = powerUnits[selectedInputUnit]!;
    double outputFactor = powerUnits[selectedOutputUnit]!;
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
        iconTheme: IconThemeData(color: tertiaryColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Power Conversion',
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
                            convertPower();
                          });
                        },
                        items: powerUnitsWithAbbreviations.map((unit) {
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
                            convertPower();
                          });
                        },
                        items: powerUnitsWithAbbreviations.map((unit) {
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
                labelText: 'Enter Power',
                fillColor: tertiaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StorageConverterPage extends StatefulWidget {
  @override
  _StorageConverterPageState createState() => _StorageConverterPageState();
}

class _StorageConverterPageState extends State<StorageConverterPage> {
  double inputValue = 0.0;
  double outputValue = 0.0;

  String selectedInputUnit = 'Bytes';
  String selectedOutputUnit = 'Megabytes';

  Map<String, double> storageUnits = {
    'Bits': 0.125,
    'Bytes': 1.0,
    'Kilobits': 0.000125,
    'Kilobytes': 0.001,
    'Megabits': 0.000001,
    'Megabytes': 0.000000125,
    'Gigabits': 0.000000001,
    'Gigabytes': 0.000000000125,
    'Terabits': 0.000000000001,
    'Terabytes': 0.000000000000125,
    'Petabits': 0.000000000000001,
    'Petabytes': 0.000000000000000125,
    // Add more units as needed
  };

  List<Map<String, String>> storageUnitsWithAbbreviations = [
    {'name': 'Bits', 'abbreviation': 'b'},
    {'name': 'Bytes', 'abbreviation': 'B'},
    {'name': 'Kilobits', 'abbreviation': 'Kb'},
    {'name': 'Kilobytes', 'abbreviation': 'KB'},
    {'name': 'Megabits', 'abbreviation': 'Mb'},
    {'name': 'Megabytes', 'abbreviation': 'MB'},
    {'name': 'Gigabits', 'abbreviation': 'Gb'},
    {'name': 'Gigabytes', 'abbreviation': 'GB'},
    {'name': 'Terabits', 'abbreviation': 'Tb'},
    {'name': 'Terabytes', 'abbreviation': 'TB'},
    {'name': 'Petabits', 'abbreviation': 'Pb'},
    {'name': 'Petabytes', 'abbreviation': 'PB'},
    // Add more units as needed
  ];

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        inputValue = double.tryParse(inputController.text) ?? 0.0;
        convertStorage();
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void convertStorage() {
    double inputFactor = storageUnits[selectedInputUnit]!;
    double outputFactor = storageUnits[selectedOutputUnit]!;
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
        iconTheme: IconThemeData(color: tertiaryColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Storage Conversion',
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
                            convertStorage();
                          });
                        },
                        items: storageUnitsWithAbbreviations.map((unit) {
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
                            convertStorage();
                          });
                        },
                        items: storageUnitsWithAbbreviations.map((unit) {
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
                labelText: 'Enter Storage',
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

class AgeCalculatorPage extends StatefulWidget {
  @override
  _AgeCalculatorPageState createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  DateTime? birthdate;
  String age = 'Age:';

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        // Parse the input date and calculate age
        String inputDate = inputController.text;
        if (inputDate.isNotEmpty) {
          List<String> dateParts = inputDate.split('/');
          if (dateParts.length == 3) {
            int day = int.tryParse(dateParts[0]) ?? 0;
            int month = int.tryParse(dateParts[1]) ?? 0;
            int year = int.tryParse(dateParts[2]) ?? 0;

            birthdate = DateTime(year, month, day);
            if (birthdate != null) {
              // Calculate age
              DateTime now = DateTime.now();
              int ageYears = now.year - birthdate!.year;
              int ageMonths = now.month - birthdate!.month;
              int ageDays = now.day - birthdate!.day;

              if (ageDays < 0) {
                ageMonths--;
                ageDays += 30; // Assuming 30 days in a month
              }
              if (ageMonths < 0) {
                ageYears--;
                ageMonths += 12;
              }

              age = 'Age: $ageYears years $ageMonths months $ageDays days';
            } else {
              age = 'Invalid date';
            }
          } else {
            age = 'Invalid date format';
          }
        } else {
          age = 'Age:';
        }
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.background;
    Color tertiaryColor = Theme.of(context).colorScheme.tertiary;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: tertiaryColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Age Calculator',
          style: TextStyle(color: tertiaryColor),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              age,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: tertiaryColor,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: inputController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Enter Birthdate (DD/MM/YYYY)',
                fillColor: tertiaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscountCalculatorPage extends StatefulWidget {
  @override
  _DiscountCalculatorPageState createState() => _DiscountCalculatorPageState();
}

class _DiscountCalculatorPageState extends State<DiscountCalculatorPage> {
  double originalPrice = 0.0;
  double discountPercentage = 0.0;
  double discountedPrice = 0.0;

  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    priceController.addListener(calculateDiscount);
    discountController.addListener(calculateDiscount);
  }

  @override
  void dispose() {
    priceController.dispose();
    discountController.dispose();
    super.dispose();
  }

  void calculateDiscount() {
    double price = double.tryParse(priceController.text) ?? 0.0;
    double discount = double.tryParse(discountController.text) ?? 0.0;

    setState(() {
      originalPrice = price;
      discountPercentage = discount;
      discountedPrice = price - (price * discount / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.background;
    Color tertiaryColor = Theme.of(context).colorScheme.tertiary;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: tertiaryColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Discount Calculator',
          style: TextStyle(color: tertiaryColor),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Original Price: \$${originalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: tertiaryColor,
              ),
            ),
            Text(
              'Discount Percentage: ${discountPercentage.toStringAsFixed(2)}%',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: tertiaryColor,
              ),
            ),
            Text(
              'Discounted Price: ',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: tertiaryColor,
              ),
            ),
            Text(
              '\$${discountedPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Highlighted color
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Original Price',
                fillColor: tertiaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: discountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Discount Percentage',
                fillColor: tertiaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
