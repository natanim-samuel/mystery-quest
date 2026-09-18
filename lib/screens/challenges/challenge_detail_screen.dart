import 'package:flutter/material.dart';

import '../../models/challenge.dart';

class ChallengeDetailScreen extends StatefulWidget {
  final Challenge challenge;
  final Function(int)? onCompleted;

  const ChallengeDetailScreen({
    super.key,
    required this.challenge,
    this.onCompleted,
  });

  @override
  State<ChallengeDetailScreen> createState() =>
      _ChallengeDetailScreenState();
}

class _ChallengeDetailScreenState
    extends State<ChallengeDetailScreen> {
  bool completed = false;
  bool favorite = false;

  void completeChallenge() {
    if (completed) return;

    setState(() {
      completed = true;
    });

    widget.onCompleted?.call(widget.challenge.xp);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('🎉 Challenge Complete!'),
          content: Text(
            '+${widget.challenge.xp} XP earned!',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Awesome!'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final challenge = widget.challenge;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenge'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                favorite = !favorite;
              });
            },
            icon: Icon(
              favorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: favorite ? Colors.red : null,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 40,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                children: [
                  Text(
                    challenge.emoji,
                    style: const TextStyle(fontSize: 70),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    challenge.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    challenge.category,
                    style: const TextStyle(
                      color: Color(0xFF9B83FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'YOUR MISSION',
                    style: TextStyle(
                      color: Color(0xFFFFB84D),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    challenge.description,
                    style: const TextStyle(
                      fontSize: 17,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _infoChip(
                        '⭐',
                        '${challenge.xp} XP',
                      ),
                      const SizedBox(width: 10),
                      _infoChip(
                        '🔥',
                        'Difficulty ${challenge.difficulty}',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: completed
                    ? null
                    : completeChallenge,
                child: Text(
                  completed
                      ? '✓ COMPLETED'
                      : 'COMPLETE CHALLENGE',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoChip(String emoji, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(emoji),
          const SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }
}