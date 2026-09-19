import 'package:flutter/material.dart';

import '../../data/mysteries.dart';
import 'mystery_detail_screen.dart';

class MysteriesScreen extends StatelessWidget {
  const MysteriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🕵️ Mystery Cases'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _caseCard(context),
        ],
      ),
    );
  }

  Widget _caseCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MysteryDetailScreen(
              mystery: mainMystery,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xFFFFB84D).withOpacity(0.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  '💎',
                  style: TextStyle(fontSize: 45),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CASE #001',
                        style: TextStyle(
                          color: Color(0xFFFFB84D),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'The Missing Necklace',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              mainMystery.description,
              style: TextStyle(
                color: Colors.grey.shade400,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                _tag('👤 4 Suspects'),
                const SizedBox(width: 8),
                _tag('🔍 4 Evidence'),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB84D),
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MysteryDetailScreen(
                        mystery: mainMystery,
                      ),
                    ),
                  );
                },
                child: const Text('INVESTIGATE CASE'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}