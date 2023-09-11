import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.background;
    Color primaryColor = Theme.of(context).colorScheme.primary;
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    Color tertiaryColor = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text("Settings"),
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
                  color: tertiaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: const Text('Version'),
                      subtitle: Text('1.0.0',
                          style: TextStyle(color: secondaryColor)),
                    ),
                    ListTile(
                      title: const Text('About'),
                      leading: Icon(Icons.info, color: primaryColor),
                      trailing: Icon(Icons.arrow_right, size: 28),
                      onTap: () {
                        // _showChangelogBottomSheet(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Privacy'),
                      leading:
                          Icon(Icons.privacy_tip_outlined, color: primaryColor),
                      trailing: Icon(Icons.arrow_right, size: 28),
                      onTap: () {
                        // Handle onTap action
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
