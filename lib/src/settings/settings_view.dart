// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'settings_controller.dart';
import 'sound_view.dart';
import 'notifications_view.dart';
import 'theme_view.dart';
import 'timer_view.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          ListTile(
              title: Text(
                style: TextStyle(
                  color: Colors.white,
                ),
                'Notifications'),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/icons8-alarm-64.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  NotifDetailsView.routeName,
                );
              }
            ),
            ListTile(
              title: Text(
                style: TextStyle(
                  color: Colors.white,
                ),            
                'Clock'),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/icons8-timer-64.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  ClockDetailsView.routeName,
                );
              }
            ),
            ListTile(
              title: Text(
                style: TextStyle(
                  color: Colors.white,
                ),
                'Theme'),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/icons8-theme-64.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  ThemeDetailsView.routeName,
                );
              }
            ),
            ListTile(
              title: Text(
                style: TextStyle(
                  color: Colors.white,
                ),
                'Sound'),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/icons8-volume-64.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  SoundDetailsView.routeName,
                );
              }
            )
        ],
      )
    );
  }
}
