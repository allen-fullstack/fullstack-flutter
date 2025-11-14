import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/sidebar.dart';
import '../widgets/service_card.dart';
import '../widgets/brands.dart';
import '../widgets/testimonials.dart';
import '../widgets/footer_cta.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Brand logos
  final List<String> _brandLogos = const [
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
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

  // Service cards data
  final List<Map<String, String>> _services = const [
    {
      'title': 'Development',
      'subtitle': 'Web & app development',
      'image': 'assets/images/development.png',
    },
    {
      'title': 'Design',
      'subtitle': 'Web & graphics design',
      'image': 'assets/images/design.png',
    },
    {
      'title': 'Support',
      'subtitle': 'Proactive maintenance',
      'image': 'assets/images/support.png',
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
              const SizedBox(height: 24),
              // Content starts below header
              const Text(
                'Fullstack Team as a Service',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Get immediate access to a battle‑tested team of designers '
                'and developers on a pay‑as‑you‑go monthly subscription.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
              const SizedBox(height: 60),
              // Service cards
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Column(
                    children: _services.map((service) {
                      return Column(
                        children: [
                          ServiceCard(
                            title: service['title']!,
                            subtitle: service['subtitle']!,
                            imagePath: service['image'],
                          ),
                          const SizedBox(height: 40),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              // Brands section
              Brands(brandLogos: _brandLogos),
              const SizedBox(height: 48),
              // Testimonials section
              Testimonials(testimonials: _testimonials),
              const SizedBox(height: 48),
              // Footer CTA section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FooterCta(
                  title: '7-day money-back guarantee',
                  description:
                      'We stand by our work. Love it or get your money back in 7 days.',
                  imagePath: 'assets/images/cta_homepage.png',
                  onCallPressed: () {
                    // TODO: Open Calendly or booking page
                  },
                  onChatPressed: () {
                    // TODO: Open chat or contact form
                  },
                ),
              ),
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
