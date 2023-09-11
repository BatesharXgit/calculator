import 'package:flutter/material.dart';

class IconTextStack extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextStack({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class UnitConverterPage extends StatefulWidget {
  const UnitConverterPage({Key? key}) : super(key: key);

  @override
  _UnitConverterPageState createState() => _UnitConverterPageState();
}

class _UnitConverterPageState extends State<UnitConverterPage> {
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
      body: SafeArea(
        child: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconTextStack(
                    icon: Icons.currency_exchange_outlined,
                    text: "Currency",
                  ),
                  IconTextStack(
                    icon: Icons.scale_outlined,
                    text: "Length",
                  ),
                  IconTextStack(
                    icon: Icons.area_chart_outlined,
                    text: "Area",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconTextStack(
                    icon: Icons.gif_box_outlined,
                    text: "Volume",
                  ),
                  IconTextStack(
                    icon: Icons.scale_outlined,
                    text: "Weight",
                  ),
                  IconTextStack(
                    icon: Icons.gas_meter_outlined,
                    text: "Temperature",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconTextStack(
                    icon: Icons.currency_exchange_outlined,
                    text: "Speed",
                  ),
                  IconTextStack(
                    icon: Icons.scale_outlined,
                    text: "Pressure",
                  ),
                  IconTextStack(
                    icon: Icons.area_chart_outlined,
                    text: "Power",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
