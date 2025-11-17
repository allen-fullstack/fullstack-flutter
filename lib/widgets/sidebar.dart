import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool _servicesExpanded = false;
  bool _companyExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/logo.png', width: 220, height: 60),
                  IconButton(
                    icon: const Icon(Icons.close, size: 32),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Scrollable menu items
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Services & Pricing with dropdown
                    ListTile(
                      title: const Text(
                        'Services & Pricing',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        _servicesExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 24,
                      ),
                      onTap: () {
                        setState(() {
                          _servicesExpanded = !_servicesExpanded;
                        });
                      },
                    ),
                    if (_servicesExpanded) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset(
                                'assets/images/development.png',
                                width: 48,
                                height: 48,
                              ),
                              title: const Text(
                                'Development',
                                style: TextStyle(fontSize: 16),
                              ),
                              subtitle: const Text(
                                'Web & app development',
                                style: TextStyle(fontSize: 14),
                              ),
                              onTap: () {
                                // TODO: Navigate to development
                              },
                            ),
                            ListTile(
                              leading: Image.asset(
                                'assets/images/design.png',
                                width: 48,
                                height: 48,
                              ),
                              title: const Text(
                                'Design',
                                style: TextStyle(fontSize: 16),
                              ),
                              subtitle: const Text(
                                'Web & graphics design',
                                style: TextStyle(fontSize: 14),
                              ),
                              onTap: () {
                                // TODO: Navigate to design
                              },
                            ),
                            ListTile(
                              leading: Image.asset(
                                'assets/images/support.png',
                                width: 48,
                                height: 48,
                              ),
                              title: const Text(
                                'Support',
                                style: TextStyle(fontSize: 16),
                              ),
                              subtitle: const Text(
                                'Proactive maintenance',
                                style: TextStyle(fontSize: 14),
                              ),
                              onTap: () {
                                // TODO: Navigate to support
                              },
                            ),
                          ],
                        ),
                      ),
                    ],

                    // Company with dropdown
                    ListTile(
                      title: const Text(
                        'Company',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        _companyExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 24,
                      ),
                      onTap: () {
                        setState(() {
                          _companyExpanded = !_companyExpanded;
                        });
                      },
                    ),
                    if (_companyExpanded) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text(
                                'About us',
                                style: TextStyle(fontSize: 16),
                              ),
                              onTap: () => Navigator.of(
                                context,
                              ).pushReplacementNamed('/about'),
                            ),
                            ListTile(
                              title: const Text(
                                'Customer service',
                                style: TextStyle(fontSize: 16),
                              ),
                              onTap: () {
                                // TODO: Navigate to customer service
                              },
                            ),
                            ListTile(
                              title: const Text(
                                'Careers',
                                style: TextStyle(fontSize: 16),
                              ),
                              onTap: () {
                                // TODO: Navigate to careers
                              },
                            ),
                            ListTile(
                              title: const Text(
                                'Contact us',
                                style: TextStyle(fontSize: 16),
                              ),
                              onTap: () {
                                // TODO: Navigate to contact us
                              },
                            ),
                          ],
                        ),
                      ),
                    ],

                    // Chat with us
                    ListTile(
                      title: const Text(
                        'Chat with us',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        // TODO: Open chat
                      },
                    ),

                    // Book a call button (right after chat with us)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Book a call
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Book a call',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
