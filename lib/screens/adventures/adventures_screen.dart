import 'package:flutter/material.dart';

import '../../data/adventures.dart';
import 'story_screen.dart';

class AdventuresScreen extends StatelessWidget {
  const AdventuresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🧙 Adventures'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StoryScreen(
                    adventure: darkForestAdventure,
                  ),
                ),
              );
            },
            child: Container(
              height: 360,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color:
                  const Color(0xFF4DA6FF).withOpacity(0.3),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '🌲',
                    style: TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'THE DARK FOREST',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      darkForestAdventure.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StoryScreen(
                            adventure: darkForestAdventure,
                          ),
                        ),
                      );
                    },
                    child: const Text('BEGIN ADVENTURE'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}