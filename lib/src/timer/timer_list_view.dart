import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/timer/timer.dart';
import '../settings/settings_view.dart';
import 'pomotimer_details.dart'; // Importing the Pomodoro timer details view
import 'flowtimer_details.dart'; // Importing the Flowtime timer details view

class TimerListView extends StatelessWidget {
  const TimerListView({
    Key? key,
    this.items = const [
      Timer("Pomodoro"),
      Timer("Flowtime"), // Adding a Flowtime timer
    ],
  }) : super(key: key);

  static const routeName = '/';

  final List<Timer> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose A Mode',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.settings),
          //   onPressed: () {
          //     Navigator.restorablePushNamed(context, SettingsView.routeName);
          //   },
          // ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 200),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    if (item.name == 'Pomodoro') {
                      Navigator.restorablePushNamed(
                        context,
                        PomoDetailsView.routeName,
                      );
                    } else if (item.name == 'Flowtime') {
                      Navigator.restorablePushNamed(
                        context,
                        FlowDetailsView.routeName,
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 88, 22, 168),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Text(
                      '${item.name} Timer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
