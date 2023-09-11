import 'package:flutter/material.dart';

class UnitConverterPage extends StatefulWidget {
  const UnitConverterPage({super.key});

  @override
  State<UnitConverterPage> createState() => _UnitConverterPageState();
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
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.currency_exchange_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 35,
                          child: Text(
                            "Currency",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Icon(
                          Icons.scale_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 30,
                          child: Text(
                            "Length",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Icon(
                          Icons.area_chart_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 35,
                          child: Text(
                            "Area",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Icon(
                          Icons.currency_exchange_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 35,
                          child: Text(
                            "Currency",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Icon(
                          Icons.scale_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 30,
                          child: Text(
                            "Length",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Icon(
                          Icons.area_chart_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 35,
                          child: Text(
                            "Area",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Icon(
                          Icons.currency_exchange_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 35,
                          child: Text(
                            "Currency",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Icon(
                          Icons.scale_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 30,
                          child: Text(
                            "Length",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Icon(
                          Icons.area_chart_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 35,
                          child: Text(
                            "Area",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
