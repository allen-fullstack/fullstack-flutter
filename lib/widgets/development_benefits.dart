import 'package:flutter/material.dart';

class DevelopmentBenefits extends StatelessWidget {
  const DevelopmentBenefits({super.key});

  final List<Map<String, String>> _benefits = const [
    {
      'image': 'assets/images/benefit_1.png',
      'text':
          'Scale your development capacity without wasting time on finding reliable team',
    },
    {
      'image': 'assets/images/benefit_2.png',
      'text':
          'Our developers take ownership of their work on every project they join',
    },
    {
      'image': 'assets/images/benefit_3.png',
      'text':
          'We fund every developer\'s learning, growth and well-being to stay productive',
    },
    {
      'image': 'assets/images/benefit_4.png',
      'text': 'Cut down recruiting costs and operational overhead and headache',
    },
    {
      'image': 'assets/images/benefit_5.png',
      'text':
          'Proactive communication, consistently delivering detailed progress updates',
    },
    {
      'image': 'assets/images/benefit_6.png',
      'text': 'Your secret weapon, extended development team',
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
