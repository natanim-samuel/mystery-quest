import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/challenges.dart';
import '../../screens/achievements/achievements_screen.dart';
import '../../screens/challenges/challenge_detail_screen.dart';
import '../../screens/mysteries/mysteries_screen.dart';
import '../../screens/adventures/adventures_screen.dart';
import '../../widgets/game_card.dart';
import '../../widgets/section_title.dart';
import '../../widgets/xp_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int xp = 120;
  int streak = 7;

  void generateChallenge() {
    final challenge = challenges[Random().nextInt(challenges.length)];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChallengeDetailScreen(
          challenge: challenge,
          onCompleted: (earnedXp) {
            setState(() {
              xp += earnedXp;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MYSTERY QUEST',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Welcome, Detective 👋',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AchievementsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.emoji_events_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            XPBar(xp: xp),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _smallStat(
                    '🔥',
                    '$streak days',
                    'Streak',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _smallStat(
                    '⭐',
                    '$xp XP',
                    'Experience',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF7C5CFF),
                    const Color(0xFF4B3A9E),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🎲 RANDOM CHALLENGE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Feeling adventurous?',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Let fate decide what you should do next.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: generateChallenge,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF4B3A9E),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'GENERATE CHALLENGE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const SectionTitle(title: 'Choose Your Quest'),

            const SizedBox(height: 14),

            GameCard(
              emoji: '🪄',
              title: 'Life Challenges',
              description: 'Do something unexpected today.',
              accentColor: const Color(0xFF7C5CFF),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChallengesScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            GameCard(
              emoji: '🕵️',
              title: 'Mystery Cases',
              description: 'Find clues and solve crimes.',
              accentColor: const Color(0xFFFFB84D),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MysteriesScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            GameCard(
              emoji: '🧙',
              title: 'Choose Your Adventure',
              description: 'Your decisions change the story.',
              accentColor: const Color(0xFF4DA6FF),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AdventuresScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _smallStat(
      String emoji,
      String value,
      String label,
      ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}