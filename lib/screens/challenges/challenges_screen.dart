import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/challenges.dart';
import '../../models/challenge.dart';
import 'challenge_detail_screen.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Fitness',
    'Creativity',
    'Social',
    'Learning',
    'Adventure',
    'Self-improvement',
  ];

  Challenge getRandomChallenge() {
    final filtered = selectedCategory == 'All'
        ? challenges
        : challenges
        .where((c) => c.category == selectedCategory)
        .toList();

    return filtered[Random().nextInt(filtered.length)];
  }

  @override
  Widget build(BuildContext context) {
    final filtered = selectedCategory == 'All'
        ? challenges
        : challenges
        .where((c) => c.category == selectedCategory)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🪄 Challenges'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 55,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final selected = category == selectedCategory;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: selected,
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  final challenge = getRandomChallenge();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChallengeDetailScreen(
                        challenge: challenge,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.casino),
                label: const Text('SURPRISE ME'),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final challenge = filtered[index];

                return _challengeCard(challenge);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _challengeCard(Challenge challenge) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChallengeDetailScreen(
                challenge: challenge,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    challenge.emoji,
                    style: const TextStyle(fontSize: 27),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      challenge.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      challenge.category,
                      style: const TextStyle(
                        color: Color(0xFF9B83FF),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '+${challenge.xp}',
                    style: const TextStyle(
                      color: Color(0xFFFFB84D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'XP',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}