import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/about_page.dart';
import 'theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fullstack HQ',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomePage(),
        '/about': (ctx) => const AboutPage(),
      },
    );
  }
}
