import 'package:flutter/material.dart';

import '../../models/adventure.dart';

class EndingScreen extends StatelessWidget {
  final StoryScene scene;

  const EndingScreen({
    super.key,
    required this.scene,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  scene.emoji,
                  style: const TextStyle(fontSize: 90),
                ),

                const SizedBox(height: 25),

                Text(
                  scene.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  scene.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 17,
                    height: 1.7,
                  ),
                ),

                const SizedBox(height: 35),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: scene.isGoodEnding
                        ? const Color(0xFF4ADE80)
                        .withOpacity(0.15)
                        : Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    scene.isGoodEnding
                        ? '🏆 MYSTERY SOLVED'
                        : '🌙 ADVENTURE COMPLETE',
                    style: TextStyle(
                      color: scene.isGoodEnding
                          ? const Color(0xFF4ADE80)
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                            (route) => route.isFirst,
                      );
                    },
                    child: const Text('RETURN TO QUEST'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}