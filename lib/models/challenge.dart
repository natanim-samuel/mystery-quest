class Challenge {
  final String id;
  final String title;
  final String description;
  final String category;
  final String emoji;
  final int xp;
  final int difficulty;

  const Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.emoji,
    required this.xp,
    required this.difficulty,
  });
}