import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/sidebar.dart';
import '../widgets/development_benefits.dart';
import '../widgets/testimonials.dart';
import '../widgets/brands.dart';
import '../widgets/footer.dart';

class DevelopmentPage extends StatelessWidget {
  const DevelopmentPage({super.key});

  // Brand logos
  final List<String> _brandLogos = const [
    'assets/images/gatsby.svg',
    'assets/images/awwards.svg',
    'assets/images/css_design.svg',
    'assets/images/jamstack.svg',
    'assets/images/react_static.svg',
  ];

  // Testimonials data
  final List<Map<String, String>> _testimonials = const [
    {
      'quote':
          'Working with Fullstack HQ has been a game-changer for our business. Their team delivered exceptional results on time and within budget.',
      'name': 'Sarah Johnson',
      'position': 'CEO, TechStart Inc.',
    },
    {
      'quote':
          'The quality of work and attention to detail is outstanding. They transformed our vision into reality and exceeded all our expectations.',
      'name': 'Michael Chen',
      'position': 'Product Manager, InnovateCo',
    },
    {
      'quote':
          'Professional, reliable, and incredibly talented. Fullstack HQ has become an integral part of our development process.',
      'name': 'Emily Rodriguez',
      'position': 'CTO, Digital Solutions Ltd.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder: (innerCtx) {
                  return AppHeader(
                    onLogoPressed: () =>
                        Navigator.of(innerCtx).pushReplacementNamed('/'),
                    onMenuPressed: () => Scaffold.of(innerCtx).openDrawer(),
                  );
                },
              ),
              const SizedBox(height: 32),
              // Header section with content and CTA buttons
              const Center(
                child: Text(
                  'We\'ve helped some of the world-class entrepreneurs & tech companies increase efficiency & reduce development costs.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // CTA Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Open Calendly or booking page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Book a call',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: Open chat
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue[700],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.blue[700]!, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Chat with us',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              // Image below
              Center(
                child: Image.asset(
                  'assets/images/development_heading.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 48),
              // Partner benefits section
              const DevelopmentBenefits(),
              const SizedBox(height: 48),
              // Testimonials section
              Testimonials(testimonials: _testimonials),
              const SizedBox(height: 48),
              // Brands section
              Brands(brandLogos: _brandLogos),
              const SizedBox(height: 48),
              // Footer
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
