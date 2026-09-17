import '../models/adventure.dart';

const Adventure darkForestAdventure = Adventure(
  id: 'adventure_001',
  title: 'The Dark Forest',
  description:
  'You enter a mysterious forest and discover that something ancient is waiting for you.',
  emoji: '🌲',
  scenes: [
    StoryScene(
      id: 'start',
      title: 'The Forest',
      description:
      'You stand at the entrance of a dark forest. The sun is disappearing behind the mountains. Somewhere inside, you hear a strange sound.',
      emoji: '🌲',
      choices: [
        StoryChoice(
          text: '🌲 Enter the forest',
          nextSceneId: 'forest',
        ),
        StoryChoice(
          text: '🏃 Run away',
          nextSceneId: 'run',
        ),
        StoryChoice(
          text: '🔦 Search for clues',
          nextSceneId: 'clues',
        ),
      ],
    ),
    StoryScene(
      id: 'forest',
      title: 'Two Paths',
      description:
      'After walking for several minutes, you reach a fork in the path. One path leads toward a cave. The other leads toward a tower.',
      emoji: '🛤️',
      choices: [
        StoryChoice(
          text: '🕳️ Enter the cave',
          nextSceneId: 'cave',
        ),
        StoryChoice(
          text: '🏰 Walk toward the tower',
          nextSceneId: 'tower',
        ),
      ],
    ),
    StoryScene(
      id: 'clues',
      title: 'The Hidden Symbol',
      description:
      'You discover a strange symbol carved into an old tree. Beneath it is a small silver key.',
      emoji: '🔍',
      choices: [
        StoryChoice(
          text: '🔑 Take the key',
          nextSceneId: 'key',
        ),
        StoryChoice(
          text: '🌲 Leave it and continue',
          nextSceneId: 'forest',
        ),
      ],
    ),
    StoryScene(
      id: 'key',
      title: 'The Secret Door',
      description:
      'The key begins glowing. A hidden door appears between two trees.',
      emoji: '🚪',
      choices: [
        StoryChoice(
          text: '🚪 Open the door',
          nextSceneId: 'good',
        ),
      ],
    ),
    StoryScene(
      id: 'cave',
      title: 'The Cave',
      description:
      'Inside the cave you find an enormous sleeping creature. You realize your footsteps have awakened it.',
      emoji: '🐉',
      choices: [
        StoryChoice(
          text: '🤫 Slowly leave',
          nextSceneId: 'run',
        ),
      ],
    ),
    StoryScene(
      id: 'tower',
      title: 'The Tower',
      description:
      'You reach an abandoned tower. At the top you find a treasure chest containing an ancient map.',
      emoji: '🏰',
      choices: [
        StoryChoice(
          text: '🗺️ Take the map',
          nextSceneId: 'good',
        ),
      ],
    ),
    StoryScene(
      id: 'run',
      title: 'You Escaped',
      description:
      'You decide that some mysteries are better left unsolved. You safely make it home before sunrise.',
      emoji: '🏠',
      choices: [],
      isEnding: true,
      isGoodEnding: false,
    ),
    StoryScene(
      id: 'good',
      title: 'The Secret Revealed',
      description:
      'You discover a hidden chamber containing an ancient journal. You have uncovered a mystery that has been forgotten for hundreds of years.',
      emoji: '🏆',
      choices: [],
      isEnding: true,
      isGoodEnding: true,
    ),
  ],
);