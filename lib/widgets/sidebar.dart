import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/logo.png', width: 180, height: 48),
                  IconButton(
                    icon: const Icon(Icons.close, size: 28),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Menu items
            ListTile(
              title: const Text('Services & Pricing'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                /* navigate */
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/about'),
            ),
            ListTile(
              title: const Text('Chat with us'),
              onTap: () {
                /* open chat */
              },
            ),

            const Spacer(),

            // Bottom CTA
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  /* book a call */
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text('Book a call'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
