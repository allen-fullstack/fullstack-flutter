import 'package:flutter/material.dart';

class CallButtons extends StatelessWidget {
  const CallButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              /* Action */
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text('Book a call', style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              /*Action */
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text('Chat with us', style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ],
    );
  }
}
