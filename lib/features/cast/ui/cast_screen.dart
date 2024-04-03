import 'package:flutter/material.dart';

class CastScreen extends StatelessWidget {
  const CastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cast'),
      ),
      body: const Center(
        child: Text('Cast'),
      ),
    );
  }
}
