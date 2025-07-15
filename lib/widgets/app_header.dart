import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final VoidCallback onLogoPressed;
  final VoidCallback onMenuPressed;

  const AppHeader({
    super.key,
    required this.onLogoPressed,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // tappable logo
        GestureDetector(
          onTap: onLogoPressed,
          child: Image.asset('assets/images/logo.png', width: 180, height: 48),
        ),

        IconButton(
          onPressed: onMenuPressed,
          icon: const Icon(Icons.menu, size: 38),
        ),
      ],
    );
  }
}
