import 'package:flutter/material.dart';

import '../../models/mystery.dart';

class AccusationScreen extends StatefulWidget {
  final Mystery mystery;

  const AccusationScreen({
    super.key,
    required this.mystery,
  });

  @override
  State<AccusationScreen> createState() =>
      _AccusationScreenState();
}

class _AccusationScreenState
    extends State<AccusationScreen> {
  String? selectedSuspect;
  bool submitted = false;

  void submitAccusation() {
    if (selectedSuspect == null) return;

    setState(() {
      submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final correct =
        selectedSuspect == widget.mystery.correctSuspect;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Accusation'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            '⚖️ WHO DID IT?',
            style: TextStyle(
              color: Color(0xFFFFB84D),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Choose the person you believe stole the necklace.',
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 25),

          ...widget.mystery.suspects.map(
                (suspect) {
              final selected =
                  selectedSuspect == suspect.name;

              return GestureDetector(
                onTap: submitted
                    ? null
                    : () {
                  setState(() {
                    selectedSuspect = suspect.name;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xFFFFB84D)
                        .withOpacity(0.15)
                        : Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: selected
                          ? const Color(0xFFFFB84D)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        suspect.emoji,
                        style: const TextStyle(fontSize: 35),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        suspect.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      if (selected)
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFFFFB84D),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 15),

          if (!submitted)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFFFFB84D),
                  foregroundColor: Colors.black,
                ),
                onPressed: selectedSuspect == null
                    ? null
                    : submitAccusation,
                child: const Text(
                  'SUBMIT ACCUSATION',
                ),
              ),
            ),

          if (submitted)
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: correct
                    ? const Color(0xFF4ADE80)
                    .withOpacity(0.12)
                    : const Color(0xFFFF6B6B)
                    .withOpacity(0.12),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Text(
                    correct
                        ? '🎉 CASE SOLVED!'
                        : '❌ WRONG ACCUSATION',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: correct
                          ? const Color(0xFF4ADE80)
                          : const Color(0xFFFF6B6B),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.mystery.solution,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                            (route) => route.isFirst,
                      );
                    },
                    child: const Text('BACK TO QUEST'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}