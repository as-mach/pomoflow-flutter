import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'timer.dart';
import 'timer_details_view.dart';

/// Displays a list of Timers.
class TimerListView extends StatelessWidget {
  const TimerListView({
    super.key,
    this.items = const [Timer("Pomodoro")],
  });

  static const routeName = '/';

  final List<Timer> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Timers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'TimerListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          
          return ListTile(
            title: Text(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20),
                // fontFamily: 'Helvetica',
                // fontWeight: FontWeight.bold),
              '${item.name} Timer'),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage('assets/images/icons8-timer-64.png'),
            ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                TimerDetailsView.routeName,
              );
            }
          );
        },
      ),
    );
  }
}
