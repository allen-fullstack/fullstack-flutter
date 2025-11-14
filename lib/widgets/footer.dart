import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int? _expandedIndex;

  final List<Map<String, dynamic>> _footerSections = [
    {
      'title': 'Services',
      'items': [
        'Graphic design',
        'Web development',
        'Mobile development',
        'WordPress support',
        'BigCommerce support',
        'Shopify support',
      ],
    },
    {
      'title': 'Company',
      'items': [
        'About Fullstack HQ',
        'Customer reviews',
        'Careers',
        'Legal',
        'Contact',
      ],
    },
    {
      'title': 'Partners',
      'items': [
        'Affiliate programs',
        'Whitelabel for Agencies',
        'Fullstack for Nonprofits',
      ],
    },
  ];

  void _toggleSection(int index) {
    setState(() {
      _expandedIndex = _expandedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Expandable sections
        ..._footerSections.asMap().entries.map((entry) {
          final int index = entry.key;
          final Map<String, dynamic> section = entry.value;
          final bool isExpanded = _expandedIndex == index;

          return Column(
            children: [
              InkWell(
                onTap: () => _toggleSection(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        section['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(Icons.keyboard_arrow_down, size: 20),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(maxHeight: isExpanded ? 500 : 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isExpanded)
                          ...(section['items'] as List<String>).map((item) {
                            return Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                left: 0,
                                bottom: 12,
                              ),
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            );
                          }).toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
        const SizedBox(height: 32),
        // Logo
        Image.asset(
          'assets/images/logo.png',
          height: 40,
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft,
        ),
        const SizedBox(height: 16),
        // Description
        const Text(
          'Your secret weapon, extended development team. Like hiring an in-house team of designers & developers - at a fraction of the cost.',
          style: TextStyle(fontSize: 14, height: 1.6, color: Colors.black87),
        ),
        const SizedBox(height: 24),
        // Social icons
        Row(
          children: [
            _buildSocialIcon(Icons.facebook, () {}),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.camera_alt, () {}), // Instagram
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.alternate_email, () {}), // Twitter
          ],
        ),
        const SizedBox(height: 32),
        // Partner logos (2 column)
        Row(
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/images/big_commerce.svg',
                height: 30,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: SvgPicture.asset(
                'assets/images/shopify.svg',
                height: 30,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Address
        Text(
          'Fullstack HQ Inc. is a company registered in Philippines with company no. CS201738408',
          style: TextStyle(fontSize: 12, color: Colors.grey[700], height: 1.6),
        ),
        const SizedBox(height: 8),
        Text(
          'Main Office: 468-B 2F & 3F Lead Bldg, Sto. Rosario St., Angeles City, Philippines 2009',
          style: TextStyle(fontSize: 12, color: Colors.grey[700], height: 1.6),
        ),
        const SizedBox(height: 4),
        Text(
          'Tarlac Branch: 4F MacArthur Highway, corner Don Marciano St., San Roque, Tarlac City, Philippines 2300',
          style: TextStyle(fontSize: 12, color: Colors.grey[700], height: 1.6),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon, size: 24, color: Colors.grey[800]),
    );
  }
}
