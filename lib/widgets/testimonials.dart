import 'package:flutter/material.dart';

class Testimonials extends StatelessWidget {
  final List<Map<String, String>> testimonials;

  const Testimonials({super.key, required this.testimonials});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Heading
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: const Text(
              'Loved by world-class entrepreneurs & tech companies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 32),
        // Testimonials list
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Column(
              children: testimonials.map((testimonial) {
                return Column(
                  children: [
                    _TestimonialCard(
                      quote: testimonial['quote']!,
                      name: testimonial['name']!,
                      position: testimonial['position']!,
                      imagePath: testimonial['image'],
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String quote;
  final String name;
  final String position;
  final String? imagePath;

  const _TestimonialCard({
    required this.quote,
    required this.name,
    required this.position,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quote
          Text('"$quote"', style: const TextStyle(fontSize: 14, height: 1.5)),
          const SizedBox(height: 16),
          // User info
          Row(
            children: [
              // Avatar
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: imagePath != null
                    ? ClipOval(
                        child: Image.asset(imagePath!, fit: BoxFit.cover),
                      )
                    : const Icon(Icons.person, size: 24, color: Colors.grey),
              ),
              const SizedBox(width: 12),
              // Name and position
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    position,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
