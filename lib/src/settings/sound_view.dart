import 'package:flutter/material.dart';

/// Displays detailed information about a Sound.
class SoundDetailsView extends StatelessWidget {
  const SoundDetailsView({super.key});

  static const routeName = '/sound_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sound Settings'),
      ),
      body: const Center(
        child: Text('WIP Sound Customization'),
      ),
    );
  }
}
