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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Unit Converter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
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
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Icon(
                      unitIcon,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Text(
                      unitName,
                      style: TextStyle(color: Colors.white),
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
        Get.to(() => AreaConverterPage(),
            transition: Transition.leftToRightWithFade);
        break;

      default:
        break;
    }
  }
}
