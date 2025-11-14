import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/sidebar.dart';
import '../widgets/service_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  constraints: const BoxConstraints(maxWidth: 260),
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
            ],
          ),
        ),
      ),
    );
  }
}
