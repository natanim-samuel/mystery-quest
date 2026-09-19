import 'package:flutter/material.dart';

import '../../models/adventure.dart';
import 'ending_screen.dart';

class StoryScreen extends StatefulWidget {
  final Adventure adventure;

  const StoryScreen({
    super.key,
    required this.adventure,
  });

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late StoryScene currentScene;

  @override
  void initState() {
    super.initState();

    currentScene = widget.adventure.scenes.first;
  }

  void choose(StoryChoice choice) {
    final nextScene = widget.adventure.scenes.firstWhere(
          (scene) => scene.id == choice.nextSceneId,
    );

    if (nextScene.isEnding) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => EndingScreen(
            scene: nextScene,
          ),
        ),
      );
      return;
    }

    setState(() {
      currentScene = nextScene;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.adventure.title),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: ListView(
          key: ValueKey(currentScene.id),
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Center(
                child: Text(
                  currentScene.emoji,
                  style: const TextStyle(fontSize: 90),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              currentScene.title,
              style: const TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              currentScene.description,
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 17,
                height: 1.7,
              ),
            ),

            const SizedBox(height: 35),

            const Text(
              'WHAT WILL YOU DO?',
              style: TextStyle(
                color: Color(0xFF4DA6FF),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 15),

            ...currentScene.choices.map(
                  (choice) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => choose(choice),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 17,
                        horizontal: 18,
                      ),
                      alignment: Alignment.centerLeft,
                      side: BorderSide(
                        color: const Color(0xFF4DA6FF)
                            .withOpacity(0.5),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      choice.text,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}