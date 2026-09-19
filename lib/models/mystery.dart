class Suspect {
  final String name;
  final String emoji;
  final String description;
  final String statement;

  const Suspect({
    required this.name,
    required this.emoji,
    required this.description,
    required this.statement,
  });
}

class Evidence {
  final String title;
  final String description;
  final String emoji;

  const Evidence({
    required this.title,
    required this.description,
    required this.emoji,
  });
}

class Mystery {
  final String id;
  final String title;
  final String description;
  final String location;
  final String victim;
  final List<Suspect> suspects;
  final List<Evidence> evidence;
  final String correctSuspect;
  final String solution;

  const Mystery({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.victim,
    required this.suspects,
    required this.evidence,
    required this.correctSuspect,
    required this.solution,
  });
}