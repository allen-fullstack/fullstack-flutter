import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/sidebar.dart';
import '../widgets/brands.dart';
import '../widgets/design_benefits.dart';
import '../widgets/footer.dart';

class DesignPage extends StatelessWidget {
  const DesignPage({super.key});

  // Brand logos
  final List<String> _brandLogos = const [
    'assets/images/gatsby.svg',
    'assets/images/awwards.svg',
    'assets/images/css_design.svg',
    'assets/images/jamstack.svg',
    'assets/images/react_static.svg',
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
                  'Design at scale for ambitious brands',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Design subscription service for agencies, startups, and entrepreneurs.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, height: 1.5),
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
                  'assets/images/design_banner.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 48),
              // Brands section
              Brands(brandLogos: _brandLogos),
              const SizedBox(height: 48),
              // Design Benefits section
              const DesignBenefits(),
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
