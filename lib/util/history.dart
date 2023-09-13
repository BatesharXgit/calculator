import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> historyList;

  HistoryPage({required this.historyList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation History'),
      ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(historyList[index]),
          );
        },
      ),
    );
  }
}
