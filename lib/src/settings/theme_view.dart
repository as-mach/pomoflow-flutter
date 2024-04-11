import 'package:flutter/material.dart';

/// Displays detailed information about a Theme.
class ThemeDetailsView extends StatelessWidget {
  const ThemeDetailsView({super.key});

  static const routeName = '/theme_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings'),
      ),
      body: const Center(
        child: Text('WIP Theme Customization'),
      ),
    );
  }
}
