import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  final List<Map<String, dynamic>> achievements = const [
    {
      'emoji': '🎯',
      'title': 'First Mission',
      'description': 'Complete your first challenge.',
      'unlocked': true,
    },
    {
      'emoji': '🔥',
      'title': 'On Fire',
      'description': 'Reach a 7 day streak.',
      'unlocked': true,
    },
    {
      'emoji': '🕵️',
      'title': 'Sherlock',
      'description': 'Solve your first mystery.',
      'unlocked': false,
    },
    {
      'emoji': '🔍',
      'title': 'Evidence Collector',
      'description': 'Find 20 clues.',
      'unlocked': false,
    },
    {
      'emoji': '🧙',
      'title': 'Story Explorer',
      'description': 'Complete 5 adventures.',
      'unlocked': false,
    },
    {
      'emoji': '🎲',
      'title': 'Risk Taker',
      'description': 'Complete 10 random challenges.',
      'unlocked': false,
    },
    {
      'emoji': '⭐',
      'title': 'Rising Star',
      'description': 'Reach 500 XP.',
      'unlocked': false,
    },
    {
      'emoji': '🏆',
      'title': 'Master Detective',
      'description': 'Complete every type of quest.',
      'unlocked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🏆 Achievements'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          final achievement = achievements[index];
          final unlocked = achievement['unlocked'] as bool;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: unlocked
                    ? const Color(0xFFFFB84D)
                    .withOpacity(0.3)
                    : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: unlocked
                        ? const Color(0xFFFFB84D)
                        .withOpacity(0.15)
                        : Colors.white.withOpacity(0.04),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      unlocked ? achievement['emoji'] : '🔒',
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        achievement['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        achievement['description'],
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (unlocked)
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF4ADE80),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}