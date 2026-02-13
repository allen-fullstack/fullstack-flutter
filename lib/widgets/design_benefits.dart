import 'package:flutter/material.dart';

class DesignBenefits extends StatelessWidget {
  const DesignBenefits({super.key});

  final List<Map<String, String>> _benefits = const [
    {
      'image': 'assets/images/design_1.png',
      'text':
          'Web & mobile design',
    },
    {
      'image': 'assets/images/design_2.png',
      'text':
          'Social media, emails and ads graphics',
    },
    {
      'image': 'assets/images/design_3.png',
      'text':
          'Logos & branding',
    },
    {
      'image': 'assets/images/design_4.png',
      'text': 'Art & illustrations',
    },
    {
      'image': 'assets/images/design_5.png',
      'text':
          'Presentations, flyers, brochures and invitations',
    },
    {
      'image': 'assets/images/design_6.png',
      'text': 'Posters, billboards, banners any business graphics',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Our partner benefits',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        // Benefits in single column
        Column(
          children: _benefits.map((benefit) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  // Image holder
                  Container(
                    height: 120,
                    alignment: Alignment.center,
                    child: Image.asset(benefit['image']!, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 16),
                  // Text
                  Text(
                    benefit['text']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, height: 1.5),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
