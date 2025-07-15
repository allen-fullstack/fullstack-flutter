import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      body: SafeArea(
        child: Padding(
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
            ],
          ),
        ),
      ),
    );
  }
}
