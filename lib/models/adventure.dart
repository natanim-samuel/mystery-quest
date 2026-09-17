class StoryChoice {
  final String text;
  final String nextSceneId;

  const StoryChoice({
    required this.text,
    required this.nextSceneId,
  });
}

class StoryScene {
  final String id;
  final String title;
  final String description;
  final String emoji;
  final List<StoryChoice> choices;
  final bool isEnding;
  final bool isGoodEnding;

  const StoryScene({
    required this.id,
    required this.title,
    required this.description,
    required this.emoji,
    required this.choices,
    this.isEnding = false,
    this.isGoodEnding = false,
  });
}

class Adventure {
  final String id;
  final String title;
  final String description;
  final String emoji;
  final List<StoryScene> scenes;

  const Adventure({
    required this.id,
    required this.title,
    required this.description,
    required this.emoji,
    required this.scenes,
  });
}