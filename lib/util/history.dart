import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatelessWidget {
  final Future<List<String>> historyListFuture;
  final Function() clearHistoryCallback;

  HistoryPage({
    required this.historyListFuture,
    required this.clearHistoryCallback,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColour = Theme.of(context).colorScheme.background;
    Color primaryColour = Theme.of(context).colorScheme.primary;
    Color tertiaryColour = Theme.of(context).colorScheme.tertiary;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: tertiaryColour),
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColour,
        title: Text(
          'Calculation History',
          style: TextStyle(color: tertiaryColour),
        ),
      ),
      backgroundColor: backgroundColour,
      body: Center(
        child: FutureBuilder<List<String>>(
          future: historyListFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final historyList = snapshot.data ?? [];
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: historyList.length,
                      itemBuilder: (context, index) {
                        final reversedIndex = historyList.length - 1 - index;
                        return ListTile(
                          title: Text(
                            historyList[reversedIndex],
                            style: GoogleFonts.rubik(color: tertiaryColour),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColour),
                    onPressed: () {
                      clearHistoryCallback();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Clear History',
                      style: GoogleFonts.rubik(color: tertiaryColour),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
