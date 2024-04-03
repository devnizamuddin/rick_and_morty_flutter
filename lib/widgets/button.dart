import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    super.key,
    required this.onPressedViewAll,
  });

  final VoidCallback onPressedViewAll;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 20)),
      onPressed: onPressedViewAll,
      child: const Text(
        'View All',
        style: TextStyle(color: Color(0xff191D29), fontWeight: FontWeight.bold),
      ),
    );
  }
}
