import 'package:flutter/material.dart';

/// Displays detailed information about a Clock.
class ClockDetailsView extends StatelessWidget {
  const ClockDetailsView({super.key});

  static const routeName = '/clock_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock Settings'),
      ),
      body: const Center(
        child: Text('WIP Clock Customization'),
      ),
    );
  }
}
