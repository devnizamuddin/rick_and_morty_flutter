import 'package:flutter/material.dart';

import 'button.dart';

class ListHeaderRow extends StatelessWidget {
  const ListHeaderRow({
    super.key,
    required this.text,
    required this.onPressedViewAll,
  });
  final String text;
  final VoidCallback onPressedViewAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ViewAllButton(onPressedViewAll: onPressedViewAll)
      ],
    );
  }
}
