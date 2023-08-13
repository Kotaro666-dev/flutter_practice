import 'package:flutter/material.dart';

class MultipleFloatingActionButtons extends StatelessWidget {
  const MultipleFloatingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            // TODO: Increment
          },
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
          ),
        ),
        const SizedBox(height: 20.0),
        FloatingActionButton(
          onPressed: () {
            // TODO: Decrement
          },
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(height: 20.0),
        FloatingActionButton(
          onPressed: () {
            // TODO: Reset
          },
          tooltip: 'Reset',
          child: const Text(
            "0",
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
        ),
      ],
    );
  }
}
