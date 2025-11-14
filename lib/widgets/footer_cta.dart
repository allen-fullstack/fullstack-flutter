import 'package:flutter/material.dart';

class FooterCta extends StatelessWidget {
  final String title;
  final String description;
  final String? imagePath;
  final VoidCallback? onCallPressed;
  final VoidCallback? onChatPressed;

  const FooterCta({
    super.key,
    required this.title,
    required this.description,
    this.imagePath,
    this.onCallPressed,
    this.onChatPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // Description
        Text(
          description,
          style: const TextStyle(fontSize: 16, height: 1.5),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        // Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onCallPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Book a call',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: onChatPressed,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(color: Colors.blue[700]!, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Chat with us',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Image
        if (imagePath != null)
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(imagePath!, fit: BoxFit.contain),
          ),
        if (imagePath == null)
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(Icons.image, size: 60, color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
