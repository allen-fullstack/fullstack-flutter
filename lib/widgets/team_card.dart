import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final String name;
  final String position;
  final String? imagePath;
  final String? description;

  const TeamCard({
    super.key,
    required this.name,
    required this.position,
    this.imagePath,
    this.description,
  });

  void _showTeamMemberDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => _TeamMemberDetailScreen(
          name: name,
          position: position,
          imagePath: imagePath,
          description: description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showTeamMemberDetails(context),
      child: Column(
        children: [
          // Rounded image
          Container(
            constraints: const BoxConstraints(minHeight: 135),
            width: 135,
            height: 135,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(100),
            ),
            child: imagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(imagePath!, fit: BoxFit.cover),
                  )
                : const Center(
                    child: Icon(Icons.person, size: 60, color: Colors.grey),
                  ),
          ),
          const SizedBox(height: 12),
          // Name
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          // Position
          Text(
            position,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Fullscreen detail screen
class _TeamMemberDetailScreen extends StatelessWidget {
  final String name;
  final String position;
  final String? imagePath;
  final String? description;

  const _TeamMemberDetailScreen({
    required this.name,
    required this.position,
    this.imagePath,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Content - Fullscreen scrollable
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
              child: Column(
                children: [
                  // Rounded image
                  Container(
                    constraints: const BoxConstraints(minHeight: 200),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: imagePath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(imagePath!, fit: BoxFit.cover),
                          )
                        : const Center(
                            child: Icon(
                              Icons.person,
                              size: 100,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                  const SizedBox(height: 24),
                  // Name
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  // Position
                  Text(
                    position,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  // Description
                  Text(
                    description ?? 'No description provided',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          // Close button
          Positioned(
            top: 40,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.close, size: 28),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
