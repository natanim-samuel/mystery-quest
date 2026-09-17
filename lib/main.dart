import 'package:flutter/material.dart';

import 'screens/main_navigation.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MysteryQuestApp());
}

class MysteryQuestApp extends StatelessWidget {
  const MysteryQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mystery Quest',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainNavigation(),
    );
  }
}