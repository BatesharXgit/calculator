import 'package:calculator/unitConverter/converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitConverterPage extends StatefulWidget {
  const UnitConverterPage({Key? key}) : super(key: key);

  @override
  _UnitConverterPageState createState() => _UnitConverterPageState();
}

class _UnitConverterPageState extends State<UnitConverterPage> {
  List<String> _units = [
    'Currency',
    'Length',
    'Area',
    'Volume',
    'Weight',
    'Temperature',
    'Speed',
    'Pressure',
    'Power'
  ];

  List<IconData> _icons = [
    Icons.currency_exchange_outlined,
    Icons.rule,
    Icons.aspect_ratio,
    Icons.volume_up_outlined,
    Icons.airplanemode_active,
    Icons.thermostat_outlined,
    Icons.speed,
    Icons.compress,
    Icons.flash_on,
  ];

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.background;
    Color primaryColor = Theme.of(context).colorScheme.primary;
    // Color secondaryColor = Theme.of(context).colorScheme.secondary;
    Color tertiaryColor = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Unit Converter',
          style: TextStyle(color: tertiaryColor),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: _units.length,
          itemBuilder: (BuildContext context, int index) {
            final unitName = _units[index];
            final unitIcon = _icons[index];

            return GestureDetector(
              onTap: () {
                _navigateToCategoryPage(unitName);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  Positioned(
                    top: 38,
                    child: Icon(
                      unitIcon,
                      color: tertiaryColor,
                      size: 35,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Text(
                      unitName,
                      style: TextStyle(color: tertiaryColor),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToCategoryPage(String unitName) {
    switch (unitName) {
      case 'Currency':
        Get.to(() => AreaConverterPage(), transition: Transition.native);
        break;
      case 'Length':
        Get.to(() => LengthConverterPage(), transition: Transition.native);
        break;
      case 'Area':
        Get.to(() => AreaConverterPage(), transition: Transition.native);
        break;
      case 'Volume':
        Get.to(() => VolumeConverterPage(), transition: Transition.native);
        break;
      case 'Weight':
        Get.to(() => WeightConverterPage(), transition: Transition.native);
        break;
      case 'Temperature':
        Get.to(() => TemperatureConverterPage(), transition: Transition.native);
        break;
      case 'Speed':
        Get.to(() => SpeedConverterPage(), transition: Transition.native);
        break;
      case 'Pressure':
        Get.to(() => PressureConverterPage(), transition: Transition.native);
        break;
      case 'Power':
        Get.to(() => AreaConverterPage(), transition: Transition.native);
        break;
      default:
        break;
    }
  }
}
