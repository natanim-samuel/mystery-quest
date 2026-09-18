import 'package:flutter/material.dart';

class XPBar extends StatelessWidget {
  final int xp;

  const XPBar({
    super.key,
    required this.xp,
  });

  int get level => (xp ~/ 100) + 1;

  int get currentLevelXp => xp % 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF7C5CFF).withOpacity(0.35),
            const Color(0xFF191D29),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB84D).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '⭐',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LEVEL $level',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFB84D),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '$xp total XP',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$currentLevelXp / 100',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: currentLevelXp / 100,
              minHeight: 9,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation(
                Color(0xFFFFB84D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}