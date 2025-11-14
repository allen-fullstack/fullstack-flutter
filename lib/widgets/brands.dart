import 'package:flutter/material.dart';

class Brands extends StatelessWidget {
  final List<String> brandLogos;

  const Brands({super.key, required this.brandLogos});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Heading
        const Text(
          'Some of the brands we work with...',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // Brand logos grid
        Wrap(
          spacing: 24,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: brandLogos.asMap().entries.map((entry) {
            return Container(
              width: (MediaQuery.of(context).size.width - 72) / 2,
              height: 80,
              padding: const EdgeInsets.all(16),
              child: Image.asset(brandLogos[entry.key], fit: BoxFit.contain),
            );
          }).toList(),
        ),
      ],
    );
  }
}
