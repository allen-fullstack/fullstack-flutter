import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/call_buttons.dart';
import '../widgets/sidebar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final ScrollController _ctrl = ScrollController();
  bool _showHeader = true;
  double _lastOffset = 0;

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _ctrl.offset;
    if (offset > _lastOffset && offset > 0 && _showHeader) {
      setState(() => _showHeader = false);
    } else if (offset < _lastOffset && !_showHeader) {
      setState(() => _showHeader = true);
    }
    _lastOffset = offset;
  }

  @override
  void dispose() {
    _ctrl
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      body: SafeArea(
        child: Column(
          children: [
            // Clipped, animated header with correct context
            ClipRect(
              child: SizedBox(
                height: 60,
                child: AnimatedSlide(
                  offset: _showHeader ? Offset.zero : const Offset(0, -1),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Builder(
                    builder: (innerCtx) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: AppHeader(
                          onLogoPressed: () =>
                              Navigator.of(innerCtx).pushReplacementNamed('/'),
                          onMenuPressed: () =>
                              Scaffold.of(innerCtx).openDrawer(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Scrollable content
            Expanded(
              child: ListView(
                controller: _ctrl,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                children: [
                  const SizedBox(height: 32),
                  const Center(
                    child: Text(
                      'The smarter way to\noutsource web\ndevelopment projects',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const CallButtons(),
                  const SizedBox(height: 32),
                  Center(
                    child: Image.asset(
                      'assets/images/bootstraps.png',
                      width: 350,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'About Fullstack HQ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Fullstack HQ is a web development outsource company where 100% '
                    'of the work is done in‑house. We partner with world‑class entrepreneurs, '
                    'design studios, tech companies, marketing agencies and startups helping '
                    'them to increase efficiency & reduce development costs.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
