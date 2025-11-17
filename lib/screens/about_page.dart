import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/call_buttons.dart';
import '../widgets/sidebar.dart';
import '../widgets/team_card.dart';
import '../widgets/testimonials.dart';
import '../widgets/footer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final ScrollController _ctrl = ScrollController();
  bool _showHeader = true;
  double _lastOffset = 0;

  // Content sections data
  final List<Map<String, String>> _sections = const [
    {
      'title': 'About Fullstack HQ',
      'description':
          'Fullstack HQ is a web development outsource company where 100% '
          'of the work is done in‑house. We partner with world‑class entrepreneurs, '
          'design studios, tech companies, marketing agencies and startups helping '
          'them to increase efficiency & reduce development costs.',
    },
    {
      'title': 'Award-Winning Company',
      'description':
          'Our company has been awarded an "Honorable mention" from Awwwards and three awards from CSSDesignAwards. Those awards being Best UI Design, UX Design and Innovation. We\'re also featured on Gatsby, React Static and JAMstack official websites.',
    },
    {
      'title': 'Agile Team Organization',
      'description':
          'We aren\'t one of those \'expert\' outsourcing companies that try to do everything. We specialize in one thing – and do it really well, full stack development. Fullstack HQ brings agile development teams with difficult-to-find expertise to execute faster and more cost effectively than traditional methods.',
    },
    {
      'title': 'We\'re connected to the digital community',
      'description':
          'We can frequently be found speaking at the industry events as well as hosting various educational tours and workshops in our office.',
    },
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

  // Team members data
  final List<Map<String, String>> _teamMembers = const [
    {
      'name': 'Chocho De Amponn',
      'position': 'Developer',
      'description':
          'Chocho is a skilled full-stack developer with over 8 years of experience in building scalable web applications. He specializes in React, Node.js, and Flutter development.\n\nHis passion for clean code and user-centric design has helped numerous clients achieve their business goals through innovative digital solutions.',
    },
    {
      'name': 'Nica Alipio',
      'position': 'Designer',
      'description':
          'Nica is a creative UI/UX designer who brings beautiful and intuitive interfaces to life. With a keen eye for detail and a deep understanding of user behavior, she crafts experiences that delight users.\n\nHer award-winning designs have been featured on multiple design platforms and have helped businesses increase their conversion rates significantly.',
    },
    {
      'name': 'Alnica Alipio',
      'position': 'Project Manager',
      'description':
          'Alnica is an experienced project manager who ensures every project is delivered on time and within budget. With excellent communication skills and a strategic mindset, she bridges the gap between clients and development teams.\n\nHer leadership and organizational skills have been instrumental in successfully delivering over 100 projects to satisfied clients worldwide.',
    },
    {
      'name': 'Berna Batumbakal',
      'position': 'Developer',
      'description':
          'Berna is a backend specialist with expertise in database architecture and API development. She has a strong background in Python, PostgreSQL, and cloud infrastructure.\n\nHer technical expertise and problem-solving abilities ensure that all applications are robust, secure, and perform optimally under any load.',
    },
  ];

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

                  // Map through sections to generate image + text blocks
                  ..._sections.map((section) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ImageSection(),
                        const SizedBox(height: 32),
                        _TextSection(
                          title: section['title']!,
                          description: section['description']!,
                        ),
                        const SizedBox(height: 48),
                      ],
                    );
                  }).toList(),

                  // Team Section
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Fullstack HQ Team',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Team cards in 2 columns
                  Wrap(
                    spacing: 24,
                    runSpacing: 32,
                    alignment: WrapAlignment.center,
                    children: _teamMembers.map((member) {
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width - 72) / 2,
                        child: TeamCard(
                          name: member['name']!,
                          position: member['position']!,
                          description: member['description'],
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 48),
                  // Testimonials section
                  Testimonials(testimonials: _testimonials),
                  const SizedBox(height: 32),
                  // Footer
                  const Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable image placeholder widget
class _ImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 400),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(Icons.image, size: 80, color: Colors.grey),
      ),
    );
  }
}

// Reusable text section widget
class _TextSection extends StatelessWidget {
  final String title;
  final String description;

  const _TextSection({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Text(description, style: const TextStyle(fontSize: 14, height: 1.5)),
      ],
    );
  }
}
