import 'package:flutter/material.dart';

/// Displays detailed information about a Notif.
class NotifDetailsView extends StatelessWidget {
  const NotifDetailsView({super.key});

  static const routeName = '/notif_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: const Center(
        child: Text('WIP Notification Customization'),
      ),
    );
  }
}
