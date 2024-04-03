import 'package:flutter/material.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Episode'),
      ),
      body: const Center(
        child: Text('Episode'),
      ),
    );
  }
}
