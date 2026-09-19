import 'package:flutter/material.dart';

import '../../models/mystery.dart';
import 'accusation_screen.dart';

class MysteryDetailScreen extends StatelessWidget {
  final Mystery mystery;

  const MysteryDetailScreen({
    super.key,
    required this.mystery,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case Investigation'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _header(context),

          const SizedBox(height: 25),

          const Text(
            '👤 SUSPECTS',
            style: TextStyle(
              color: Color(0xFFFFB84D),
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 12),

          ...mystery.suspects.map(
                (suspect) => _suspectCard(context, suspect),
          ),

          const SizedBox(height: 25),

          const Text(
            '🔍 EVIDENCE',
            style: TextStyle(
              color: Color(0xFFFFB84D),
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 12),

          ...mystery.evidence.map(
                (evidence) => _evidenceCard(context, evidence),
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB84D),
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AccusationScreen(
                      mystery: mystery,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.gavel),
              label: const Text('MAKE YOUR ACCUSATION'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CASE #001',
            style: TextStyle(
              color: Color(0xFFFFB84D),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            mystery.title,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            mystery.description,
            style: TextStyle(
              color: Colors.grey.shade400,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            '📍 ${mystery.location}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _suspectCard(
      BuildContext context,
      Suspect suspect,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        leading: Text(
          suspect.emoji,
          style: const TextStyle(fontSize: 30),
        ),
        title: Text(
          suspect.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(suspect.description),
        childrenPadding: const EdgeInsets.fromLTRB(
          20,
          0,
          20,
          18,
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '"${suspect.statement}"',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _evidenceCard(
      BuildContext context,
      Evidence evidence,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Text(
          evidence.emoji,
          style: const TextStyle(fontSize: 28),
        ),
        title: Text(
          evidence.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            evidence.description,
          ),
        ),
      ),
    );
  }
}