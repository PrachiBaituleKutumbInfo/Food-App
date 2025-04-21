import 'package:flutter/material.dart';

class CancelDialog extends StatelessWidget {
  const CancelDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: const Text(
        'Are You Sure you want to Cancel this order?',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('No', style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            // TODO: Implement cancel logic here
          },
          child: const Text('Yes', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
