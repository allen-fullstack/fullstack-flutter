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
                  const SizedBox(height: 48),

                  // Image Section 1
                  Container(
                    constraints: const BoxConstraints(minHeight: 400),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(Icons.image, size: 80, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Text Section 1
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
                  const SizedBox(height: 48),

                  // Image Section 2
                  Container(
                    constraints: const BoxConstraints(minHeight: 400),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(Icons.image, size: 80, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Text Section 2
                  const Text(
                    'Award-Winning Company',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Our company has been awarded an "Honorable mention" from Awwwards and three awards from CSSDesignAwards. Those awards being Best UI Design, UX Design and Innovation. We\'re also featured on Gatsby, React Static and JAMstack official websites.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 48),

                  // Image Section 3
                  Container(
                    constraints: const BoxConstraints(minHeight: 400),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(Icons.image, size: 80, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Text Section 3
                  const Text(
                    'Agile Team Organization',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'We aren\'t one of those \'expert\' outsourcing companies that try to do everything. We specialize in one thing – and do it really well, full stack development. Fullstack HQ brings agile development teams with difficult-to-find expertise to execute faster and more cost effectively than traditional methods.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 48),

                  // Image Section 4
                  Container(
                    constraints: const BoxConstraints(minHeight: 400),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(Icons.image, size: 80, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Text Section 4
                  const Text(
                    'We\'re connected to the digital community',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'We can frequently be found speaking at the industry events as well as hosting various educational tours and workshops in our office.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
