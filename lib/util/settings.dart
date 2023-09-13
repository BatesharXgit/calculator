import 'package:calculator/util/aboutpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.background;
    Color primaryColor = Theme.of(context).colorScheme.primary;
    // Color secondaryColor = Theme.of(context).colorScheme.secondary;
    Color tertiaryColor = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: tertiaryColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(color: tertiaryColor),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: const Text('Version'),
                    subtitle: Text(
                      '1.0.0',
                      style: TextStyle(color: tertiaryColor),
                    ),
                  ),
                  ListTile(
                    title: const Text('About'),
                    leading: Icon(Icons.info_outline, color: tertiaryColor),
                    trailing: Icon(Icons.arrow_right, size: 28),
                    onTap: () {
                      Get.to(AboutPage());
                    },
                  ),
                  ListTile(
                    title: const Text('Privacy'),
                    leading:
                        Icon(Icons.privacy_tip_outlined, color: tertiaryColor),
                    trailing: Icon(Icons.arrow_right, size: 28),
                    onTap: () {
                      // Handle onTap action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
